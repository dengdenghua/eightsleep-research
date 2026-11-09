"""Synthetic normal Jetlag contracts. No APK execution, network, account or device.
Only fixed-offset datetime examples; does not emulate Android lifecycle/DST/Room.
"""
from datetime import datetime, timezone, timedelta
from collections import OrderedDict
from pathlib import Path
import json, struct

def reinterpret(instant, device_minutes, task_minutes):
    device=timezone(timedelta(minutes=device_minutes));target=timezone(timedelta(minutes=task_minutes))
    return instant.astimezone(device).replace(tzinfo=None).replace(tzinfo=target).astimezone(timezone.utc)
def keydate(t, device_minutes=0):
    return reinterpret(t['time'],device_minutes,t.get('offset',0)).astimezone(timezone(timedelta(minutes=device_minutes))).date().isoformat()
def group(tasks):
    pre={};flight=OrderedDict();post=[];pending=[]
    for t in tasks:
        if t['phase']=='PRE':pre.setdefault(keydate(t),[]).append(t)
        elif t['phase']=='IN':flight.setdefault(t.get('leg'),[]).append(t)
        elif t['phase']=='POST':
            pending.append(t)
            if t['type']=='SLEEP':post.append(pending);pending=[]
    return OrderedDict([('PRE',[pre[k] for k in sorted(pre)]),('IN',list(flight.values())),('POST',post)])
def statuses(groups, now):
    seen=False;out=[]
    for phase,phasegroups in groups.items():
        for g in phasegroups:
            for t in g:
                if t['time']<now:s='PAST'
                elif not seen:s='CURRENT';seen=True
                else:s='FUTURE'
                out.append({'id':t['id'],'schedule':s,'complete':t.get('complete',False)})
    return out

def active_trip(trips):
    return next((x['id'] for x in trips if x['status'] in ('PLANNING','ACTIVE')),None)
def home_phase(tasks,today):
    return next((x['phase'] for x in tasks if keydate(x)==today),None)

def countdown(hours):
    if -(2**31)<=hours<1:return 'In Flight'
    if 0<=hours<2:return '<1h'
    if 1<=hours<49:return str(hours)+'h'
    return str(int(hours/24))+' days'
def progress(completed,total):
    assert total>0
    f32=lambda x:struct.unpack('f',struct.pack('f',x))[0]
    return f32(f32(completed)/f32(total))
def update_trace(ids, complete, count, success):
    status='COMPLETE' if complete else 'PENDING';inverse='PENDING' if complete else 'COMPLETE'
    records=[{'id':i,'type':ty,'status':status,'metadata':{'capsuleCount':count if ty=='SUPPLEMENT' else None,'legId':None}} for i,ty in ids]
    events=[{'event':'local_update','records':records},{'event':'request','tasks':[{'id':x['id'],'status':status,'supplementCount':x['metadata']['capsuleCount']} for x in records]}]
    if not success:events.append({'event':'error_status_update','records':[dict(x,status=inverse) for x in records]})
    return events

def main():
    now=datetime(2026,11,8,12,tzinfo=timezone.utc)
    def t(i,phase='PRE',h=0,day=0,ty='LIGHT',leg='A',complete=False,offset=0):return {'id':i,'phase':phase,'time':now+timedelta(days=day,hours=h),'type':ty,'leg':leg,'complete':complete,'offset':offset}
    cases=[]
    def check(name,got,want,source):
        assert got==want,(name,got,want)
        cases.append({'name':name,'observed':got,'expected':want,'pass':True,'source_contract':source,'input_kind':'synthetic'})
    ids=lambda gs:[[x['id'] for x in g] for g in gs]
    g=group([t('post','POST',ty='SLEEP'),t('in','IN'),t('pre','PRE')]);check('phase_order',list(g),['PRE','IN','POST'],'groupTasksByPhaseAndDate')
    g=group([t('tomorrow',day=1),t('late',h=5),t('early',h=1)]);check('pre_date_sort_not_task_sort',ids(g['PRE']),[['late','early'],['tomorrow']],'groupByTaskDate')
    g=group([t('B1','IN',leg='B'),t('A1','IN',leg='A'),t('B2','IN',leg='B')]);check('flight_leg_encounter_order',ids(g['IN']),[['B1','B2'],['A1']],'groupTasksByPhaseAndDate')
    g=group([t('light','POST'),t('sleep1','POST',ty='SLEEP'),t('sleep2','POST',ty='SLEEP')]);check('post_sleep_terminators',ids(g['POST']),[['light','sleep1'],['sleep2']],'groupPostFlights')
    check('post_unterminated_tail_not_emitted',ids(group([t('sleep','POST',ty='SLEEP'),t('tail','POST')])['POST']),[['sleep']],'groupPostFlights')
    st=statuses(group([t('past',h=-1),t('equal',h=0),t('next',h=1)]),now);check('instant_equal_first_current',[x['schedule'] for x in st],['PAST','CURRENT','FUTURE'],'mapPlanToUiModel')
    st=statuses(group([t('pre',h=2),t('in','IN',h=1),t('post','POST',ty='SLEEP',h=3)]),now);check('current_global_not_per_phase',[x['schedule'] for x in st],['CURRENT','FUTURE','FUTURE'],'mapPlanToUiModel')
    st=statuses(group([t('later',h=3),t('nearer',h=1)]),now);check('current_follows_encounter_order',[x['id'] for x in st if x['schedule']=='CURRENT'],['later'],'mapPlanToUiModel')
    st=statuses(group([t('done',h=0,complete=True)]),now);check('completion_independent_of_schedule',st,[{'id':'done','schedule':'CURRENT','complete':True}],'mapPlanToUiModel')
    check('all_past_no_current',[x['schedule'] for x in statuses(group([t('old',h=-1)]),now)],['PAST'],'mapPlanToUiModel')
    check('progress_two_of_three_float32',progress(2,3),0.6666666865348816,'ng/l -> j0/y3 -> P2/n.m -> mg/h -> mg/g')
    check('progress_complete',progress(3,3),1.0,'mg/g.invoke')
    check('post_night_index_mod_current_group_count',(4%3)+1,2,'mapPlanToUiModel rem-int at line 1786')
    check('timezone_reinterpret_utc_plus8',reinterpret(now,0,480).isoformat(),'2026-11-08T04:00:00+00:00','Ga/s.n')
    check('timezone_reinterpret_device_plus8_target_plus8',reinterpret(now,480,480).isoformat(),now.isoformat(),'Ga/s.n')
    for hours,want in [(-1,'In Flight'),(0,'In Flight'),(1,'<1h'),(2,'2h'),(48,'48h'),(49,'2 days')]:check('countdown_'+str(hours),countdown(hours),want,'formatTimeUntilDeparture')
    e=update_trace([('s','SUPPLEMENT'),('l','LIGHT')],True,2,True);check('optimistic_before_request',[x['event'] for x in e],['local_update','request'],'PlanRepository.updateTasks')
    check('supplement_only_count',[x['supplementCount'] for x in e[1]['tasks']],[2,None],'PlanRepository.updateTasks')
    e=update_trace([('s','SUPPLEMENT')],True,2,False);check('error_inverse_status_new_metadata',e[-1]['records'][0],{'id':'s','type':'SUPPLEMENT','status':'PENDING','metadata':{'capsuleCount':2,'legId':None}},'Ao/l case8')
    check('first_planning_or_active',active_trip([{'id':'done','status':'COMPLETED'},{'id':'planned','status':'PLANNING'},{'id':'active','status':'ACTIVE'}]),'planned','hc/v.invokeSuspend')
    check('no_active_trip',active_trip([{'id':'done','status':'COMPLETED'}]),None,'hc/v.invokeSuspend')
    check('home_phase_first_same_day',home_phase([t('pre','PRE'),t('in','IN')],'2026-11-08'),'PRE','gc/c.a + gc/e cached date')
    check('home_phase_none_today',home_phase([t('tomorrow',day=1)],'2026-11-08'),None,'gc/c.a')
    out={'schema':1,'kind':'finite synthetic reimplementation','apk_executed':False,'network_accessed':False,'cases':cases,'passed':len(cases),'limitations':['Not Android/Room/HTTP execution','Fixed offsets only: DST and runtime timezone changes not modeled','No production plan or personal data','Grouping receives a declared ordered list; Room SQL lacks ORDER BY in inspected relation','No cloud plan generation, notification delivery, error-frequency or clinical effectiveness inference']}
    (Path(__file__).resolve().parents[1]/'MODEL_RESULTS.json').write_text(json.dumps(out,ensure_ascii=False,indent=2)+'\n')
    print(len(cases),'synthetic cases PASS')
if __name__=='__main__':main()
