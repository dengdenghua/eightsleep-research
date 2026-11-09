import ghidra.app.script.GhidraScript;
import java.math.BigInteger;
public class InitNeighbor extends GhidraScript {
 public void run() throws Exception {
  if(!"327da40373ac54593e8cba6662d2368192355490d269a8b59894b648636613ea".equals(currentProgram.getExecutableSHA256()))throw new IllegalStateException("Wrong neighbor");
  currentProgram.getProgramContext().setValue(currentProgram.getRegister("TMode"),toAddr(0x26000),toAddr(0x381d7),BigInteger.ONE);
  currentProgram.getMemory().getBlock(toAddr(0x26000)).setWrite(false);
  currentProgram.getMemory().createUninitializedBlock("SRAM",toAddr(0x20000000L),0x10000,false).setWrite(true);
  for(String s:getScriptArgs()){var a=toAddr(Long.parseLong(s,16));disassemble(a);if(getFunctionAt(a)==null)createFunction(a,"candidate_"+s);}
 }
}
