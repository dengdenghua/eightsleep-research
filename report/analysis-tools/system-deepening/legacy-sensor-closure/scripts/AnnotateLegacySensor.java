import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.data.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.pcode.JumpTable;
import java.util.*;
public class AnnotateLegacySensor extends GhidraScript {
 private void type(long a,String name,DataType ret,DataType...args)throws Exception{
  Address ad=toAddr(a);Function f=getFunctionAt(ad);if(f==null){disassemble(ad);f=createFunction(ad,null);}
  if(f==null){println("MISSING "+ad);return;}
  f.setCallingConvention("__stdcall_softfp");
  f.setName("analyst_"+name,SourceType.USER_DEFINED);Parameter[]p=new Parameter[args.length];
  for(int i=0;i<args.length;i++)p[i]=new ParameterImpl("arg"+i,args[i],currentProgram);
  f.replaceParameters(Function.FunctionUpdateType.DYNAMIC_STORAGE_ALL_PARAMS,true,SourceType.USER_DEFINED,p);f.setReturnType(ret,SourceType.USER_DEFINED);
  println(ad+" "+f.getSignature());
 }
 public void run() throws Exception {
  for(Function x:currentProgram.getFunctionManager().getFunctions(true))x.setCallingConvention("__stdcall_softfp");
  DataType f=FloatDataType.dataType,d=DoubleDataType.dataType,i=IntegerDataType.dataType,u=UnsignedIntegerDataType.dataType,v=VoidDataType.dataType,p=PointerDataType.dataType;
  long[]fa={0x8005764L,0x8005f20L,0x8005a98L,0x8005cbcL};String[]fn={"fadd","fsub","fdiv","fmul"};for(int x=0;x<fa.length;x++)type(fa[x],fn[x],f,f,f);
  long[]da={0x80063fcL,0x8006a34L,0x8007248L,0x800772cL};String[]dn={"dadd","ddiv","dmul","dsub"};for(int x=0;x<da.length;x++)type(da[x],dn[x],d,d,d);
  type(0x8007f00L,"float_to_double",d,f);type(0x8007fa4L,"double_to_float",f,d);type(0x800637cL,"uint_to_float",f,u);type(0x80062e8L,"int_to_float",f,i);type(0x8007e28L,"int_to_double",d,i);type(0x80062a8L,"float_to_int",i,f);type(0x8005728L,"double_to_uint",u,d);type(0x8007dbcL,"double_to_int",i,d);
  long[]fc={0x8005180L,0x800518cL,0x80051a0L,0x80051b4L,0x80051c8L};String[]cn={"feq","flt","fle","fgt","fge"};for(int x=0;x<fc.length;x++)type(fc[x],cn[x],i,f,f);
  long[]dc={0x800569cL,0x80056a8L,0x80056bcL,0x80056d0L,0x80056e4L};String[]cd={"deq","dlt","dle","dgt","dge"};for(int x=0;x<dc.length;x++)type(dc[x],cd[x],i,d,d);
  type(0x800b354L,"ln_series",d,d);type(0x800b400L,"temperature_channel",f,u);type(0x800b710L,"temperature_routed",f,u);type(0x800b7c8L,"temperature_cached",f,u);
  type(0x8008da0L,"weighted_temperature_pair",f,f,f,f);type(0x8008c5cL,"die_temperature",f);type(0x8008e2cL,"combine_temperature_three",f,f,f,f,f);type(0x8008ef4L,"combine_temperature_two",f,f,f,f);
  type(0x800e120L,"copy_bytes",v,p,p,u);type(0x800e132L,"fill_bytes",v,p,i,u);type(0x8009b30L,"ring_push",i,p,p);type(0x8009b64L,"internal_adc_timer_sample",v,p);type(0x8008f48L,"internal_adc_scaled_u16",UnsignedShortDataType.dataType,u);
  type(0x80092e0L,"main_state_callback",v,p);type(0x80090acL,"heater_output_callback",v,p,u);type(0x80090c8L,"heater_state_callback",u,p);type(0x800b834L,"temperature_side_callback",f,p);
  Function main=getFunctionAt(toAddr(0x800bedcL));ArrayList<Address>dest=new ArrayList<>();for(int x=0;x<4;x++){Address ad=toAddr(0x800d388L+(getByte(toAddr(0x800d388L+x))&255)*2L);disassemble(ad);if(!dest.contains(ad))dest.add(ad);println("COMMAND_SWITCH "+(x+2)+" -> "+ad);}new JumpTable(toAddr(0x800d384L),dest,true,0).writeOverride(main);
  AddressSet body=new AddressSet();for(Instruction ins:currentProgram.getListing().getInstructions(new AddressSet(toAddr(0x800bedcL),toAddr(0x800e083L)),true))body.add(ins.getMinAddress(),ins.getMaxAddress());main.setBody(body);
 }
}
