/* Reconstructed Ghidra pseudocode, not vendor source. */

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined1  [16] FUN_003ef3b8(long *param_1,long *param_2)

{
  long *plVar1;
  long *plVar2;
  undefined8 uVar3;
  undefined8 uVar4;
  undefined8 *puVar5;
  long lVar6;
  long lVar7;
  undefined8 **ppuVar8;
  ulong uVar9;
  long *plVar10;
  long *plVar11;
  long lVar12;
  long *plVar13;
  undefined1 auVar14 [16];
  long *local_1f0;
  long local_1e8;
  long *local_1e0;
  long *local_1d8;
  long local_1d0;
  long *plStack_1c8;
  undefined8 ****local_1c0;
  long lStack_1b8;
  long local_1b0;
  undefined8 ****local_1a8;
  long lStack_1a0;
  long **local_198;
  long **pplStack_190;
  long **pplStack_188;
  long **local_180;
  long **pplStack_178;
  long **local_170;
  long **pplStack_168;
  long **local_160;
  undefined8 local_158;
  undefined8 ***local_150;
  long **pplStack_148;
  long **local_140;
  long **local_138;
  long **local_130;
  long **pplStack_128;
  long **local_120;
  long **local_118;
  undefined8 local_110;
  long ****local_108;
  code *local_100;
  undefined8 ****local_f8;
  long local_f0;
  undefined8 local_e8;
  char *pcStack_e0;
  undefined8 local_d8;
  undefined8 uStack_d0;
  undefined8 local_c8;
  undefined8 uStack_c0;
  undefined8 local_b8;
  char *pcStack_b0;
  undefined8 local_a8;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined **local_98;
  undefined8 uStack_90;
  undefined8 *****local_88;
  undefined8 uStack_80;
  undefined8 local_78;
  undefined1 uStack_61;
  
  uVar4 = _UNK_00789438;
  uVar3 = _DAT_00789430;
  plVar1 = (long *)param_2[1];
  lVar12 = *param_2;
  local_1f0 = (long *)0x0;
  local_1e8 = 0;
  plVar13 = plVar1 + param_2[2] * 3;
  local_1e0 = plVar1;
  local_1d0 = lVar12;
  plStack_1c8 = plVar13;
  if (param_2[2] == 0) {
    lVar7 = 0;
    ppuVar8 = (undefined8 **)0x0;
    plVar10 = plVar1;
  }
  else {
    lVar7 = 0;
    ppuVar8 = (undefined8 **)0x0;
    plVar2 = plVar1;
    local_1d8 = plVar1;
    do {
      plVar11 = plVar2 + 3;
      lStack_1b8 = plVar2[2];
      local_1c0 = (undefined8 ****)plVar2[1];
      plVar10 = plVar11;
      if (*plVar2 == -0x7fffffffffffffff) break;
      local_1b0 = *plVar2;
      local_1a8 = local_1c0;
      lStack_1a0 = lStack_1b8;
      FUN_0050bbd4(&local_198,&local_1b0);
      if ((undefined8 ***)local_198 == (undefined8 ***)0x8000000000000001) {
        pplStack_148 = pplStack_188;
        local_150 = (undefined8 ***)pplStack_190;
        local_138 = pplStack_178;
        local_140 = local_180;
        pplStack_128 = pplStack_168;
        local_130 = local_170;
        local_120 = local_160;
        if (*(long *)PTR_DAT_009fa8b0 == 5) {
          local_f8 = local_1a8;
          local_f0 = lStack_1a0;
          local_108 = (long ****)&local_f8;
          local_100 = FUN_0039f750;
          puVar5 = (undefined8 *)FUN_00721c48(&PTR_s__cargo_registry_src_index_crates_009d68b8);
          local_c8 = *puVar5;
          uStack_c0 = puVar5[1];
          local_9c = *(undefined4 *)(puVar5 + 2);
          local_78 = 0;
          local_b8 = 5;
          pcStack_b0 = 
          "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
          ;
          local_a8 = 0x17;
          local_98 = (undefined **)&DAT_009d68a8;
          uStack_90 = 1;
          local_88 = &local_108;
          uStack_80 = 1;
          local_e8 = 0;
          pcStack_e0 = 
          "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
          ;
          uStack_d0 = uVar4;
          local_d8 = uVar3;
          local_a0 = 1;
          FUN_00721c0c(&uStack_61,&local_e8);
        }
        if (3 < *(ulong *)PTR_DAT_009fa8b0) {
          local_f8 = &local_150;
          local_f0 = 0x3ee268;
          puVar5 = (undefined8 *)FUN_00721c48(&PTR_s__cargo_registry_src_index_crates_009d68e0);
          local_c8 = *puVar5;
          uStack_c0 = puVar5[1];
          local_9c = *(undefined4 *)(puVar5 + 2);
          local_78 = 0;
          local_b8 = 4;
          pcStack_b0 = 
          "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
          ;
          local_a8 = 0x17;
          local_98 = (undefined **)&DAT_009d68d0;
          uStack_90 = 1;
          local_88 = &local_f8;
          uStack_80 = 1;
          local_e8 = 0;
          pcStack_e0 = 
          "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
          ;
          uStack_d0 = uVar4;
          local_d8 = uVar3;
          local_a0 = 1;
          FUN_00721c0c(&uStack_61,&local_e8);
        }
        lVar7 = lVar7 + 1;
        local_1e8 = lVar7;
        FUN_003ed5d4(&local_150);
      }
      else {
        pplStack_128 = local_170;
        local_130 = pplStack_178;
        local_118 = local_160;
        local_120 = pplStack_168;
        local_110 = local_158;
        pplStack_148 = pplStack_190;
        local_150 = (undefined8 ***)local_198;
        local_138 = local_180;
        local_140 = pplStack_188;
        FUN_00602428(&local_e8,&local_150);
        lVar6 = param_1[2];
        if (lVar6 == *param_1) {
          FUN_004b2bb0(param_1,&PTR_s__cargo_registry_src_index_crates_009d6890);
        }
        puVar5 = (undefined8 *)(param_1[1] + lVar6 * 0x48);
        ppuVar8 = (undefined8 **)((long)ppuVar8 + 1);
        puVar5[3] = uStack_d0;
        puVar5[2] = local_d8;
        puVar5[5] = uStack_c0;
        puVar5[4] = local_c8;
        puVar5[7] = pcStack_b0;
        puVar5[6] = local_b8;
        puVar5[8] = local_a8;
        puVar5[1] = pcStack_e0;
        *puVar5 = local_e8;
        param_1[2] = lVar6 + 1;
        local_1f0 = (long *)ppuVar8;
        if ((local_150 != (undefined8 ***)0x8000000000000000) && (local_150 != (undefined8 ***)0x0))
        {
          FUN_0031865c(pplStack_148,local_150,1);
        }
        if (((undefined8 ***)local_138 != (undefined8 ***)0x8000000000000000) &&
           ((undefined8 ***)local_138 != (undefined8 ***)0x0)) {
          FUN_0031865c(local_130,local_138,1);
        }
        if ((-0x7fffffffffffffff < (long)local_120) &&
           ((undefined8 ***)local_120 != (undefined8 ***)0x0)) {
          FUN_0031865c(local_118,local_120,1);
        }
      }
      if ((local_1b0 != -0x8000000000000000) && (local_1b0 != 0)) {
        FUN_0031865c(local_1a8,local_1b0,1);
      }
      plVar2 = plVar11;
      plVar10 = plVar13;
    } while (plVar11 != plVar13);
  }
  local_1d8 = plVar10;
  if ((long)plVar13 - (long)local_1d8 != 0) {
    plVar10 = local_1d8 + 1;
    uVar9 = (ulong)((long)plVar13 - (long)local_1d8) / 0x18;
    do {
      lVar6 = plVar10[-1];
      if ((lVar6 != -0x8000000000000000) && (lVar6 != 0)) {
        FUN_0031865c(*plVar10,lVar6,1);
      }
      uVar9 = uVar9 - 1;
      plVar10 = plVar10 + 3;
    } while (uVar9 != 0);
  }
  if (lVar12 != 0) {
    FUN_0031865c(plVar1,lVar12 * 0x18,8);
  }
  if (3 < *(ulong *)PTR_DAT_009fa8b0) {
    local_150 = (undefined8 ***)&local_1f0;
    pplStack_148 = (long **)PTR_FUN_009fa168;
    local_140 = (long **)&local_1e8;
    local_138 = (long **)PTR_FUN_009fa168;
    puVar5 = (undefined8 *)FUN_00721c48(&PTR_s__cargo_registry_src_index_crates_009d6878);
    local_c8 = *puVar5;
    uStack_c0 = puVar5[1];
    local_9c = *(undefined4 *)(puVar5 + 2);
    local_b8 = 4;
    pcStack_b0 = 
    "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
    ;
    local_a8 = 0x17;
    local_98 = &PTR_s_add_parsable_certificates_proces_009d6848;
    uStack_90 = 3;
    local_88 = (undefined8 *****)&local_150;
    uStack_80 = 2;
    local_78 = 0;
    local_e8 = 0;
    pcStack_e0 = 
    "rustls::webpki::anchorsinvalid cert der certificate parsing failed: NatsStreamNatsSequenceNatsTimeStampNatsSubjectNatsMessageIdNatsLastStreamNatsExpectedLastSubjectSequenceNatsExpectedLastMessageIdNatsExpectedLastSequenceNatsExpectedStreamNatsMessageTtl"
    ;
    uStack_d0 = _UNK_00789438;
    local_d8 = _DAT_00789430;
    local_a0 = 1;
    FUN_00721c0c(&uStack_61,&local_e8);
    lVar7 = local_1e8;
    ppuVar8 = (undefined8 **)local_1f0;
  }
  auVar14._8_8_ = lVar7;
  auVar14._0_8_ = ppuVar8;
  return auVar14;
}


