import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import java.io.*;
public class ExportParameterRanges extends GhidraScript {
 public void run() throws Exception {
  String[] args=getScriptArgs();File out=new File(args[0]);out.mkdirs();
  for(int n=1;n<args.length;n+=2){Address lo=toAddr(Long.parseLong(args[n],16)),hi=toAddr(Long.parseLong(args[n+1],16));
   try(PrintWriter w=new PrintWriter(new File(out,lo+"-"+hi+".asm.txt"))){
    w.println("ORIGINAL SHA256 "+currentProgram.getExecutableSHA256());
    w.println("Existing Thumb listing, original bytes. Range end inclusive. Data/literal gaps excluded; raw input remains authoritative.");
    InstructionIterator it=currentProgram.getListing().getInstructions(new AddressSet(lo,hi),true);
    while(it.hasNext()){Instruction i=it.next();w.print(i.getAddress()+" ");for(byte b:i.getBytes())w.printf("%02x",b&255);w.println(" "+i);}
   }
  }
 }
}
