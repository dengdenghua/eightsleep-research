/* Static Ghidra pseudocode; not original source. */

undefined4 FUN_000307f8(int *param_1)

{
  char cVar1;
  bool bVar2;
  int iVar3;
  int *piVar4;
  int iVar5;
  undefined4 uVar6;
  uint uVar7;
  int *piVar8;
  
  iVar3 = DAT_20003674;
  bVar2 = false;
  do {
    if (param_1 == (int *)0x0) {
      do {
        while( true ) {
          if (DAT_20005498 == DAT_20005499) {
            if ((bVar2) || (DAT_20003674 != iVar3)) {
              uVar6 = 1;
            }
            else {
              uVar6 = 0;
            }
            return uVar6;
          }
LAB_00030818:
          uVar7 = (uint)DAT_20005498;
          DAT_20005498 = (byte)(uVar7 + 1);
          iVar5 = uVar7 * 0x18;
          if ((uVar7 + 1 & 0xff) == (uint)DAT_2000549a) {
            DAT_20005498 = 0;
          }
          piVar4 = (int *)(&DAT_200054a0)[uVar7 * 6];
          cVar1 = (&DAT_2000549c)[iVar5];
          if (cVar1 == '\x01') break;
          if (cVar1 == '\x02') {
            iVar5 = FUN_0003613c();
            if (iVar5 != 0) {
              bVar2 = true;
            }
            *(undefined1 *)(piVar4 + 4) = 0;
          }
          else if (cVar1 == '\x03') {
            for (; DAT_20003674 != 0; DAT_20003674 = *(int *)(DAT_20003674 + 0x1c)) {
              *(undefined1 *)(DAT_20003674 + 0x10) = 0;
            }
          }
        }
      } while ((char)piVar4[4] != '\0');
      piVar4[1] = *(int *)(&DAT_200054a4 + iVar5);
      piVar4[2] = *(int *)(&DAT_200054a8 + iVar5);
      piVar4[3] = *(int *)(&DAT_200054ac + iVar5);
      piVar4[6] = *(int *)(&DAT_200054b0 + iVar5);
      piVar8 = param_1;
      if (DAT_20003673 != '\0') {
        piVar4[1] = 0;
      }
    }
    else {
      if (param_1 == (int *)0x0) goto LAB_00030818;
      piVar8 = (int *)param_1[7];
      piVar4 = param_1;
    }
    uVar7 = piVar4[1] - DAT_20003678 & 0xffffff;
    if (uVar7 < 0x7fffff) {
      iVar5 = uVar7 + piVar4[2];
LAB_000308a8:
      *piVar4 = iVar5;
    }
    else {
      uVar7 = DAT_20003678 - piVar4[1] & 0xffffff;
      if (uVar7 < (uint)piVar4[2]) {
        iVar5 = piVar4[2] - uVar7;
        goto LAB_000308a8;
      }
      *piVar4 = 0;
    }
    piVar4[1] = 0;
    piVar4[2] = 0;
    *(undefined1 *)(piVar4 + 4) = 1;
    piVar4[7] = 0;
    FUN_00036100(piVar4);
    param_1 = piVar8;
  } while( true );
}


