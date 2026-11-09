import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import java.math.BigInteger;
public class InitLegacy extends GhidraScript {
 public void run() throws Exception {
  var flash=currentProgram.getMemory().getBlock(toAddr(0x08005000));flash.setWrite(false);flash.setExecute(true);
  currentProgram.getMemory().createUninitializedBlock("RAM",toAddr(0x20000000),0x2000,false);
  currentProgram.getProgramContext().setValue(currentProgram.getRegister("TMode"),toAddr(0x08005080),flash.getEnd(),BigInteger.ONE);
  for(long a=0x08005084;a<0x08005140;a+=4){long v=Integer.toUnsignedLong(getInt(toAddr(a)));if((v&1)==1 &&v>=0x08005080 &&v<=flash.getEnd().getOffset()){var entry=toAddr(v&~1L);disassemble(entry);if(getFunctionAt(entry)==null)createFunction(entry,"vector_"+Long.toHexString(a)+"_"+entry);}}
 }
}
