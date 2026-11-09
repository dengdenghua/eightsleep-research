/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined4 * FUN_001af480(undefined4 *param_1,undefined8 param_2,undefined8 *param_3)

{
  undefined4 uVar1;
  undefined4 *puVar2;
  undefined8 uVar3;
  undefined4 *puVar4;
  long lVar5;
  long lVar6;
  undefined4 *puVar7;
  undefined4 *puVar8;
  undefined4 *puVar9;
  
  puVar2 = (undefined4 *)FUN_001af1d0(param_3,param_1 + 8);
  uVar1 = *param_1;
  *(undefined8 *)(puVar2 + 2) = param_2;
  *(undefined8 *)(puVar2 + 4) = 0;
  *(undefined8 *)(puVar2 + 6) = 0;
  *puVar2 = uVar1;
  if (*(long *)(param_1 + 6) != 0) {
    uVar3 = FUN_001af480(*(long *)(param_1 + 6),puVar2,param_3);
    *(undefined8 *)(puVar2 + 6) = uVar3;
  }
  puVar8 = *(undefined4 **)(param_1 + 4);
  if (puVar8 == (undefined4 *)0x0) {
    return puVar2;
  }
  puVar7 = (undefined4 *)param_3[1];
  puVar9 = puVar2;
  if (puVar7 == (undefined4 *)0x0) goto LAB_001af60c;
  do {
    lVar6 = *(long *)(puVar7 + 2);
    param_3[1] = lVar6;
    if (lVar6 == 0) {
      *param_3 = 0;
    }
    else if (puVar7 == *(undefined4 **)(lVar6 + 0x18)) {
      lVar5 = *(long *)(lVar6 + 0x10);
      *(undefined8 *)(lVar6 + 0x18) = 0;
      if (lVar5 != 0) {
        lVar6 = *(long *)(lVar5 + 0x18);
        param_3[1] = lVar5;
        if (lVar6 != 0) {
          do {
            lVar5 = lVar6;
            lVar6 = *(long *)(lVar5 + 0x18);
          } while (*(long *)(lVar5 + 0x18) != 0);
          param_3[1] = lVar5;
        }
        if (*(long *)(lVar5 + 0x10) != 0) {
          param_3[1] = *(long *)(lVar5 + 0x10);
        }
      }
    }
    else {
      *(undefined8 *)(lVar6 + 0x10) = 0;
    }
    if (*(undefined4 **)(puVar7 + 0x20) != puVar7 + 0x24) {
      operator_delete(*(undefined4 **)(puVar7 + 0x20),*(long *)(puVar7 + 0x24) + 1);
    }
    if (*(undefined4 **)(puVar7 + 0x18) != puVar7 + 0x1c) {
      operator_delete(*(undefined4 **)(puVar7 + 0x18),*(long *)(puVar7 + 0x1c) + 1);
    }
    if (*(undefined4 **)(puVar7 + 0x10) != puVar7 + 0x14) {
      operator_delete(*(undefined4 **)(puVar7 + 0x10),*(long *)(puVar7 + 0x14) + 1);
    }
    puVar4 = *(undefined4 **)(puVar7 + 8);
    if (puVar4 != puVar7 + 0xc) {
      operator_delete(puVar4,*(long *)(puVar7 + 0xc) + 1);
    }
    FUN_00198030(puVar7 + 8,puVar8 + 8);
    FUN_00198030(puVar7 + 0x10,puVar8 + 0x10);
    FUN_00198030(puVar7 + 0x18,puVar8 + 0x18);
    FUN_00198030(puVar7 + 0x20,puVar8 + 0x20);
    puVar4 = puVar7;
    while( true ) {
      *puVar4 = *puVar8;
      *(undefined8 *)(puVar4 + 4) = 0;
      *(undefined8 *)(puVar4 + 6) = 0;
      *(undefined4 **)(puVar9 + 4) = puVar4;
      *(undefined4 **)(puVar4 + 2) = puVar9;
      if (*(long *)(puVar8 + 6) != 0) {
        uVar3 = FUN_001af480(*(long *)(puVar8 + 6),puVar4,param_3);
        *(undefined8 *)(puVar4 + 6) = uVar3;
      }
      puVar8 = *(undefined4 **)(puVar8 + 4);
      if (puVar8 == (undefined4 *)0x0) {
        return puVar2;
      }
      puVar7 = (undefined4 *)param_3[1];
      puVar9 = puVar4;
      if (puVar7 != (undefined4 *)0x0) break;
LAB_001af60c:
      puVar4 = operator_new(0xa0);
      FUN_00198030(puVar4 + 8,puVar8 + 8);
      FUN_00198030(puVar4 + 0x10,puVar8 + 0x10);
      FUN_00198030(puVar4 + 0x18,puVar8 + 0x18);
      FUN_00198030(puVar4 + 0x20,puVar8 + 0x20);
    }
  } while( true );
}


