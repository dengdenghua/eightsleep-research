import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import java.util.*;
public class RepairControl53 extends GhidraScript {
 public void run() throws Exception {
  Address lo=toAddr(0x0801972cL),hi=toAddr(0x0801a583L);
  ArrayList<Address> old=new ArrayList<>();
  FunctionIterator fs=currentProgram.getFunctionManager().getFunctions(lo,true);
  while(fs.hasNext()){Function f=fs.next();if(f.getEntryPoint().compareTo(hi)>0)break;old.add(f.getEntryPoint());}
  for(Address a:old){println("REMOVE_FRAGMENT "+a);currentProgram.getFunctionManager().removeFunction(a);}
  for(int j=0;j<19;j++){
   long a=0x08019770L+2*(getShort(toAddr(0x08019770L+2*j))&65535);
   println("SUB "+(j+1)+" TARGET "+toAddr(a));disassemble(toAddr(a));
  }
  InstructionIterator it=currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true);
  while(it.hasNext()){
   Instruction i=it.next();
   if(i.getMnemonicString().equalsIgnoreCase("push")||i.getMnemonicString().equalsIgnoreCase("pop"))println("FRAME "+i.getAddress()+" "+i);
   if(!i.getMnemonicString().equalsIgnoreCase("bl"))continue;
   Address[] dst=i.getFlows();if(dst.length==1&&dst[0].compareTo(lo)>=0&&dst[0].compareTo(hi)<=0){println("INTERNAL_LONG_BRANCH "+i.getAddress()+" -> "+dst[0]);i.setFlowOverride(FlowOverride.BRANCH);}
  }
  Function f=createFunction(lo,"analysis_control_loop_configure");
  AddressSet body=new AddressSet();it=currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true);
  while(it.hasNext()){Instruction i=it.next();body.add(i.getMinAddress(),i.getMaxAddress());}
  if(f!=null)f.setBody(body);
 }
}
