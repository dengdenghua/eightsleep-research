import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import java.util.*;
public class RepairLegacySensor extends GhidraScript {
 public void run() throws Exception {
  // Analysis metadata only: main has one prologue and non-returning loop.
  // Intra-main BL targets have no prologues and branch back into main.
  currentProgram.getMemory().getBlock(toAddr(0x08005000L)).setWrite(false);
  currentProgram.getMemory().getBlock(toAddr(0x20000000L)).setWrite(true);
  if(currentProgram.getMemory().getBlock(toAddr(0x40000000L))==null){
   ghidra.program.model.mem.MemoryBlock m=currentProgram.getMemory().createUninitializedBlock("MMIO",toAddr(0x40000000L),0x10000000L,false);m.setWrite(true);m.setVolatile(true);
  }
  if(currentProgram.getMemory().getBlock(toAddr(0xe0000000L))==null){
   ghidra.program.model.mem.MemoryBlock m=currentProgram.getMemory().createUninitializedBlock("SYSTEM_MMIO",toAddr(0xe0000000L),0x100000L,false);m.setWrite(true);m.setVolatile(true);
  }
  Address lo=toAddr(0x0800bedcL),hi=toAddr(0x0800e083L);
  ArrayList<Address> remove=new ArrayList<>();
  for(Function f:currentProgram.getFunctionManager().getFunctions(lo,true)) {
   if(f.getEntryPoint().compareTo(hi)>0)break;
   println("MAIN_FRAGMENT "+f.getEntryPoint());remove.add(f.getEntryPoint());
  }
  for(Address a:remove)currentProgram.getFunctionManager().removeFunction(a);
  for(Instruction i:currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true)) {
   int opcode=getShort(i.getAddress())&65535;
   if((opcode&0xf800)==0xe000 && i.getFlowOverride()!=FlowOverride.NONE)i.setFlowOverride(FlowOverride.NONE);
   Address[] targets=i.getFlows();
   if(i.getMnemonicString().equalsIgnoreCase("bl") && targets.length==1 && targets[0].compareTo(lo)>=0 && targets[0].compareTo(hi)<=0) {
    println("INTRA_MAIN_BL_AS_BRANCH "+i.getAddress()+" -> "+targets[0]);i.setFlowOverride(FlowOverride.BRANCH);
   }
  }
  Function f=createFunction(lo,"analyst_main_loop");
  AddressSet body=new AddressSet();
  for(Instruction i:currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true))body.add(i.getMinAddress(),i.getMaxAddress());
  f.setBody(body);
  println("MAIN_REBUILT "+f.getBody());
 }
}
