/* Static Ghidra pseudocode; not original source. */

void FUN_00030748(float param_1,int param_2)

{
  float fVar1;
  float fVar2;
  float fVar3;
  
  fVar2 = *(float *)(&DAT_2000354c + param_2 * 4) + 0.05;
  *(float *)(&DAT_20004980 + param_2 * 4) = fVar2;
  fVar3 = fVar2 / (fVar2 + 10.05);
  fVar1 = *(float *)(&DAT_20004990 + param_2 * 4);
  *(float *)(&DAT_20004990 + param_2 * 4) = fVar1 + fVar3 * (param_1 - fVar1);
  *(float *)(&DAT_2000354c + param_2 * 4) = (1.0 - fVar3) * fVar2;
  return;
}


