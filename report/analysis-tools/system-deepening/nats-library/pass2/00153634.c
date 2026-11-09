/* Ghidra static pseudocode; not original source. Read-only project; no target execution. */

undefined8 nats_JSONGetField(long param_1,char *param_2,int param_3,long *param_4)

{
  int iVar1;
  size_t sVar2;
  undefined8 *puVar3;
  undefined8 uVar4;
  
  sVar2 = strlen(param_2);
  puVar3 = (undefined8 *)natsStrHash_GetEx(*(undefined8 *)(param_1 + 8),param_2,sVar2 & 0xffffffff);
  if (puVar3 == (undefined8 *)0x0) {
LAB_00153740:
    *param_4 = 0;
    return 0;
  }
  iVar1 = *(int *)(puVar3 + 1);
  if (iVar1 == 9) goto LAB_00153740;
  if (param_3 < 7) {
    if (3 < param_3) {
      if (iVar1 != 3) {
        uVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/util.c"
                                  ,"nats_JSONGetField",0x47d,0x10,
                                  "Asked for field \'%s\' as type %d, but got type %d when parsing",
                                  *puVar3,param_3);
        return uVar4;
      }
      goto LAB_001536a0;
    }
    if (1 < param_3 - 1U) goto LAB_001536c0;
  }
  else if (param_3 != 8) {
LAB_001536c0:
    uVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/util.c",
                              "nats_JSONGetField",0x48a,0x10,
                              "Asked for field \'%s\' as type %d, but this type does not exist",
                              *puVar3,param_3);
    return uVar4;
  }
  if (iVar1 != param_3) {
    uVar4 = nats_setErrorReal("/home/ubuntu/src/frankenfirmware/build/_deps/nats.c-src/src/util.c",
                              "nats_JSONGetField",0x485,0x10,
                              "Asked for field \'%s\' as type %d, but got type %d when parsing",
                              *puVar3,param_3);
    return uVar4;
  }
LAB_001536a0:
  *param_4 = (long)puVar3;
  return 0;
}


