/* Analyst reconstruction from Frozen v1.7.7, not vendor source, not firmware.
 * Addresses use full BBIN file offset 0 -> 0x0800A000. Do not compile for a device.
 * Field names summarize semantics; see evidence-ledger.json and functions-final.
 */

/* 080157B4: discrete algorithm. Sample interval is part of gain selection. */
float pid_step(PID *s, float measured) {
    float error = s->target - measured;
    float p = s->config->kp * error;
    if (fabs(error) > s->config->integral_gate)
        s->sum = clamp(s->sum + error, s->config->imin, s->config->imax);
    float i = s->config->ki * s->sum;
    float d = s->config->kd * (error - s->previous_error);
    s->previous_error = error;
    s->last_p = p; s->last_i = i; s->last_d = d;
    return s->last_output = p + i + d;
}

/* 0801270C, config tables 08029714/778, 08029734/754, 080296D0/6F0. */
void select_pod6_pid(Controller *c, int mode, bool hardware_predicate_0801fbf4) {
    if (mode == 0) { /* normal */
        gains(c, .3f, .005f, .2f, -200, 200); period(c, 2000);
        cooling_limiter_init(c, .67f, .5f);
    } else if (!hardware_predicate_0801fbf4) { /* pillow */
        gains(c, .1f, .0002f, 2, -2500, 2500); period(c, 1000);
        cooling_limiter_init(c, 0, 0);
    } else { /* pillow */
        gains(c, .035f, .003f, .8f, -200, 200); period(c, 2000);
        cooling_limiter_init(c, 0, 0);
    }
}

/* 0801BB28. Caller provides now in milliseconds. */
float cooling_limit_step(Limiter *s, float demand, float error, uint32_t now) {
    s->actually_clamped = false;
    if (s->initial_ceiling <= 0 || s->disabled || error >= -s->gate) {
        s->active = false; s->best_abs_error = INFINITY;
        s->clamped_since_progress = false; s->last_progress = now;
        s->stall_suppressed = false;
        return demand;
    }
    if (fabs(error) < s->best_abs_error - .1f) {
        s->best_abs_error = fabs(error); s->last_progress = now;
        s->clamped_since_progress = false; s->stall_suppressed = false;
    } else if (!s->stall && elapsed(now,s->last_progress) >= 180000) {
        if (s->clamped_since_progress) { s->stall = true; s->last_raise = now; }
        else s->stall_suppressed = true;
    }
    float ceiling = s->stall ? s->relaxed_ceiling : s->initial_ceiling;
    if (s->stall && elapsed(now,s->last_raise) >= 30000) {
        s->last_raise = now;
        s->relaxed_ceiling = ceiling = min(1.f,ceiling + .11f);
    }
    if (ceiling >= 1) { s->active = false; return demand; }
    float hysteresis_ceiling = ceiling - (s->active ? .05f : 0);
    s->active = demand < -hysteresis_ceiling;
    if (s->active) s->clamped_since_progress = true;
    if (demand < -ceiling) { s->actually_clamped = true; return -ceiling; }
    return demand;
}

/* 0801E408, with helper names substituted. */
void thermostat_tick(Thermostat *s) {
    if (!s->enabled || !period_elapsed(&s->timer)) return;
    observe_dewpoint_and_set_target(s); /* actual target=clamp(requested,-10,42) */
    if (!temperature_valid(s->water)) return;
    float old_sum = s->pid.sum;
    float demand = pid_step(&s->pid, s->water->celsius);
    float error = s->pid.target - s->water->celsius;
    float limited = cooling_limit_step(&s->limiter, demand, error, millis());
    if (s->limiter.actually_clamped) s->pid.sum = old_sum;
    float low=-1.f, high=1.f;
    if (s->extra_limit_enabled && temperature_valid(s->extra_sensor)) {
        high=.8f;
        if (fabs(s->extra_sensor->celsius - s->requested) <= 4.f) low=-.8f;
    }
    s->pre_final_limit = limited;
    s->final_output = clamp(limited,low,high);
    tec_set_signed(s->tec,s->final_output);
}

/* 0801E0F8/0801E2F0: preserve the distinction between observation and action. */
void observe_dewpoint_and_set_target(Thermostat *s) {
    float dewpoint;
    if (dewpoint_valid(s->environment,&dewpoint)) {
        bool would_throttle = s->requested < dewpoint - 1.f;
        if (would_throttle != s->dewpoint_observation)
            log(would_throttle ? "would start" : "would stop");
        s->dewpoint_observation = would_throttle;
    }
    s->pid.target = clamp(s->requested,-10.f,42.f);
}

/* 08012968/08012CB4: actual fast-ramp source; cmd44 bit3 is NOT this. */
void set_performance_for_target(FrozenSide *s) {
    bool max_performance = s->requested_temperature < 11.f;
    pump_performance_flag(s->pump,max_performance);
    tec_ramp_step(s->tec,max_performance ? .005f : .001f);
    s->thermostat.limiter.disabled = max_performance;
}

/* 0801D220, 0801CBC4, 0801CB74. Normal TEC tick period =100ms. */
void tec_set_signed(TEC *s, float value) {
    s->requested_direction = value >= 0 ? HEAT : COOL;
    s->requested_magnitude = fabs(clamp(value,-1.f,1.f));
}
void tec_normal_tick(TEC *s) {
    if (!period_elapsed(&s->timer)) return;
    int reason = tec_safety(s->safety);
    if (reason) { pwm(s,0); disable_output(s); s->magnitude=0; enter_lockout(s); return; }
    float next=0;
    if (s->requested_direction == s->direction) {
        next=min(s->requested_magnitude,s->magnitude+s->ramp_step);
        pwm(s,min(next,s->config->max_duty));
    } else pwm(s,0);
    s->magnitude=next;
    if (next==0 && s->requested_direction != s->direction) {
        disable_output(s); set_direction_pin(s,s->requested_direction);
        enter_turnaround(s,max(s->config->turnaround_ms,500));
    }
}

/* 0801C174: -1 is invalid current sentinel. state4 is sensor-untrusted bypass. */
bool overcurrent_step(OC *s, float amps, uint32_t now) {
    bool high = amps != -1.f && amps > 30.f;
    switch (s->state) {
    case 0: if (high) { s->state=1; s->since=now; } return false;
    case 1:
        if (!high) { s->state=0; s->since=now; return false; }
        if (elapsed(now,s->since)>=500) { s->state=2; s->since=now; return true; }
        return false;
    case 2:
        if (elapsed(now,s->since)<3000) return true;
        s->since=now;
        s->state=high ? 4 : 3;
        return !high;
    case 3: return true;  /* no longer high after cut, including -1 sentinel; latch off */
    case 4: return false; /* still high with TEC off; ignore current guard this boot */
    }
}

/* 0800EB50: direct NTC conversion, result checked against -40<T<125. */
float ntc_celsius(float volts) {
    if (!(volts>.01f && volts<3.29f)) return -999.f;
    float resistance=7150.f*volts/(3.3f-volts)-170.f;
    if (!(resistance>0)) return -999.f;
    float t=1.f/(logf(resistance/10000.f)/3950.f + 1.f/298.15f)-273.15f;
    return t>-40.f && t<125.f ? t : -999.f;
}

/* 08021E44 / 08021E78, used by priming water level and RPM/current paths. */
void average_push(Average *a,float x) {
    a->sum += x-a->ring[a->index]; a->ring[a->index]=x;
    if (++a->index==a->length) a->index=0;
}
float average_read(Average *a) { return a->sum/a->length; }

/* 08016C44 FILL branch: nominal per-side curve before masks/primed-side easing. */
float priming_fill_duty(float level_percent) {
    if (level_percent<=12.5f) return 0;
    if (level_percent<25.f) return (level_percent-12.5f)/12.5f;
    if (level_percent<50.f) return 1;
    if (level_percent<100.f) return 1.f-.9f*(level_percent-50.f)/50.f;
    return .1f;
}
/* Full priming state bodies are in functions-final/08016c44.txt and 08015fd0.txt.
 * This sketch deliberately omits the full hysteresis/drop-test/kink submachine;
 * it must not be used as a replacement for the full firmware control logic.
 */
