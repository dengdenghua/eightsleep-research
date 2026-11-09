import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import java.util.*;
// New analysis database metadata only. Original BBIN is never changed.
// One prologue08014298; compiler BL branches stay in the event loop; next
// separate function prologue08017094. Retain before/after export and logs.
public class RepairPillowMain extends GhidraScript {
 public void run() throws Exception {
  currentProgram.getMemory().getBlock(toAddr(0x20000000L)).setWrite(true);
  Address lo=toAddr(0x08014298L),hi=toAddr(0x08017093L);
  ArrayList<Address> remove=new ArrayList<>();
  for(Function f:currentProgram.getFunctionManager().getFunctions(lo,true)){
   if(f.getEntryPoint().compareTo(hi)>0)break;remove.add(f.getEntryPoint());
  }
  for(Address a:remove){println("REMOVE_MAIN_FRAGMENT "+a);currentProgram.getFunctionManager().removeFunction(a);}
  for(Instruction i:currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true)){
   int opcode=getShort(i.getAddress())&65535;
   if((opcode&0xf800)==0xe000 && i.getFlowOverride()!=FlowOverride.NONE){println("CLEAR_16BIT_BRANCH_OVERRIDE "+i.getAddress());i.setFlowOverride(FlowOverride.NONE);}
   if(!i.getMnemonicString().equalsIgnoreCase("bl"))continue;
   Address[] flows=i.getFlows();
   if(flows.length==1&&flows[0].compareTo(lo)>=0&&flows[0].compareTo(hi)<=0){println("MAIN_BL_BRANCH "+i.getAddress()+" -> "+flows[0]);i.setFlowOverride(FlowOverride.BRANCH);}
  }
  Function f=createFunction(lo,"pillow_main");AddressSet body=new AddressSet();
  for(Instruction i:currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true))body.add(i.getMinAddress(),i.getMaxAddress());
  f.setBody(body);println("REBUILT_MAIN "+f.getBody());
 }
}
