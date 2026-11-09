/* Static Ghidra pseudocode; not original source. */

int FUN_0002ec50(int param_1,undefined4 param_2,int param_3)

{
  char cVar1;
  uint uVar2;
  uint uVar3;
  
  if (param_3 == 0) {
    uVar2 = 8;
    uVar3 = 0xe;
  }
  else {
    uVar2 = 0;
    uVar3 = 8;
  }
  while( true ) {
    if (uVar3 <= uVar2) {
      return -1;
    }
    if ((&DAT_20005308)[uVar2] == -1) break;
    uVar2 = uVar2 + 1;
  }
  cVar1 = (char)uVar2;
  (&DAT_20005340)[param_1] = cVar1;
  (&DAT_20005308)[uVar2] = param_2;
  if (param_3 != 0) {
    return (int)cVar1;
  }
  (&DAT_20005358)[uVar2] = (char)param_1;
  return (int)cVar1;
}


