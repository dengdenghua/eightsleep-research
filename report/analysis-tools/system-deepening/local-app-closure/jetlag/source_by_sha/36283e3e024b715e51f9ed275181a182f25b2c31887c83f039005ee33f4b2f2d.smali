.class public final LJd/g;
.super LE4/i;
.source "SourceFile"


# instance fields
.field public final synthetic e:I

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Lcom/eightsleep/eight/AppDatabase_Impl;I)V
    .locals 0

    iput p3, p0, LJd/g;->e:I

    iput-object p1, p0, LJd/g;->f:Ljava/lang/Object;

    invoke-direct {p0, p2}, LE4/C;-><init>(LE4/t;)V

    return-void
.end method

.method private final B(LL4/f;Ljava/lang/Object;)V
    .locals 3

    check-cast p2, Lrd/g;

    iget-object v0, p2, Lrd/g;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget-object p0, p0, LJd/g;->f:Ljava/lang/Object;

    check-cast p0, Lkc/i;

    const/4 v0, 0x0

    iget-object v1, p2, Lrd/g;->b:Ljava/time/LocalDate;

    if-nez v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    invoke-static {p0}, Lkc/i;->b(Lkc/i;)Lxc/g;

    move-result-object v2

    invoke-virtual {v2, v1}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    const/4 v2, 0x2

    if-nez v1, :cond_1

    invoke-interface {p1, v2}, LL4/d;->M(I)V

    goto :goto_1

    :cond_1
    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1
    iget-object v1, p2, Lrd/g;->c:Ljava/time/LocalDate;

    if-nez v1, :cond_2

    move-object v1, v0

    goto :goto_2

    :cond_2
    invoke-static {p0}, Lkc/i;->b(Lkc/i;)Lxc/g;

    move-result-object v2

    invoke-virtual {v2, v1}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v1

    :goto_2
    const/4 v2, 0x3

    if-nez v1, :cond_3

    invoke-interface {p1, v2}, LL4/d;->M(I)V

    goto :goto_3

    :cond_3
    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3
    iget-object v1, p2, Lrd/g;->d:Lcom/eightsleep/data_temperature/data/model/PregnancyModeResponse;

    if-nez v1, :cond_4

    goto :goto_4

    :cond_4
    invoke-static {p0}, Lkc/i;->c(Lkc/i;)Lpd/a;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lpd/a;->a:Lcom/squareup/moshi/Moshi;

    const-class v0, Lcom/eightsleep/data_temperature/data/model/PregnancyModeResponse;

    invoke-virtual {p0, v0}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object p0

    invoke-virtual {p0, v1}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string p0, "toJson(...)"

    invoke-static {v0, p0}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_4
    const/4 p0, 0x4

    if-nez v0, :cond_5

    invoke-interface {p1, p0}, LL4/d;->M(I)V

    goto :goto_5

    :cond_5
    invoke-interface {p1, p0, v0}, LL4/d;->g(ILjava/lang/String;)V

    :goto_5
    const/4 p0, 0x5

    iget-wide v0, p2, Lrd/g;->e:J

    invoke-interface {p1, p0, v0, v1}, LL4/d;->w(IJ)V

    const/4 p0, 0x6

    iget-object p2, p2, Lrd/g;->a:Ljava/lang/String;

    invoke-interface {p1, p0, p2}, LL4/d;->g(ILjava/lang/String;)V

    return-void
.end method

.method private final C(LL4/f;Ljava/lang/Object;)V
    .locals 8

    check-cast p2, Lwa/b;

    iget-object v0, p2, Lwa/b;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 v0, 0x2

    iget-object v1, p2, Lwa/b;->b:Ljava/lang/String;

    invoke-interface {p1, v0, v1}, LL4/d;->g(ILjava/lang/String;)V

    iget-object p0, p0, LJd/g;->f:Ljava/lang/Object;

    check-cast p0, Lva/c;

    iget-object v0, p2, Lwa/b;->c:Lcom/eightsleep/data_challenges/enums/ChallengeType;

    invoke-static {p0, v0}, Lva/c;->c(Lva/c;Lcom/eightsleep/data_challenges/enums/ChallengeType;)V

    const-string v0, "STREAK"

    const/4 v1, 0x3

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, p2, Lwa/b;->d:Lcom/eightsleep/data_challenges/enums/ChallengeState;

    invoke-static {p0, v0}, Lva/c;->a(Lva/c;Lcom/eightsleep/data_challenges/enums/ChallengeState;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lva/c;->f()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Lwa/b;->g:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lva/c;->f()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Lwa/b;->h:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x6

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lva/c;->f()Lxc/g;

    move-result-object v0

    iget-object v1, p2, Lwa/b;->i:Ljava/time/Instant;

    invoke-virtual {v0, v1}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x7

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, p2, Lwa/b;->e:Lwa/a;

    iget-object v1, v0, Lwa/a;->a:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    invoke-static {p0, v1}, Lva/c;->d(Lva/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x8

    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lva/c;->f()Lxc/g;

    move-result-object v1

    iget-object v2, v0, Lwa/a;->c:Ljava/time/LocalDate;

    invoke-virtual {v1, v2}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0x9

    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    const-string v1, "milestoneDayCounts"

    iget-object v2, v0, Lwa/a;->d:Ljava/util/List;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v4, 0x0

    const/16 v7, 0x3e

    const-string v3, ","

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v7}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xa

    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, Lwa/a;->b:Lwa/d;

    iget-object v1, v0, Lwa/d;->a:Lcom/eightsleep/data_challenges/enums/ChallengeTargetType;

    invoke-static {p0, v1}, Lva/c;->b(Lva/c;Lcom/eightsleep/data_challenges/enums/ChallengeTargetType;)Ljava/lang/String;

    move-result-object v1

    const/16 v2, 0xb

    invoke-interface {p1, v2, v1}, LL4/d;->g(ILjava/lang/String;)V

    const/16 v1, 0xc

    iget-object v0, v0, Lwa/d;->b:Ljava/lang/String;

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, p2, Lwa/b;->f:Lwa/c;

    iget v1, v0, Lwa/c;->a:I

    int-to-long v1, v1

    const/16 v3, 0xd

    invoke-interface {p1, v3, v1, v2}, LL4/d;->w(IJ)V

    iget-object v1, v0, Lwa/c;->b:Ljava/time/LocalDate;

    if-nez v1, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lva/c;->f()Lxc/g;

    move-result-object p0

    invoke-virtual {p0, v1}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object p0

    :goto_0
    const/16 v1, 0xe

    if-nez p0, :cond_1

    invoke-interface {p1, v1}, LL4/d;->M(I)V

    goto :goto_1

    :cond_1
    invoke-interface {p1, v1, p0}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1
    const/16 p0, 0xf

    iget-object v1, v0, Lwa/c;->c:Ljava/lang/Integer;

    if-nez v1, :cond_2

    invoke-interface {p1, p0}, LL4/d;->M(I)V

    goto :goto_2

    :cond_2
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-long v1, v1

    invoke-interface {p1, p0, v1, v2}, LL4/d;->w(IJ)V

    :goto_2
    const/16 p0, 0x10

    iget-object v0, v0, Lwa/c;->d:Ljava/lang/Integer;

    if-nez v0, :cond_3

    invoke-interface {p1, p0}, LL4/d;->M(I)V

    goto :goto_3

    :cond_3
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    int-to-long v0, v0

    invoke-interface {p1, p0, v0, v1}, LL4/d;->w(IJ)V

    :goto_3
    const/16 p0, 0x11

    iget-object p2, p2, Lwa/b;->a:Ljava/lang/String;

    invoke-interface {p1, p0, p2}, LL4/d;->g(ILjava/lang/String;)V

    return-void
.end method

.method private final D(LL4/f;Ljava/lang/Object;)V
    .locals 3

    check-cast p2, Lwb/a;

    iget-object v0, p2, Lwb/a;->a:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    iget v0, p2, Lwb/a;->b:I

    int-to-long v0, v0

    const/4 v2, 0x2

    invoke-interface {p1, v2, v0, v1}, LL4/d;->w(IJ)V

    iget-object p0, p0, LJd/g;->f:Ljava/lang/Object;

    check-cast p0, Lvb/a;

    iget-object v0, p0, Lvb/a;->e:Ljava/lang/Object;

    iget-object v0, p2, Lwb/a;->c:Ljava/time/Instant;

    invoke-static {v0}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x3

    if-nez v0, :cond_0

    invoke-interface {p1, v1}, LL4/d;->M(I)V

    goto :goto_0

    :cond_0
    invoke-interface {p1, v1, v0}, LL4/d;->g(ILjava/lang/String;)V

    :goto_0
    iget v0, p2, Lwb/a;->d:I

    int-to-long v0, v0

    const/4 v2, 0x4

    invoke-interface {p1, v2, v0, v1}, LL4/d;->w(IJ)V

    invoke-virtual {p0}, Lvb/a;->a()Lub/b;

    move-result-object v0

    iget-object v1, p2, Lwb/a;->e:Ljava/util/List;

    iget-object v0, v0, Lub/b;->c:LHm/p;

    invoke-virtual {v0}, LHm/p;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v0, v1}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "toJson(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v2, 0x5

    invoke-interface {p1, v2, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {p0}, Lvb/a;->a()Lub/b;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "value"

    iget-object v2, p2, Lwb/a;->f:Ljava/util/List;

    invoke-static {v2, v0}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object p0, p0, Lub/b;->e:LHm/p;

    invoke-virtual {p0}, LHm/p;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {p0, v2}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, v1}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x6

    invoke-interface {p1, v0, p0}, LL4/d;->g(ILjava/lang/String;)V

    const/4 p0, 0x7

    iget-wide v0, p2, Lwb/a;->g:J

    invoke-interface {p1, p0, v0, v1}, LL4/d;->w(IJ)V

    const/16 p0, 0x8

    iget-object p2, p2, Lwb/a;->a:Ljava/lang/String;

    invoke-interface {p1, p0, p2}, LL4/d;->g(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final f()Ljava/lang/String;
    .locals 0

    iget p0, p0, LJd/g;->e:I

    packed-switch p0, :pswitch_data_0

    const-string p0, "UPDATE `v2_aggregate_envelope_cache` SET `user_id` = ?,`from_date` = ?,`to_date` = ?,`bucket` = ?,`metrics_key` = ?,`envelope_json` = ?,`fetched_at_ms` = ? WHERE `user_id` = ? AND `from_date` = ? AND `to_date` = ? AND `bucket` = ? AND `metrics_key` = ?"

    return-object p0

    :pswitch_0
    const-string p0, "UPDATE `health_integration_metadata` SET `user_id` = ?,`total_data_points` = ?,`last_synced_at` = ?,`health_source_count` = ?,`health_sources` = ?,`activity_tags` = ?,`entity_updated_at` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_1
    const-string p0, "UPDATE `challenge` SET `id` = ?,`user_id` = ?,`type` = ?,`state` = ?,`created_at` = ?,`challenge_updated_at` = ?,`entity_updated_at` = ?,`definition_metric_id` = ?,`definition_start_date` = ?,`definition_milestone_day_counts` = ?,`definition_target_operator` = ?,`definition_target_value` = ?,`progress_day_count` = ?,`progress_last_evaluated_date` = ?,`progress_next_milestone_day_count` = ?,`progress_previous_milestone_day_count` = ? WHERE `id` = ?"

    return-object p0

    :pswitch_2
    const-string p0, "UPDATE `pregnancy_mode_state` SET `user_id` = ?,`lmp_date` = ?,`due_date` = ?,`response` = ?,`updated_at` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_3
    const-string p0, "UPDATE `nap_mode_settings` SET `user_id` = ?,`pod_level` = ?,`pillow_level` = ?,`duration` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_4
    const-string p0, "UPDATE `hot_flash_mode_settings` SET `user_id` = ?,`enabled` = ?,`duration` = ?,`level_delta` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_5
    const-string p0, "UPDATE `nap_mode_alarm_settings` SET `user_id` = ?,`vibration_power` = ?,`vibration_pattern` = ?,`vibration_enabled` = ?,`audio_track_id` = ?,`audio_enabled` = ?,`audio_volume` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_6
    const-string p0, "UPDATE `alarm` SET `id` = ?,`user_id` = ?,`enabled` = ?,`time` = ?,`dismissed_until` = ?,`skipped_until` = ?,`snoozed_until` = ?,`is_snoozing` = ?,`next_timestamp` = ?,`start_timestamp` = ?,`end_timestamp` = ?,`is_recommended` = ?,`created_at` = ?,`updated_at` = ?,`tags` = ?,`schedule_enabled` = ?,`schedule_weekly_schedule` = ?,`vibration_alarm_enabled` = ?,`vibration_alarm_power_level` = ?,`vibration_alarm_pattern` = ?,`thermal_alarm_enabled` = ?,`thermal_alarm_level` = ?,`smart_alarm_light_sleep_enabled` = ?,`smart_alarm_sleep_cap_enabled` = ?,`smart_alarm_sleep_cap_minutes` = ?,`audio_alarm_enabled` = ?,`audio_alarm_trackId` = ?,`audio_alarm_level` = ?,`one_time_override_time` = ?,`one_time_override_thermal_alarm_enabled` = ?,`one_time_override_thermal_alarm_level` = ?,`one_time_override_vibration_alarm_enabled` = ?,`one_time_override_vibration_alarm_power_level` = ?,`one_time_override_vibration_alarm_pattern` = ?,`one_time_override_smart_alarm_light_sleep_enabled` = ?,`one_time_override_smart_alarm_sleep_cap_enabled` = ?,`one_time_override_smart_alarm_sleep_cap_minutes` = ?,`one_time_override_audio_alarm_enabled` = ?,`one_time_override_audio_alarm_trackId` = ?,`one_time_override_audio_alarm_level` = ? WHERE `id` = ?"

    return-object p0

    :pswitch_7
    const-string p0, "UPDATE `offline_mode_data` SET `device_id` = ?,`mac_address` = ?,`last_updated` = ?,`security_key_key` = ?,`security_key_expires_at` = ? WHERE `device_id` = ?"

    return-object p0

    :pswitch_8
    const-string p0, "UPDATE OR ABORT `jet_lag_plan_task` SET `id` = ?,`type` = ?,`status` = ?,`metadata` = ? WHERE `id` = ?"

    return-object p0

    :pswitch_9
    const-string p0, "UPDATE `ai_insight_settings` SET `user_id` = ?,`priority_metrics_list` = ?,`length` = ?,`tone` = ?,`last_updated` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_a
    const-string p0, "UPDATE `ai_insight` SET `id` = ?,`user_id` = ?,`state` = ?,`type` = ?,`createdAt` = ?,`text_eyebrow` = ?,`text_title` = ?,`text_titleQuestion` = ?,`text_body` = ?,`text_findings` = ?,`text_interpretation` = ?,`text_actionableRecommendation` = ?,`text_explanation` = ?,`text_physiologyExplanation` = ?,`text_specificActionableTip` = ?,`context_model` = ?,`context_day` = ?,`context_sleep_state` = ?,`context_sentiment` = ?,`context_length` = ?,`context_tone` = ?,`context_tagId` = ?,`context_tagName` = ?,`context_tagCount` = ?,`context_variations_podAiInsightQuality` = ?,`recommendation_tags` = ?,`recommendation_temperature_bedtime_level` = ?,`recommendation_temperature_initial_level` = ?,`recommendation_temperature_final_level` = ?,`feedback_acceptance` = ?,`feedback_rating` = ?,`feedback_comment` = ?,`feedback_sentAt` = ?,`data_chart_type` = ?,`data_metrics` = ?,`data_comparison_baseline_label` = ?,`data_comparison_baseline_value` = ?,`data_comparison_baseline_metricId` = ?,`data_comparison_current_label` = ?,`data_comparison_current_value` = ?,`data_comparison_current_metricId` = ?,`data_highlight_current_label` = ?,`data_highlight_current_value` = ?,`data_highlight_current_metricId` = ?,`data_timeseries_x_label` = ?,`data_timeseries_x_values` = ?,`data_timeseries_x_threshold` = ?,`data_timeseries_x_metricId` = ?,`data_timeseries_y_label` = ?,`data_timeseries_y_values` = ?,`data_timeseries_y_threshold` = ?,`data_timeseries_y_metricId` = ? WHERE `id` = ?"

    return-object p0

    :pswitch_b
    const-string p0, "UPDATE `feature_flag_override` SET `name` = ?,`data` = ? WHERE `name` = ?"

    return-object p0

    :pswitch_c
    const-string p0, "UPDATE `insight` SET `user_id` = ?,`id` = ?,`title` = ?,`sentiment` = ?,`type` = ?,`message` = ?,`insight_created_at` = ?,`date` = ?,`local_created_at` = ? WHERE `id` = ?"

    return-object p0

    :pswitch_d
    const-string p0, "UPDATE `base_presets` SET `user_id` = ?,`presets` = ?,`lastUpdatedAt` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_e
    const-string p0, "UPDATE `household_user_return_date` SET `user_id` = ?,`set_id` = ?,`return_date` = ? WHERE `user_id` = ? AND `set_id` = ?"

    return-object p0

    :pswitch_f
    const-string p0, "UPDATE `health_survey` SET `user_id` = ?,`sleep_disorders` = ?,`sleep_disorders_other` = ?,`preexisting_conditions` = ?,`preexisting_conditions_other` = ?,`menstrual_cycle` = ?,`menstrual_cycle_other` = ?,`menopausal_symptoms` = ?,`menstrual_cycle_duration_days` = ?,`last_period_date` = ?,`behaviors` = ?,`exercise_frequency` = ?,`exercise_time` = ?,`room_temperature` = ?,`last_updated_at` = ?,`sleep_goals` = ?,`height_value` = ?,`height_unit` = ?,`weight_value` = ?,`weight_unit` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_10
    const-string p0, "UPDATE `onboarding_state` SET `user_id` = ?,`remote_state_onboarding_completion_timestamp` = ?,`remote_state_test_drive_completion_timestamp` = ?,`remote_state_pod_5_test_drive_completion_timestamp` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_11
    const-string p0, "UPDATE `tags_summary` SET `user_id` = ?,`id` = ?,`name` = ?,`count` = ?,`threshold` = ?,`last_tagged_at` = ? WHERE `user_id` = ? AND `id` = ?"

    return-object p0

    :pswitch_12
    const-string p0, "UPDATE `tags` SET `user_id` = ?,`date` = ?,`id` = ?,`name` = ?,`value` = ?,`source` = ?,`is_custom` = ? WHERE `user_id` = ? AND `date` = ? AND `id` = ?"

    return-object p0

    :pswitch_13
    const-string p0, "UPDATE `subscription` SET `user_id` = ?,`has_active_subscription` = ?,`has_expired_subscription` = ?,`capabilities` = ?,`expires_at` = ?,`owner_user_id` = ?,`owner_email_address` = ?,`has_basic` = ?,`has_access_to_basic_features` = ?,`has_access_to_premium_features` = ?,`is_unpaid_premium` = ?,`churned` = ?,`last_updated_at` = ?,`recapture_status_status` = ?,`recapture_status_reason` = ?,`recapture_status_expires_at` = ? WHERE `user_id` = ?"

    return-object p0

    :pswitch_14
    const-string p0, "UPDATE `remote_messages` SET `user_id` = ?,`remote_messages` = ?,`lastUpdatedAt` = ? WHERE `user_id` = ?"

    return-object p0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final x(LL4/f;Ljava/lang/Object;)V
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/16 v11, 0xc

    const/16 v12, 0xb

    const/16 v13, 0xa

    const/16 v14, 0x9

    const/16 v15, 0x8

    const/4 v2, 0x7

    const/4 v3, 0x6

    const/4 v4, 0x5

    const/4 v5, 0x4

    const/4 v6, 0x3

    const/4 v7, 0x2

    iget-object v8, v0, LJd/g;->f:Ljava/lang/Object;

    const/4 v9, 0x1

    iget v10, v0, LJd/g;->e:I

    packed-switch v10, :pswitch_data_0

    move-object/from16 v0, p2

    check-cast v0, Lzc/d;

    iget-object v10, v0, Lzc/d;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lyc/h;

    invoke-virtual {v8}, Lyc/h;->b()Lxc/g;

    move-result-object v9

    iget-object v10, v0, Lzc/d;->b:Ljava/time/LocalDate;

    invoke-virtual {v9, v10}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lyc/h;->b()Lxc/g;

    move-result-object v7

    iget-object v9, v0, Lzc/d;->c:Ljava/time/LocalDate;

    invoke-virtual {v7, v9}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v6, v0, Lzc/d;->d:Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;

    invoke-static {v6}, Lyc/h;->a(Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v5, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v5, v0, Lzc/d;->e:Ljava/lang/String;

    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v0, Lzc/d;->f:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    iget-wide v3, v0, Lzc/d;->g:J

    invoke-interface {v1, v2, v3, v4}, LL4/d;->w(IJ)V

    iget-object v0, v0, Lzc/d;->a:Ljava/lang/String;

    invoke-interface {v1, v15, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lyc/h;->b()Lxc/g;

    move-result-object v0

    invoke-virtual {v0, v10}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v14, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lyc/h;->b()Lxc/g;

    move-result-object v0

    invoke-virtual {v0, v9}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v13, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-static {v6}, Lyc/h;->a(Lcom/eightsleep/data_metrics/enums/AggregateMetricPeriod;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v12, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-interface {v1, v11, v5}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_0
    invoke-direct/range {p0 .. p2}, LJd/g;->D(LL4/f;Ljava/lang/Object;)V

    return-void

    :pswitch_1
    invoke-direct/range {p0 .. p2}, LJd/g;->C(LL4/f;Ljava/lang/Object;)V

    return-void

    :pswitch_2
    invoke-direct/range {p0 .. p2}, LJd/g;->B(LL4/f;Ljava/lang/Object;)V

    return-void

    :pswitch_3
    move-object/from16 v0, p2

    check-cast v0, Lrd/f;

    iget-object v2, v0, Lrd/f;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget v2, v0, Lrd/f;->b:I

    int-to-long v2, v2

    invoke-interface {v1, v7, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, Lrd/f;->c:Ljava/lang/Integer;

    if-nez v2, :cond_0

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v6, v2, v3}, LL4/d;->w(IJ)V

    :goto_0
    check-cast v8, Lqd/d;

    invoke-static {v8}, Lqd/d;->a(Lqd/d;)Lxc/g;

    move-result-object v2

    iget-object v3, v0, Lrd/f;->d:Ljava/time/LocalTime;

    invoke-virtual {v2, v3}, Lxc/g;->c(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, Lrd/f;->a:Ljava/lang/String;

    invoke-interface {v1, v4, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_4
    move-object/from16 v0, p2

    check-cast v0, Lrd/c;

    iget-object v2, v0, Lrd/c;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v2, v0, Lrd/c;->b:Z

    int-to-long v2, v2

    invoke-interface {v1, v7, v2, v3}, LL4/d;->w(IJ)V

    check-cast v8, Lqd/a;

    invoke-static {v8}, Lqd/a;->a(Lqd/a;)Lxc/g;

    move-result-object v2

    iget-object v3, v0, Lrd/c;->c:Ljava/time/LocalTime;

    invoke-virtual {v2, v3}, Lxc/g;->c(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget v2, v0, Lrd/c;->d:I

    int-to-long v2, v2

    invoke-interface {v1, v5, v2, v3}, LL4/d;->w(IJ)V

    iget-object v0, v0, Lrd/c;->a:Ljava/lang/String;

    invoke-interface {v1, v4, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_5
    move-object/from16 v0, p2

    check-cast v0, Lp9/d;

    iget-object v10, v0, Lp9/d;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lo9/h;

    iget-object v8, v8, Lo9/h;->c:Ljava/lang/Object;

    iget-object v8, v0, Lp9/d;->b:Lcom/eightsleep/data_alarm/enums/VibrationPower;

    invoke-static {v8}, LX4/a;->j(Lcom/eightsleep/data_alarm/enums/VibrationPower;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v7, v8}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v7, v0, Lp9/d;->c:Lcom/eightsleep/data_alarm/enums/VibrationPattern;

    invoke-static {v7}, LX4/a;->i(Lcom/eightsleep/data_alarm/enums/VibrationPattern;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v6, v0, Lp9/d;->d:Z

    int-to-long v6, v6

    invoke-interface {v1, v5, v6, v7}, LL4/d;->w(IJ)V

    iget-object v5, v0, Lp9/d;->e:Ljava/lang/String;

    if-nez v5, :cond_1

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_1

    :cond_1
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1
    iget-boolean v4, v0, Lp9/d;->f:Z

    int-to-long v4, v4

    invoke-interface {v1, v3, v4, v5}, LL4/d;->w(IJ)V

    iget-object v3, v0, Lp9/d;->g:Ljava/lang/Integer;

    if-nez v3, :cond_2

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_2

    :cond_2
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v1, v2, v3, v4}, LL4/d;->w(IJ)V

    :goto_2
    iget-object v0, v0, Lp9/d;->a:Ljava/lang/String;

    invoke-interface {v1, v15, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_6
    move-object/from16 v0, p2

    check-cast v0, Lp9/a;

    iget-object v10, v0, Lp9/a;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v0, Lp9/a;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v7, v0, Lp9/a;->c:Z

    int-to-long v9, v7

    invoke-interface {v1, v6, v9, v10}, LL4/d;->w(IJ)V

    check-cast v8, Lo9/e;

    invoke-virtual {v8}, Lo9/e;->a()Lxc/g;

    move-result-object v6

    iget-object v7, v0, Lp9/a;->d:Ljava/time/LocalTime;

    invoke-virtual {v6, v7}, Lxc/g;->c(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lo9/e;->a()Lxc/g;

    move-result-object v5

    iget-object v6, v0, Lp9/a;->j:Ljava/time/Instant;

    invoke-virtual {v5, v6}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v0, Lp9/a;->k:Ljava/time/Instant;

    invoke-static {v4}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_3

    :cond_3
    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3
    invoke-virtual {v8}, Lo9/e;->a()Lxc/g;

    move-result-object v3

    iget-object v4, v0, Lp9/a;->l:Ljava/time/Instant;

    invoke-virtual {v3, v4}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v2, v0, Lp9/a;->m:Z

    int-to-long v2, v2

    invoke-interface {v1, v15, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, Lp9/a;->n:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    goto :goto_4

    :cond_4
    invoke-interface {v1, v14, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_4
    iget-object v2, v0, Lp9/a;->o:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5

    invoke-interface {v1, v13}, LL4/d;->M(I)V

    goto :goto_5

    :cond_5
    invoke-interface {v1, v13, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_5
    iget-object v2, v0, Lp9/a;->p:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_6

    invoke-interface {v1, v12}, LL4/d;->M(I)V

    goto :goto_6

    :cond_6
    invoke-interface {v1, v12, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_6
    iget-boolean v2, v0, Lp9/a;->q:Z

    int-to-long v2, v2

    invoke-interface {v1, v11, v2, v3}, LL4/d;->w(IJ)V

    iget-wide v2, v0, Lp9/a;->r:J

    const/16 v4, 0xd

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-wide v2, v0, Lp9/a;->s:J

    const/16 v4, 0xe

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, Lp9/a;->u:Ljava/util/List;

    invoke-static {v2}, LX4/a;->e(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0xf

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lp9/a;->e:Lp9/b;

    iget-boolean v3, v2, Lp9/b;->a:Z

    int-to-long v3, v3

    const/16 v5, 0x10

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget-object v2, v2, Lp9/b;->b:Ljava/lang/Object;

    invoke-static {v2}, Lio/sentry/hints/i;->I(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x11

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lp9/a;->f:Lp9/h;

    iget-boolean v3, v2, Lp9/h;->a:Z

    int-to-long v3, v3

    const/16 v5, 0x12

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget-object v3, v2, Lp9/h;->b:Lcom/eightsleep/data_alarm/enums/VibrationPower;

    invoke-static {v3}, LX4/a;->j(Lcom/eightsleep/data_alarm/enums/VibrationPower;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x13

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v2, Lp9/h;->c:Lcom/eightsleep/data_alarm/enums/VibrationPattern;

    invoke-static {v2}, LX4/a;->i(Lcom/eightsleep/data_alarm/enums/VibrationPattern;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x14

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lp9/a;->g:Lp9/g;

    iget-boolean v3, v2, Lp9/g;->a:Z

    int-to-long v3, v3

    const/16 v5, 0x15

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget v2, v2, Lp9/g;->b:I

    int-to-long v2, v2

    const/16 v4, 0x16

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, Lp9/a;->h:Lp9/f;

    iget-boolean v3, v2, Lp9/f;->a:Z

    const/16 v4, 0x17

    int-to-long v5, v3

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    iget-boolean v3, v2, Lp9/f;->b:Z

    int-to-long v3, v3

    const/16 v5, 0x18

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget v2, v2, Lp9/f;->c:I

    int-to-long v2, v2

    const/16 v4, 0x19

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    const/16 v2, 0x1a

    const/16 v3, 0x1c

    const/16 v4, 0x1b

    iget-object v5, v0, Lp9/a;->i:Lp9/c;

    if-eqz v5, :cond_9

    iget-boolean v6, v5, Lp9/c;->a:Z

    int-to-long v6, v6

    invoke-interface {v1, v2, v6, v7}, LL4/d;->w(IJ)V

    iget-object v2, v5, Lp9/c;->b:Ljava/lang/String;

    if-nez v2, :cond_7

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_7

    :cond_7
    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_7
    iget-object v2, v5, Lp9/c;->c:Ljava/lang/Integer;

    if-nez v2, :cond_8

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_8

    :cond_8
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v4, v2

    invoke-interface {v1, v3, v4, v5}, LL4/d;->w(IJ)V

    goto :goto_8

    :cond_9
    invoke-interface {v1, v2}, LL4/d;->M(I)V

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    :goto_8
    const/16 v2, 0x26

    const/16 v3, 0x25

    const/16 v4, 0x24

    const/16 v5, 0x23

    const/16 v6, 0x22

    const/16 v7, 0x21

    const/16 v9, 0x20

    const/16 v10, 0x1f

    const/16 v11, 0x1e

    const/16 v12, 0x1d

    const/16 v14, 0x27

    iget-object v15, v0, Lp9/a;->t:Lp9/e;

    if-eqz v15, :cond_c

    invoke-virtual {v8}, Lo9/e;->a()Lxc/g;

    move-result-object v8

    iget-object v13, v15, Lp9/e;->a:Ljava/time/LocalTime;

    invoke-virtual {v8, v13}, Lxc/g;->c(Ljava/time/LocalTime;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v1, v12, v8}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v8, v15, Lp9/e;->b:Lp9/g;

    iget-boolean v12, v8, Lp9/g;->a:Z

    int-to-long v12, v12

    invoke-interface {v1, v11, v12, v13}, LL4/d;->w(IJ)V

    iget v8, v8, Lp9/g;->b:I

    int-to-long v11, v8

    invoke-interface {v1, v10, v11, v12}, LL4/d;->w(IJ)V

    iget-object v8, v15, Lp9/e;->c:Lp9/h;

    iget-boolean v10, v8, Lp9/h;->a:Z

    int-to-long v10, v10

    invoke-interface {v1, v9, v10, v11}, LL4/d;->w(IJ)V

    iget-object v9, v8, Lp9/h;->b:Lcom/eightsleep/data_alarm/enums/VibrationPower;

    invoke-static {v9}, LX4/a;->j(Lcom/eightsleep/data_alarm/enums/VibrationPower;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v7, v8, Lp9/h;->c:Lcom/eightsleep/data_alarm/enums/VibrationPattern;

    invoke-static {v7}, LX4/a;->i(Lcom/eightsleep/data_alarm/enums/VibrationPattern;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v6, v15, Lp9/e;->d:Lp9/f;

    iget-boolean v7, v6, Lp9/f;->a:Z

    int-to-long v7, v7

    invoke-interface {v1, v5, v7, v8}, LL4/d;->w(IJ)V

    iget-boolean v5, v6, Lp9/f;->b:Z

    int-to-long v7, v5

    invoke-interface {v1, v4, v7, v8}, LL4/d;->w(IJ)V

    iget v4, v6, Lp9/f;->c:I

    int-to-long v4, v4

    invoke-interface {v1, v3, v4, v5}, LL4/d;->w(IJ)V

    iget-object v3, v15, Lp9/e;->e:Lp9/c;

    iget-boolean v4, v3, Lp9/c;->a:Z

    int-to-long v4, v4

    invoke-interface {v1, v2, v4, v5}, LL4/d;->w(IJ)V

    iget-object v2, v3, Lp9/c;->b:Ljava/lang/String;

    if-nez v2, :cond_a

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    goto :goto_9

    :cond_a
    invoke-interface {v1, v14, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_9
    iget-object v2, v3, Lp9/c;->c:Ljava/lang/Integer;

    if-nez v2, :cond_b

    const/16 v8, 0x28

    invoke-interface {v1, v8}, LL4/d;->M(I)V

    goto :goto_a

    :cond_b
    const/16 v8, 0x28

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v8, v2, v3}, LL4/d;->w(IJ)V

    goto :goto_a

    :cond_c
    const/16 v8, 0x28

    invoke-static {v1, v12, v11, v10, v9}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-static {v1, v7, v6, v5, v4}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-static {v1, v3, v2, v14, v8}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    :goto_a
    const/16 v2, 0x29

    iget-object v0, v0, Lp9/a;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_7
    move-object/from16 v0, p2

    check-cast v0, Lmb/l;

    iget-object v2, v0, Lmb/l;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lmb/l;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Llb/o;

    invoke-static {v8}, Llb/o;->b(Llb/o;)Lxc/g;

    move-result-object v2

    iget-object v7, v0, Lmb/l;->d:Ljava/time/Instant;

    invoke-virtual {v2, v7}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lmb/l;->c:Lmb/m;

    if-eqz v2, :cond_d

    iget-object v6, v2, Lmb/m;->a:LSa/c;

    iget-object v6, v6, LSa/c;->a:Ljava/lang/String;

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    invoke-static {v8}, Llb/o;->b(Llb/o;)Lxc/g;

    move-result-object v5

    iget-object v2, v2, Lmb/m;->b:Ljava/time/Instant;

    invoke-virtual {v5, v2}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_b

    :cond_d
    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    :goto_b
    iget-object v0, v0, Lmb/l;->a:Ljava/lang/String;

    invoke-interface {v1, v3, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_8
    move-object/from16 v0, p2

    check-cast v0, Llc/e;

    iget-object v2, v0, Llc/e;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lkc/d;

    invoke-virtual {v8}, Lkc/d;->b()Ljc/a;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "type"

    iget-object v3, v0, Llc/e;->b:Lcom/eightsleep/data_jetlag/enums/JetLagTaskType;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lkc/d;->b()Ljc/a;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v2, "status"

    iget-object v3, v0, Llc/e;->c:Lcom/eightsleep/data_jetlag/enums/JetLagPlanTaskStatus;

    invoke-static {v3, v2}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lkc/d;->b()Ljc/a;

    move-result-object v2

    iget-object v3, v0, Llc/e;->d:Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    iget-object v2, v2, Ljc/a;->a:Lcom/squareup/moshi/Moshi;

    const-class v6, Lcom/eightsleep/data_jetlag/data/model/JetLagPlanMetadataResponse;

    invoke-virtual {v2, v6}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/Class;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object v2

    const-string v6, "adapter(...)"

    invoke-static {v2, v6}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_e

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_c

    :cond_e
    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_c
    iget-object v0, v0, Llc/e;->a:Ljava/lang/String;

    invoke-interface {v1, v4, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_9
    move-object/from16 v0, p2

    check-cast v0, Lg9/s;

    iget-object v2, v0, Lg9/s;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lf9/e;

    invoke-virtual {v8}, Lf9/e;->c()Le9/a;

    move-result-object v2

    iget-object v9, v0, Lg9/s;->b:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v9}, LIm/r;->X0(Ljava/lang/Iterable;)Ljava/util/ArrayList;

    move-result-object v10

    new-instance v14, Ldg/g;

    invoke-direct {v14, v5}, Ldg/g;-><init>(I)V

    const-string v11, ","

    const/16 v15, 0x1e

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_f

    const-string v2, ""

    :cond_f
    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, Lg9/s;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;

    if-nez v2, :cond_10

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_d

    :cond_10
    invoke-static {v8, v2}, Lf9/e;->a(Lf9/e;Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_d
    iget-object v2, v0, Lg9/s;->d:Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;

    if-nez v2, :cond_11

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_e

    :cond_11
    invoke-static {v8, v2}, Lf9/e;->b(Lf9/e;Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_e
    iget-wide v5, v0, Lg9/s;->e:J

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    iget-object v0, v0, Lg9/s;->a:Ljava/lang/String;

    invoke-interface {v1, v3, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_a
    move-object/from16 v0, p2

    check-cast v0, Lg9/f;

    iget-object v10, v0, Lg9/f;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v0, Lg9/f;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lf9/c;

    invoke-virtual {v8}, Lf9/c;->j()Le9/a;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v7, "state"

    iget-object v9, v0, Lg9/f;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightState;

    invoke-static {v9, v7}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v9}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lf9/c;->j()Le9/a;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v6, "type"

    iget-object v7, v0, Lg9/f;->d:Lcom/eightsleep/data_ai_insights/enums/AiInsightType;

    invoke-static {v7, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {v7}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, Lf9/c;->k()Lxc/g;

    move-result-object v5

    iget-object v6, v0, Lg9/f;->j:Ljava/time/Instant;

    invoke-virtual {v5, v6}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v0, Lg9/f;->e:Lg9/l;

    if-eqz v4, :cond_1c

    iget-object v5, v4, Lg9/l;->a:Ljava/lang/String;

    if-nez v5, :cond_12

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_f

    :cond_12
    invoke-interface {v1, v3, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_f
    iget-object v3, v4, Lg9/l;->b:Ljava/lang/String;

    if-nez v3, :cond_13

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_10

    :cond_13
    invoke-interface {v1, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_10
    iget-object v2, v4, Lg9/l;->c:Ljava/lang/String;

    if-nez v2, :cond_14

    invoke-interface {v1, v15}, LL4/d;->M(I)V

    goto :goto_11

    :cond_14
    invoke-interface {v1, v15, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_11
    iget-object v2, v4, Lg9/l;->d:Ljava/lang/String;

    if-nez v2, :cond_15

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    goto :goto_12

    :cond_15
    invoke-interface {v1, v14, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_12
    iget-object v2, v4, Lg9/l;->e:Ljava/lang/String;

    if-nez v2, :cond_16

    invoke-interface {v1, v13}, LL4/d;->M(I)V

    goto :goto_13

    :cond_16
    invoke-interface {v1, v13, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_13
    iget-object v2, v4, Lg9/l;->f:Ljava/lang/String;

    if-nez v2, :cond_17

    invoke-interface {v1, v12}, LL4/d;->M(I)V

    goto :goto_14

    :cond_17
    invoke-interface {v1, v12, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_14
    iget-object v2, v4, Lg9/l;->g:Ljava/lang/String;

    if-nez v2, :cond_18

    invoke-interface {v1, v11}, LL4/d;->M(I)V

    goto :goto_15

    :cond_18
    invoke-interface {v1, v11, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_15
    iget-object v2, v4, Lg9/l;->h:Ljava/lang/String;

    if-nez v2, :cond_19

    const/16 v3, 0xd

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_16

    :cond_19
    const/16 v3, 0xd

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_16
    iget-object v2, v4, Lg9/l;->i:Ljava/lang/String;

    if-nez v2, :cond_1a

    const/16 v5, 0xe

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_17

    :cond_1a
    const/16 v5, 0xe

    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_17
    iget-object v2, v4, Lg9/l;->j:Ljava/lang/String;

    if-nez v2, :cond_1b

    const/16 v4, 0xf

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_18

    :cond_1b
    const/16 v4, 0xf

    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_18

    :cond_1c
    const/16 v4, 0xf

    const/16 v5, 0xe

    invoke-static {v1, v3, v2, v15, v14}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    const/16 v3, 0xd

    invoke-static {v1, v13, v12, v11, v3}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    :goto_18
    iget-object v2, v0, Lg9/f;->f:Lg9/c;

    iget-object v3, v2, Lg9/c;->a:Lcom/eightsleep/data_ai_insights/enums/AiInsightModel;

    invoke-static {v8, v3}, Lf9/c;->d(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightModel;)Ljava/lang/String;

    move-result-object v3

    const/16 v5, 0x10

    invoke-interface {v1, v5, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v2, Lg9/c;->b:Ljava/time/LocalDate;

    if-nez v4, :cond_1d

    const/4 v4, 0x0

    goto :goto_19

    :cond_1d
    invoke-virtual {v8}, Lf9/c;->k()Lxc/g;

    move-result-object v5

    invoke-virtual {v5, v4}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v4

    :goto_19
    if-nez v4, :cond_1e

    const/16 v5, 0x11

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_1a

    :cond_1e
    const/16 v5, 0x11

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1a
    iget-object v4, v2, Lg9/c;->c:Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;

    if-nez v4, :cond_1f

    const/16 v5, 0x12

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_1b

    :cond_1f
    const/16 v5, 0x12

    invoke-static {v8, v4}, Lf9/c;->f(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightSleepState;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1b
    iget-object v4, v2, Lg9/c;->d:Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;

    if-nez v4, :cond_20

    const/16 v5, 0x13

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_1c

    :cond_20
    const/16 v5, 0x13

    invoke-static {v8, v4}, Lf9/c;->e(Lf9/c;Lcom/eightsleep/data_core/enums/ai_insights/AiInsightSentiment;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1c
    iget-object v4, v2, Lg9/c;->e:Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;

    if-nez v4, :cond_21

    const/16 v5, 0x14

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_1d

    :cond_21
    const/16 v5, 0x14

    invoke-static {v8, v4}, Lf9/c;->c(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightLength;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1d
    iget-object v4, v2, Lg9/c;->f:Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;

    if-nez v4, :cond_22

    const/16 v5, 0x15

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_1e

    :cond_22
    const/16 v5, 0x15

    invoke-static {v8, v4}, Lf9/c;->g(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightTone;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1e
    const/16 v4, 0x16

    iget-object v5, v2, Lg9/c;->h:Ljava/lang/String;

    if-nez v5, :cond_23

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_1f

    :cond_23
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_1f
    const/16 v4, 0x17

    iget-object v5, v2, Lg9/c;->i:Ljava/lang/String;

    if-nez v5, :cond_24

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_20

    :cond_24
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_20
    const/16 v4, 0x18

    iget-object v5, v2, Lg9/c;->j:Ljava/lang/Integer;

    if-nez v5, :cond_25

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_21

    :cond_25
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    int-to-long v5, v5

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    :goto_21
    const/16 v4, 0x19

    iget-object v2, v2, Lg9/c;->g:Lg9/n;

    if-eqz v2, :cond_27

    iget-object v2, v2, Lg9/n;->a:Ljava/lang/String;

    if-nez v2, :cond_26

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_22

    :cond_26
    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_22

    :cond_27
    invoke-interface {v1, v4}, LL4/d;->M(I)V

    :goto_22
    const/16 v2, 0x1a

    const/16 v4, 0x1d

    const/16 v5, 0x1c

    const/16 v6, 0x1b

    iget-object v7, v0, Lg9/f;->g:Lg9/i;

    if-eqz v7, :cond_2e

    iget-object v9, v7, Lg9/i;->a:Ljava/util/List;

    if-nez v9, :cond_28

    const/4 v9, 0x0

    goto :goto_23

    :cond_28
    invoke-virtual {v8}, Lf9/c;->j()Le9/a;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v11, "value"

    invoke-static {v9, v11}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    iget-object v10, v10, Le9/a;->a:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v10, v9}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "toJson(...)"

    invoke-static {v9, v10}, Lkotlin/jvm/internal/l;->i(Ljava/lang/Object;Ljava/lang/String;)V

    :goto_23
    if-nez v9, :cond_29

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_24

    :cond_29
    invoke-interface {v1, v2, v9}, LL4/d;->g(ILjava/lang/String;)V

    :goto_24
    iget-object v2, v7, Lg9/i;->b:Lg9/k;

    if-eqz v2, :cond_2d

    iget-object v7, v2, Lg9/k;->a:Ljava/lang/Integer;

    if-nez v7, :cond_2a

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_25

    :cond_2a
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    int-to-long v9, v7

    invoke-interface {v1, v6, v9, v10}, LL4/d;->w(IJ)V

    :goto_25
    iget-object v6, v2, Lg9/k;->b:Ljava/lang/Integer;

    if-nez v6, :cond_2b

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_26

    :cond_2b
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    int-to-long v6, v6

    invoke-interface {v1, v5, v6, v7}, LL4/d;->w(IJ)V

    :goto_26
    iget-object v2, v2, Lg9/k;->c:Ljava/lang/Integer;

    if-nez v2, :cond_2c

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_27

    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v5, v2

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    goto :goto_27

    :cond_2d
    invoke-interface {v1, v6}, LL4/d;->M(I)V

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_27

    :cond_2e
    invoke-static {v1, v2, v6, v5, v4}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    :goto_27
    const/16 v2, 0x21

    const/16 v4, 0x20

    const/16 v5, 0x1f

    const/16 v6, 0x1e

    iget-object v7, v0, Lg9/f;->h:Lg9/g;

    if-eqz v7, :cond_34

    iget-object v9, v7, Lg9/g;->a:Ljava/lang/Boolean;

    if-nez v9, :cond_2f

    const/4 v9, 0x0

    goto :goto_28

    :cond_2f
    invoke-virtual {v9}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    :goto_28
    if-nez v9, :cond_30

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_29

    :cond_30
    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    int-to-long v9, v9

    invoke-interface {v1, v6, v9, v10}, LL4/d;->w(IJ)V

    :goto_29
    iget-object v6, v7, Lg9/g;->b:Lcom/eightsleep/data_ai_insights/enums/AiInsightFeedbackRating;

    if-nez v6, :cond_31

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_2a

    :cond_31
    invoke-static {v8, v6}, Lf9/c;->b(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightFeedbackRating;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    :goto_2a
    iget-object v5, v7, Lg9/g;->c:Ljava/lang/String;

    if-nez v5, :cond_32

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_2b

    :cond_32
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_2b
    iget-object v4, v7, Lg9/g;->d:Ljava/time/Instant;

    invoke-static {v4}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_33

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_2c

    :cond_33
    invoke-interface {v1, v2, v4}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_2c

    :cond_34
    invoke-static {v1, v6, v5, v4, v2}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    :goto_2c
    const/16 v5, 0x2b

    const/16 v6, 0x2a

    const/16 v7, 0x28

    const/16 v9, 0x27

    const/16 v10, 0x25

    const/16 v11, 0x24

    const/16 v12, 0x23

    const/16 v13, 0x22

    const/16 v2, 0x2c

    const/16 v14, 0x29

    const/16 v15, 0x26

    iget-object v3, v0, Lg9/f;->i:Lg9/m;

    if-eqz v3, :cond_44

    iget-object v4, v3, Lg9/m;->a:Lcom/eightsleep/data_ai_insights/enums/AiInsightDataChartType;

    if-nez v4, :cond_35

    invoke-interface {v1, v13}, LL4/d;->M(I)V

    goto :goto_2d

    :cond_35
    invoke-static {v8, v4}, Lf9/c;->a(Lf9/c;Lcom/eightsleep/data_ai_insights/enums/AiInsightDataChartType;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v13, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_2d
    invoke-virtual {v8}, Lf9/c;->j()Le9/a;

    move-result-object v4

    iget-object v13, v3, Lg9/m;->e:Ljava/util/List;

    if-eqz v13, :cond_36

    iget-object v4, v4, Le9/a;->b:Lcom/squareup/moshi/JsonAdapter;

    invoke-virtual {v4, v13}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_2e

    :cond_36
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v4, 0x0

    :goto_2e
    if-nez v4, :cond_37

    invoke-interface {v1, v12}, LL4/d;->M(I)V

    goto :goto_2f

    :cond_37
    invoke-interface {v1, v12, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_2f
    iget-object v4, v3, Lg9/m;->b:Lg9/d;

    if-eqz v4, :cond_3a

    iget-object v12, v4, Lg9/d;->a:Lg9/b;

    iget-object v13, v12, Lg9/b;->a:Ljava/lang/String;

    invoke-interface {v1, v11, v13}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v11, v12, Lg9/b;->b:Ljava/lang/String;

    invoke-interface {v1, v10, v11}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v10, v12, Lg9/b;->c:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    if-nez v10, :cond_38

    invoke-interface {v1, v15}, LL4/d;->M(I)V

    goto :goto_30

    :cond_38
    invoke-static {v8, v10}, Lf9/c;->h(Lf9/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v10

    invoke-interface {v1, v15, v10}, LL4/d;->g(ILjava/lang/String;)V

    :goto_30
    iget-object v4, v4, Lg9/d;->b:Lg9/b;

    iget-object v10, v4, Lg9/b;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v4, Lg9/b;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v4, Lg9/b;->c:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    if-nez v4, :cond_39

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    goto :goto_31

    :cond_39
    invoke-static {v8, v4}, Lf9/c;->h(Lf9/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v14, v4}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_31

    :cond_3a
    invoke-static {v1, v11, v10, v15, v9}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-interface {v1, v7}, LL4/d;->M(I)V

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    :goto_31
    iget-object v4, v3, Lg9/m;->c:Lg9/e;

    if-eqz v4, :cond_3c

    iget-object v4, v4, Lg9/e;->a:Lg9/b;

    iget-object v7, v4, Lg9/b;->a:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v6, v4, Lg9/b;->b:Ljava/lang/String;

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v4, Lg9/b;->c:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    if-nez v4, :cond_3b

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_32

    :cond_3b
    invoke-static {v8, v4}, Lf9/c;->h(Lf9/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v2, v4}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_32

    :cond_3c
    invoke-interface {v1, v6}, LL4/d;->M(I)V

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    :goto_32
    iget-object v2, v3, Lg9/m;->d:Lg9/q;

    if-eqz v2, :cond_43

    iget-object v3, v2, Lg9/q;->a:Lg9/p;

    iget-object v4, v3, Lg9/p;->a:Ljava/lang/String;

    const/16 v5, 0x2d

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v3, Lg9/p;->b:Ljava/util/List;

    const/4 v11, 0x0

    const/16 v14, 0x3e

    const-string v10, ","

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v14}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_3d

    const/16 v5, 0x2e

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_33

    :cond_3d
    const/16 v5, 0x2e

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_33
    iget-object v4, v3, Lg9/p;->c:Ljava/lang/String;

    if-nez v4, :cond_3e

    const/16 v5, 0x2f

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_34

    :cond_3e
    const/16 v5, 0x2f

    invoke-interface {v1, v5, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_34
    iget-object v3, v3, Lg9/p;->d:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    if-nez v3, :cond_3f

    const/16 v4, 0x30

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_35

    :cond_3f
    const/16 v4, 0x30

    invoke-static {v8, v3}, Lf9/c;->h(Lf9/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_35
    iget-object v2, v2, Lg9/q;->b:Lg9/p;

    iget-object v3, v2, Lg9/p;->a:Ljava/lang/String;

    const/16 v4, 0x31

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v2, Lg9/p;->b:Ljava/util/List;

    const/4 v11, 0x0

    const/16 v14, 0x3e

    const-string v10, ","

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v9 .. v14}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_40

    const/16 v4, 0x32

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_36

    :cond_40
    const/16 v4, 0x32

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_36
    iget-object v3, v2, Lg9/p;->c:Ljava/lang/String;

    if-nez v3, :cond_41

    const/16 v4, 0x33

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_37

    :cond_41
    const/16 v4, 0x33

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_37
    iget-object v2, v2, Lg9/p;->d:Lcom/eightsleep/data_metrics/enums/MetricDataType;

    if-nez v2, :cond_42

    const/16 v3, 0x34

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_38

    :cond_42
    const/16 v3, 0x34

    invoke-static {v8, v2}, Lf9/c;->h(Lf9/c;Lcom/eightsleep/data_metrics/enums/MetricDataType;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_38

    :cond_43
    const/16 v2, 0x30

    const/16 v3, 0x34

    const/16 v4, 0x33

    const/16 v5, 0x2f

    const/16 v6, 0x2e

    const/16 v8, 0x2d

    invoke-static {v1, v8, v6, v5, v2}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    const/16 v2, 0x31

    const/16 v5, 0x32

    invoke-static {v1, v2, v5, v4, v3}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    goto :goto_38

    :cond_44
    const/16 v3, 0x31

    const/16 v4, 0x30

    const/16 v8, 0x2d

    invoke-static {v1, v13, v12, v11, v10}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-static {v1, v15, v9, v7, v14}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    invoke-static {v1, v6, v5, v2, v8}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    const/16 v5, 0x2f

    const/16 v6, 0x2e

    invoke-static {v1, v6, v5, v4, v3}, Lcom/eightsleep/data_bioage/data/model/a;->t(LL4/f;IIII)V

    const/16 v4, 0x32

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    const/16 v4, 0x33

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    const/16 v3, 0x34

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    :goto_38
    const/16 v2, 0x35

    iget-object v0, v0, Lg9/f;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_b
    move-object/from16 v0, p2

    check-cast v0, Ldd/a;

    iget-object v2, v0, Ldd/a;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lcd/a;

    iget-object v2, v8, Lcd/a;->c:Ljava/lang/Object;

    iget-object v2, v0, Ldd/a;->b:Lcom/eightsleep/data_remoteconfig/enums/featureflag/FlagValue;

    invoke-static {v2}, Lbd/h;->a(Lcom/eightsleep/data_remoteconfig/enums/featureflag/FlagValue;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, Ldd/a;->a:Ljava/lang/String;

    invoke-interface {v1, v6, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_c
    move-object/from16 v0, p2

    check-cast v0, Lcc/a;

    iget-object v10, v0, Lcc/a;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v0, Lcc/a;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v7, v0, Lcc/a;->c:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, Lbc/c;

    iget-object v6, v0, Lcc/a;->d:Lcom/eightsleep/data_insights/enums/InsightSentiment;

    invoke-static {v8, v6}, Lbc/c;->f(Lbc/c;Lcom/eightsleep/data_insights/enums/InsightSentiment;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v5, v0, Lcc/a;->e:Lcom/eightsleep/data_insights/enums/InsightType;

    invoke-static {v8, v5}, Lbc/c;->g(Lbc/c;Lcom/eightsleep/data_insights/enums/InsightType;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v4, v0, Lcc/a;->f:Ljava/lang/String;

    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    invoke-static {v8}, Lbc/c;->i(Lbc/c;)Lxc/g;

    move-result-object v3

    iget-object v4, v0, Lcc/a;->g:Ljava/time/Instant;

    invoke-virtual {v3, v4}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    invoke-static {v8}, Lbc/c;->i(Lbc/c;)Lxc/g;

    move-result-object v2

    iget-object v3, v0, Lcc/a;->h:Ljava/time/LocalDate;

    invoke-virtual {v2, v3}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v15, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-wide v2, v0, Lcc/a;->i:J

    invoke-interface {v1, v14, v2, v3}, LL4/d;->w(IJ)V

    invoke-interface {v1, v13, v9}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_d
    move-object/from16 v0, p2

    check-cast v0, LV8/b;

    iget-object v2, v0, LV8/b;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LU8/a;

    invoke-virtual {v8}, LU8/a;->b()LT8/a;

    move-result-object v2

    iget-object v3, v0, LV8/b;->b:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-array v4, v9, [Ljava/lang/reflect/Type;

    const-class v9, LV8/a;

    const/4 v10, 0x0

    aput-object v9, v4, v10

    const-class v9, Ljava/util/List;

    invoke-static {v9, v4}, Lcom/squareup/moshi/Types;->newParameterizedType(Ljava/lang/reflect/Type;[Ljava/lang/reflect/Type;)Ljava/lang/reflect/ParameterizedType;

    move-result-object v4

    iget-object v2, v2, LT8/a;->a:Lcom/squareup/moshi/Moshi;

    invoke-virtual {v2, v4}, Lcom/squareup/moshi/Moshi;->adapter(Ljava/lang/reflect/Type;)Lcom/squareup/moshi/JsonAdapter;

    move-result-object v2

    invoke-virtual {v2, v3}, Lcom/squareup/moshi/JsonAdapter;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_45

    invoke-interface {v1, v7}, LL4/d;->M(I)V

    goto :goto_39

    :cond_45
    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_39
    invoke-virtual {v8}, LU8/a;->i()Lxc/g;

    move-result-object v2

    iget-object v3, v0, LV8/b;->c:Ljava/time/Instant;

    invoke-virtual {v2, v3}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, LV8/b;->a:Ljava/lang/String;

    invoke-interface {v1, v5, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_e
    move-object/from16 v0, p2

    check-cast v0, LUb/e;

    iget-object v2, v0, LUb/e;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v2, v0, LUb/e;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LTb/g;

    invoke-static {v8}, LTb/g;->a(LTb/g;)Lxc/g;

    move-result-object v3

    iget-object v7, v0, LUb/e;->c:Ljava/time/Instant;

    invoke-virtual {v3, v7}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v6, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, LUb/e;->a:Ljava/lang/String;

    invoke-interface {v1, v5, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_f
    move-object/from16 v0, p2

    check-cast v0, LS9/m;

    iget-object v10, v0, LS9/m;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LR9/q;

    iget-object v10, v0, LS9/m;->d:Ljava/util/List;

    if-nez v10, :cond_46

    const/4 v9, 0x0

    goto :goto_3a

    :cond_46
    iget-object v9, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-static {v10}, Lio/sentry/hints/i;->A(Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    :goto_3a
    if-nez v9, :cond_47

    invoke-interface {v1, v7}, LL4/d;->M(I)V

    goto :goto_3b

    :cond_47
    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3b
    iget-object v7, v0, LS9/m;->e:Ljava/lang/String;

    if-nez v7, :cond_48

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_3c

    :cond_48
    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3c
    iget-object v6, v0, LS9/m;->f:Ljava/util/List;

    if-nez v6, :cond_49

    const/4 v6, 0x0

    goto :goto_3d

    :cond_49
    iget-object v7, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-static {v6}, Lio/sentry/hints/i;->w(Ljava/util/List;)Ljava/lang/String;

    move-result-object v6

    :goto_3d
    if-nez v6, :cond_4a

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_3e

    :cond_4a
    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3e
    iget-object v5, v0, LS9/m;->g:Ljava/lang/String;

    if-nez v5, :cond_4b

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_3f

    :cond_4b
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_3f
    iget-object v4, v0, LS9/m;->h:Ljava/util/List;

    if-nez v4, :cond_4c

    const/4 v4, 0x0

    goto :goto_40

    :cond_4c
    iget-object v5, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-static {v4}, Lio/sentry/hints/i;->z(Ljava/util/List;)Ljava/lang/String;

    move-result-object v4

    :goto_40
    if-nez v4, :cond_4d

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_41

    :cond_4d
    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_41
    iget-object v3, v0, LS9/m;->i:Ljava/lang/String;

    if-nez v3, :cond_4e

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_42

    :cond_4e
    invoke-interface {v1, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_42
    iget-object v2, v0, LS9/m;->j:Ljava/lang/Boolean;

    if-nez v2, :cond_4f

    const/4 v2, 0x0

    goto :goto_43

    :cond_4f
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    :goto_43
    if-nez v2, :cond_50

    invoke-interface {v1, v15}, LL4/d;->M(I)V

    goto :goto_44

    :cond_50
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v15, v2, v3}, LL4/d;->w(IJ)V

    :goto_44
    iget-object v2, v0, LS9/m;->k:Ljava/lang/Integer;

    if-nez v2, :cond_51

    invoke-interface {v1, v14}, LL4/d;->M(I)V

    goto :goto_45

    :cond_51
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    int-to-long v2, v2

    invoke-interface {v1, v14, v2, v3}, LL4/d;->w(IJ)V

    :goto_45
    iget-object v2, v0, LS9/m;->l:Ljava/time/LocalDate;

    if-nez v2, :cond_52

    const/4 v2, 0x0

    goto :goto_46

    :cond_52
    invoke-virtual {v8}, LR9/q;->a()Lxc/g;

    move-result-object v3

    invoke-virtual {v3, v2}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v2

    :goto_46
    if-nez v2, :cond_53

    invoke-interface {v1, v13}, LL4/d;->M(I)V

    goto :goto_47

    :cond_53
    invoke-interface {v1, v13, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_47
    iget-object v2, v0, LS9/m;->m:Ljava/util/List;

    if-nez v2, :cond_54

    const/4 v2, 0x0

    goto :goto_48

    :cond_54
    iget-object v3, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-static {v2}, Lio/sentry/hints/i;->v(Ljava/util/List;)Ljava/lang/String;

    move-result-object v2

    :goto_48
    if-nez v2, :cond_55

    invoke-interface {v1, v12}, LL4/d;->M(I)V

    goto :goto_49

    :cond_55
    invoke-interface {v1, v12, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_49
    iget-object v2, v0, LS9/m;->n:Lcom/eightsleep/data_autopilot/enums/ExerciseFrequency;

    if-nez v2, :cond_56

    const/4 v2, 0x0

    goto :goto_4a

    :cond_56
    iget-object v3, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    :goto_4a
    if-nez v2, :cond_57

    invoke-interface {v1, v11}, LL4/d;->M(I)V

    goto :goto_4b

    :cond_57
    invoke-interface {v1, v11, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_4b
    iget-object v2, v0, LS9/m;->o:Lcom/eightsleep/data_autopilot/enums/ExerciseTime;

    if-nez v2, :cond_58

    const/4 v2, 0x0

    goto :goto_4c

    :cond_58
    iget-object v3, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-virtual {v2}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    :goto_4c
    if-nez v2, :cond_59

    const/16 v3, 0xd

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_4d

    :cond_59
    const/16 v3, 0xd

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_4d
    iget-object v2, v0, LS9/m;->p:Ljava/lang/String;

    if-nez v2, :cond_5a

    const/16 v4, 0xe

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_4e

    :cond_5a
    const/16 v4, 0xe

    invoke-interface {v1, v4, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_4e
    iget-wide v2, v0, LS9/m;->q:J

    const/16 v4, 0xf

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, LS9/m;->r:Ljava/util/List;

    if-nez v2, :cond_5b

    const/4 v9, 0x0

    goto :goto_4f

    :cond_5b
    iget-object v3, v8, LR9/q;->g:Lio/sentry/hints/i;

    invoke-static {v2}, Lio/sentry/hints/i;->B(Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    :goto_4f
    if-nez v9, :cond_5c

    const/16 v5, 0x10

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_50

    :cond_5c
    const/16 v5, 0x10

    invoke-interface {v1, v5, v9}, LL4/d;->g(ILjava/lang/String;)V

    :goto_50
    iget-object v2, v0, LS9/m;->b:LS9/n;

    if-eqz v2, :cond_5d

    iget v3, v2, LS9/n;->a:I

    int-to-long v3, v3

    const/16 v5, 0x11

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget-object v3, v8, LR9/q;->d:Lio/sentry/hints/i;

    iget-object v2, v2, LS9/n;->b:Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    invoke-static {v2}, Lio/sentry/hints/i;->H(Lcom/eightsleep/data_core/enums/UnitOfMeasurement;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x12

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_51

    :cond_5d
    const/16 v3, 0x12

    const/16 v5, 0x11

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    :goto_51
    iget-object v2, v0, LS9/m;->c:LS9/n;

    if-eqz v2, :cond_5e

    iget v3, v2, LS9/n;->a:I

    int-to-long v3, v3

    const/16 v5, 0x13

    invoke-interface {v1, v5, v3, v4}, LL4/d;->w(IJ)V

    iget-object v3, v8, LR9/q;->d:Lio/sentry/hints/i;

    iget-object v2, v2, LS9/n;->b:Lcom/eightsleep/data_core/enums/UnitOfMeasurement;

    invoke-static {v2}, Lio/sentry/hints/i;->H(Lcom/eightsleep/data_core/enums/UnitOfMeasurement;)Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x14

    invoke-interface {v1, v3, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_52

    :cond_5e
    const/16 v3, 0x14

    const/16 v5, 0x13

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    :goto_52
    iget-object v0, v0, LS9/m;->a:Ljava/lang/String;

    const/16 v5, 0x15

    invoke-interface {v1, v5, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_10
    move-object/from16 v0, p2

    check-cast v0, LPc/b;

    iget-object v2, v0, LPc/b;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LOc/n;

    iget-object v2, v8, LOc/n;->d:Lio/sentry/hints/i;

    iget-object v2, v0, LPc/b;->b:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_5f

    invoke-interface {v1, v7}, LL4/d;->M(I)V

    goto :goto_53

    :cond_5f
    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_53
    iget-object v2, v0, LPc/b;->c:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_60

    invoke-interface {v1, v6}, LL4/d;->M(I)V

    goto :goto_54

    :cond_60
    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_54
    iget-object v2, v0, LPc/b;->d:Ljava/time/Instant;

    invoke-static {v2}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_61

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    goto :goto_55

    :cond_61
    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_55
    iget-object v0, v0, LPc/b;->a:Ljava/lang/String;

    invoke-interface {v1, v4, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_11
    move-object/from16 v0, p2

    check-cast v0, LKd/i;

    iget-object v10, v0, LKd/i;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v9, v0, LKd/i;->b:Ljava/lang/String;

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v7, v0, LKd/i;->c:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget v6, v0, LKd/i;->d:I

    int-to-long v6, v6

    invoke-interface {v1, v5, v6, v7}, LL4/d;->w(IJ)V

    iget v5, v0, LKd/i;->e:I

    int-to-long v5, v5

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    check-cast v8, LJd/o;

    invoke-static {v8}, LJd/o;->e(LJd/o;)Lxc/g;

    move-result-object v4

    iget-object v5, v0, LKd/i;->f:Ljava/time/LocalDate;

    invoke-virtual {v4, v5}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, LKd/i;->a:Ljava/lang/String;

    invoke-interface {v1, v2, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-interface {v1, v15, v9}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_12
    move-object/from16 v0, p2

    check-cast v0, LKd/h;

    iget-object v10, v0, LKd/h;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LJd/n;

    invoke-virtual {v8}, LJd/n;->a()Lxc/g;

    move-result-object v9

    iget-object v10, v0, LKd/h;->b:Ljava/time/LocalDate;

    invoke-virtual {v9, v10}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v1, v7, v9}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v7, v0, LKd/h;->c:Ljava/lang/String;

    invoke-interface {v1, v6, v7}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v6, v0, LKd/h;->d:Ljava/lang/String;

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v5, v0, LKd/h;->e:Z

    int-to-long v5, v5

    invoke-interface {v1, v4, v5, v6}, LL4/d;->w(IJ)V

    iget-object v4, v0, LKd/h;->f:Ljava/lang/String;

    if-nez v4, :cond_62

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_56

    :cond_62
    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_56
    iget-object v3, v0, LKd/h;->g:Ljava/lang/Boolean;

    if-nez v3, :cond_63

    const/4 v3, 0x0

    goto :goto_57

    :cond_63
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    :goto_57
    if-nez v3, :cond_64

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_58

    :cond_64
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    int-to-long v3, v3

    invoke-interface {v1, v2, v3, v4}, LL4/d;->w(IJ)V

    :goto_58
    iget-object v0, v0, LKd/h;->a:Ljava/lang/String;

    invoke-interface {v1, v15, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, LJd/n;->a()Lxc/g;

    move-result-object v0

    invoke-virtual {v0, v10}, Lxc/g;->b(Ljava/time/LocalDate;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v14, v0}, LL4/d;->g(ILjava/lang/String;)V

    invoke-interface {v1, v13, v7}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_13
    move-object/from16 v0, p2

    check-cast v0, LMd/d;

    iget-object v10, v0, LMd/d;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v10}, LL4/d;->g(ILjava/lang/String;)V

    iget-boolean v10, v0, LMd/d;->b:Z

    int-to-long v11, v10

    invoke-interface {v1, v7, v11, v12}, LL4/d;->w(IJ)V

    iget-boolean v7, v0, LMd/d;->c:Z

    int-to-long v10, v7

    invoke-interface {v1, v6, v10, v11}, LL4/d;->w(IJ)V

    check-cast v8, LJd/m;

    iget-object v6, v8, LJd/m;->d:Ljava/lang/Object;

    const-string v6, "capabilities"

    iget-object v7, v0, LMd/d;->d:Ljava/util/List;

    invoke-static {v7, v6}, Lkotlin/jvm/internal/l;->j(Ljava/lang/Object;Ljava/lang/String;)V

    new-instance v6, LId/u;

    invoke-direct {v6, v9}, LId/u;-><init>(I)V

    const-string v17, ","

    const/16 v21, 0x1e

    const/16 v18, 0x0

    const/16 v19, 0x0

    move-object/from16 v20, v6

    move-object/from16 v16, v7

    invoke-static/range {v16 .. v21}, LIm/r;->i1(Ljava/lang/Iterable;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;LVm/k;I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v5, v6}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v5, v0, LMd/d;->e:Ljava/time/Instant;

    invoke-static {v5}, Lio/sentry/hints/i;->x(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_65

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    goto :goto_59

    :cond_65
    invoke-interface {v1, v4, v5}, LL4/d;->g(ILjava/lang/String;)V

    :goto_59
    iget-object v4, v0, LMd/d;->f:Ljava/lang/String;

    if-nez v4, :cond_66

    invoke-interface {v1, v3}, LL4/d;->M(I)V

    goto :goto_5a

    :cond_66
    invoke-interface {v1, v3, v4}, LL4/d;->g(ILjava/lang/String;)V

    :goto_5a
    iget-object v3, v0, LMd/d;->g:Ljava/lang/String;

    if-nez v3, :cond_67

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    goto :goto_5b

    :cond_67
    invoke-interface {v1, v2, v3}, LL4/d;->g(ILjava/lang/String;)V

    :goto_5b
    iget-boolean v2, v0, LMd/d;->i:Z

    int-to-long v2, v2

    invoke-interface {v1, v15, v2, v3}, LL4/d;->w(IJ)V

    iget-boolean v2, v0, LMd/d;->j:Z

    int-to-long v2, v2

    invoke-interface {v1, v14, v2, v3}, LL4/d;->w(IJ)V

    iget-boolean v2, v0, LMd/d;->k:Z

    int-to-long v2, v2

    invoke-interface {v1, v13, v2, v3}, LL4/d;->w(IJ)V

    iget-boolean v2, v0, LMd/d;->l:Z

    int-to-long v2, v2

    const/16 v4, 0xb

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-boolean v2, v0, LMd/d;->m:Z

    int-to-long v2, v2

    const/16 v4, 0xc

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-wide v2, v0, LMd/d;->n:J

    const/16 v4, 0xd

    invoke-interface {v1, v4, v2, v3}, LL4/d;->w(IJ)V

    iget-object v2, v0, LMd/d;->h:LMd/c;

    if-eqz v2, :cond_68

    iget-object v3, v2, LMd/c;->a:LMd/a;

    invoke-static {v8, v3}, LJd/m;->a(LJd/m;LMd/a;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xe

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v3, v2, LMd/c;->b:Lcom/eightsleep/data_user/enums/subscription/SubscriptionExpirationReason;

    invoke-static {v8, v3}, LJd/m;->b(LJd/m;Lcom/eightsleep/data_user/enums/subscription/SubscriptionExpirationReason;)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xf

    invoke-interface {v1, v4, v3}, LL4/d;->g(ILjava/lang/String;)V

    invoke-virtual {v8}, LJd/m;->c()Lxc/g;

    move-result-object v3

    iget-object v2, v2, LMd/c;->c:Ljava/time/Instant;

    invoke-virtual {v3, v2}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    const/16 v5, 0x10

    invoke-interface {v1, v5, v2}, LL4/d;->g(ILjava/lang/String;)V

    goto :goto_5c

    :cond_68
    const/16 v2, 0xe

    const/16 v4, 0xf

    const/16 v5, 0x10

    invoke-interface {v1, v2}, LL4/d;->M(I)V

    invoke-interface {v1, v4}, LL4/d;->M(I)V

    invoke-interface {v1, v5}, LL4/d;->M(I)V

    :goto_5c
    iget-object v0, v0, LMd/d;->a:Ljava/lang/String;

    const/16 v5, 0x11

    invoke-interface {v1, v5, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_14
    move-object/from16 v0, p2

    check-cast v0, LKd/f;

    iget-object v2, v0, LKd/f;->a:Ljava/lang/String;

    invoke-interface {v1, v9, v2}, LL4/d;->g(ILjava/lang/String;)V

    check-cast v8, LJd/h;

    iget-object v2, v8, LJd/h;->d:Ljava/lang/Object;

    iget-object v2, v0, LKd/f;->b:Ljava/util/Map;

    invoke-static {v2}, LDl/A0;->p(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_69

    invoke-interface {v1, v7}, LL4/d;->M(I)V

    goto :goto_5d

    :cond_69
    invoke-interface {v1, v7, v2}, LL4/d;->g(ILjava/lang/String;)V

    :goto_5d
    invoke-virtual {v8}, LJd/h;->a()Lxc/g;

    move-result-object v2

    iget-object v3, v0, LKd/f;->c:Ljava/time/Instant;

    invoke-virtual {v2, v3}, Lxc/g;->a(Ljava/time/Instant;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v6, v2}, LL4/d;->g(ILjava/lang/String;)V

    iget-object v0, v0, LKd/f;->a:Ljava/lang/String;

    invoke-interface {v1, v5, v0}, LL4/d;->g(ILjava/lang/String;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
