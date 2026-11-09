import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.mem.*;
import java.math.BigInteger;
public class InitPillow extends GhidraScript {
 public void run() throws Exception {
  long base=0x08008000L,length=90220;
  setAnalysisOption(currentProgram,"Non-Returning Functions - Discovered","false");
  currentProgram.getMemory().getBlock(toAddr(base)).setWrite(false);
  currentProgram.getProgramContext().setValue(currentProgram.getRegister("TMode"),toAddr(base),toAddr(base+length-1),BigInteger.ONE);
  currentProgram.getMemory().createUninitializedBlock("SRAM",toAddr(0x20000000L),0x24000,false).setWrite(true);
  for(int i=1;i<46;i++) {
   long raw=Integer.toUnsignedLong(getInt(toAddr(base+128+i*4)));
   if((raw&1)==1 && raw>=base+128 && raw<base+length) {
    Address a=toAddr(raw&~1L);disassemble(a);
    if(getFunctionAt(a)==null)createFunction(a,i==1?"Reset_Handler":"vector_handler_"+i);
    currentProgram.getSymbolTable().addExternalEntryPoint(a);
   }
  }
 }
}
