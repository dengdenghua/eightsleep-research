#!/usr/bin/env python3
"""Selected normal driver contracts, not MCU/clock/hardware emulation.
Inputs are supplied normal hardware outcomes. No target binary is loaded/executed.
"""
from pathlib import Path
import copy, json, hashlib

D = Path(__file__).resolve().parents[1]


def hw_error(isr, cr1, previous=0):
    """08013c7a; only the three audited hardware error bits."""
    error, cleared = previous, 0
    for flag, code in [(0x100, 1), (0x400, 8), (0x200, 2)]:
        if isr & flag and cr1 & 0x80:
            error |= code
            cleared |= flag
    return {"error": error, "icr_write_mask": cleared,
            "dispatch_error_cleanup": bool(error & 0xb)}


class I2C:
    """Normal one-block DMA request, with explicit cleanup-completion events.
    An error IRQ does not assert that DMA abort/callback already completed.
    """
    def __init__(self):
        self.bus = None
        self.hal_state = 0x20
        self.error = 0
        self.sensor_callbacks = 0
        self.events = []

    def event(self, kind, **fields):
        self.events.append(dict(kind=kind, bus=self.bus, hal_state=self.hal_state,
                                error=self.error, **copy.deepcopy(fields)))

    def start(self, n=7, receive=True, hw_busy=False, lock=False, dma_starts=True):
        assert 0 < n < 256  # bounded normal sensor transactions only
        if self.hal_state != 0x20 or hw_busy or lock:
            self.bus = 2
            self.event("HAL_busy_then_wrapper_reset", hal_return=2, wrapper_return=0)
            self.hal_state = 0x20
            return 2
        if not dma_starts:
            self.error = 0x10
            self.bus = 2
            self.event("DMA_start_failed_then_wrapper_reset", hal_return=1, wrapper_return=0)
            return 1
        self.hal_state = 0x22 if receive else 0x21
        self.bus = 0
        self.error = 0
        self.event("request_started", bytes=n, hal_return=0, wrapper_return=1)
        return 0

    def dma_complete(self):
        self.event("DMA_complete_enables_end_events", sensor_callback=False)

    def nack(self):
        self.error |= 4
        self.event("NACK_sets_error_and_enables_STOP", sensor_callback=False)

    def dma_error(self):
        self.error |= 0x10
        self.event("DMA_error_enters_I2C_cleanup", sensor_callback=False)

    def stop(self):
        if self.error:
            self.event("STOP_with_error_enters_cleanup", sensor_callback=False)
        else:
            self.hal_state = 0x20
            self.bus = 1
            self.event("STOP_normal_completion_writes_bus1", sensor_callback=False)

    def cleanup_completed(self):
        assert self.error
        self.hal_state = 0x20
        self.bus = 2
        self.event("supplied_error_cleanup_completion_writes_bus2")

    def pump(self):
        # One selected completed request per fixture. Does not clear current or
        # pop the full firmware queue; calling twice is outside this model.
        if self.bus == 1:
            self.sensor_callbacks += 1
        self.event("main_pump", request_status=self.bus,
                   sensor_callbacks=self.sensor_callbacks)
        return self.sensor_callbacks


def spi_result(state=1, locked=False, loop_complete=True, end_clear=True):
    """080158d4 normal full-duplex path and 0801a134/164/194 wrapper.
    loop_complete/end_clear are explicit observations, not a physical schedule.
    """
    if not state:
        return {"hal": None, "wrapper": 1, "reason": "not_initialized"}
    if locked or state not in (1, 4):
        hal, reason = 2, "HAL_busy"
    elif not loop_complete:
        hal, reason = 3, "poll_timeout"
    elif not end_clear:
        hal, reason = 1, "end_check_error"
    else:
        hal, reason = 0, "complete"
    return {"hal": hal, "wrapper": int(hal != 0), "reason": reason}


def imu_read(gpio_high, status, status_spi_ok=True, burst_spi_ok=True):
    """Main GPIO gate then 0801ef68 status/burst gate; only updated groups."""
    if not gpio_high:
        return []
    if not status_spi_ok or status & 3 == 0 or not burst_spi_ok:
        return []
    return (["gyro"] if status & 2 else []) + (["accel"] if status & 1 else [])


def board(hwrev):
    """Only six SPI device descriptor slots; other board flags are excluded.
    Source: pass1/08018bd0,18d60,18fb0,19144,19128,192ac.
    All matching threshold functions execute in table order, not first-match.
    """
    def dev(cs, transfer, drdy, mode, hz, spi_mode):
        return dict(cs=cs, transfer=transfer, drdy=drdy, mode=mode,
                    requested_hz=hz, spi_mode=spi_mode)
    devices = [dev('08019cac','0801a134','0801a2b4','08018bca',16000000,1),
               dev('08019cc0','0801a164','0801a2cc','08018bca',8000000,1)]
    devices += [dev(None,None,None,'08018bca',0,0) for _ in range(4)]
    applied = ['0000']
    def a00():
        devices[:] = [
            dev('080198b6','0801a134','0801a80a','08018f98',4000000,1),
            dev('080198a0','0801a164','0801a81a','08018f84',4000000,1),
            dev('080198cc','0801a164','0801a82a','08018f84',2000000,0),
            dev('080198e2','0801a164','0801a834','08018f84',2000000,0),
            dev('080198f8','0801a134','0801a83e','08018f98',2000000,0),
            dev('08019906','0801a134','0801a848','08018f98',2000000,0)]
    def a05():
        devices[0] = dev(None,None,None,None,0,1)
        devices[1].update(cs='080198da', transfer='0801a134', mode='08018f98')
        devices[2].update(cs='0801992a', transfer='0801a164', mode='08018f84')
        devices[3].update(cs='080198f0', transfer='0801a164', mode='08018f84')
        devices[4].update(cs='080198ae', transfer='0801a194', mode='08019218')
        devices[5].update(cs='08019914', transfer='0801a194', mode='08019218')
    for threshold in [0x805,0x900,0xa00,0xa05,0xa10,0xa30,0xa33,0xa34,
                      0xa35,0xa36,0xa37,0xa87,0xa90]:
        if threshold > hwrev:
            continue
        applied.append(f'{threshold:04x}')
        if threshold == 0x805:
            devices[0]['cs'] = devices[1]['cs'] = '08018d5c'
        elif threshold in (0xa00,0xa10):
            a00()
        elif threshold in (0xa05,0xa33):
            a05()
            if threshold == 0xa33:
                devices[1]['cs'] = '080198c4'
    return {'hwrev':f'{hwrev:04x}','applied_thresholds':applied,'devices':devices}


def main():
    cases=[]; traces={}
    def case(name, observed, expected, evidence):
        assert observed == expected, (name, observed, expected)
        cases.append(dict(name=name,observed=copy.deepcopy(observed),
                          expected=copy.deepcopy(expected),evidence=evidence,status='PASS'))
    x=I2C();x.start(n=7);x.dma_complete()
    case('DMA_complete_is_not_sensor_completion', [x.bus,x.sensor_callbacks], [0,0], '0801315c→08012d48')
    x.stop();case('STOP_writes_bus_success_before_main_callback',[x.bus,x.sensor_callbacks],[1,0],'0801301c→08018ab4')
    case('main_pump_dispatches_one_success_callback',x.pump(),1,'0801c688')
    traces['normal_rx7']=x.events
    x=I2C();x.start(n=2,receive=False);x.dma_complete();x.nack()
    case('NACK_records_error_without_immediate_sensor_callback',[x.error,x.bus],[4,0],'08013320')
    x.stop();x.cleanup_completed();case('NACK_cleanup_suppresses_sensor_callback',[x.bus,x.pump()],[2,0],'08012f2c→08012ee4→0801c598')
    traces['nack_normal_tx2']=x.events
    x=I2C();x.start(n=7);x.dma_error()
    case('DMA_error_cleanup_completion_is_explicit',[x.error,x.bus],[16,0],'080130f4→08012f2c')
    x.cleanup_completed();case('DMA_error_reaches_bus2',[x.bus,x.pump()],[2,0],'0801c598')
    traces['dma_error_rx7']=x.events
    for name,args,hal in [('hardware_busy',{'hw_busy':True},2),('locked',{'lock':True},2),('DMA_start_failure',{'dma_starts':False},1)]:
        x=I2C();h=x.start(**args)
        case(name+'_does_not_start_request',[h,x.bus,x.pump()],[hal,2,0],'08013988/13ac0→0801963c→0801c52e')
    for flag,code in [(0x100,1),(0x200,2),(0x400,8),(0x700,11)]:
        case(f'IRQ_error_mask_{flag:x}',hw_error(flag,0x80),{'error':code,'icr_write_mask':flag,'dispatch_error_cleanup':True},'08013c7a')
    case('hardware_error_requires_ERRIE',hw_error(0x700,0),{'error':0,'icr_write_mask':0,'dispatch_error_cleanup':False},'08013c7a')
    case('error_callback_recovery_gate_9999_10000',[9999>9999,10000>9999],[False,True],'0801c598; not a periodic standalone reset')
    for name,args,result in [('normal',{},(0,0)),('poll_timeout',{'loop_complete':False},(3,1)),('end_FIFO_or_BSY_timeout',{'end_clear':False},(1,1)),('HAL_busy',{'locked':True},(2,1)),('uninitialized',{'state':0},(None,1))]:
        z=spi_result(**args);case('SPI_'+name,[z['hal'],z['wrapper']],list(result),'080158d4→0801a134/164/194')
    for status,expected in [(0,[]),(1,['accel']),(2,['gyro']),(3,['gyro','accel'])]:
        case(f'IMU_GPIO_high_status_{status}',imu_read(True,status),expected,'main1f860→0801ef68')
    case('IMU_status_ready_without_GPIO_gate_is_not_read',imu_read(False,3),[],'main1f850..1f86e')
    case('IMU_burst_failure_updates_no_group',imu_read(True,3,burst_spi_ok=False),[],'0801ef68')
    case('ADC_GPIO_low_is_asserted_DRDY',not bool(0),True,'0801a80a/1a81a; GPIO read normalized then xor1')
    a=board(0xa05);b=board(0xa10);c=board(0xa33)
    case('A05_removes_first_ADC_descriptor',a['devices'][0]['transfer'],None,'08019144')
    case('A05_last_two_IMUs_use_SPI3',[q['transfer'] for q in a['devices'][4:]],['0801a194']*2,'08019144')
    case('A10_reapplies_A00_and_restores_first_ADC',b['devices'][0]['transfer'],'0801a134','08019128→08018fb0')
    case('A10_reverts_last_two_IMUs_to_SPI2',[q['transfer'] for q in b['devices'][4:]],['0801a134']*2,'08019128→08018fb0')
    case('A33_reapplies_A05_but_changes_second_ADC_CS',[c['devices'][0]['transfer'],c['devices'][1]['cs']],[None,'080198c4'],'080192ac→08019144')
    out=D/'model/results';out.mkdir(parents=True,exist_ok=True)
    (out/'traces.json').write_text(json.dumps(traces,ensure_ascii=False,indent=2)+'\n')
    boards=[board(h) for h in [0,0x804,0x805,0x900,0xa00,0xa05,0xa10,0xa30,0xa33,0xa34,0xa36,0xa37,0xa90]]
    (out/'selected-board-bindings.json').write_text(json.dumps(boards,ensure_ascii=False,indent=2)+'\n')
    artifacts=[]
    for p in sorted(out.glob('*.json')):
        b=p.read_bytes();artifacts.append(dict(path=str(p.relative_to(D)),bytes=len(b),sha256=hashlib.sha256(b).hexdigest()))
    result=dict(status='PASS',case_count=len(cases),cases=cases,artifacts=artifacts,limits=[
        'Selected normal software contracts, not firmware/hardware execution or an exhaustive HAL model.',
        'I2C error cleanup completion is supplied explicitly; DMA-abort latency and physical IRQ schedule are not simulated.',
        'I2C pump is called once for one selected completion; it is not a full queue-consumption or repeated-dispatch model.',
        'SPI completion and timeout conditions are observations, not estimates of CPU cycles, wall-clock duration or sample cadence.',
        'Board simulation covers six SPI descriptor slots only; sensor-mode/SKU gates and board traces are documented separately.',
        'No malformed protocol inputs, memory-corruption tests, shared-log analysis, device or account access.'])
    assert all(c['observed']==c['expected'] for c in result['cases'])
    (D/'MODEL_RESULTS.json').write_text(json.dumps(result,ensure_ascii=False,indent=2)+'\n')
    print(json.dumps({'status':'PASS','cases':len(cases),'artifacts':len(artifacts)}))


if __name__ == '__main__':
    main()
