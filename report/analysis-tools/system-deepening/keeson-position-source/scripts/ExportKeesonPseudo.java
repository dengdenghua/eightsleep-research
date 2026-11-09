import ghidra.app.script.GhidraScript;
import ghidra.app.util.PseudoDisassembler;
import ghidra.app.util.PseudoDisassemblerContext;
import ghidra.app.util.PseudoInstruction;
import ghidra.program.model.address.Address;
import java.math.BigInteger;
import java.io.*;

// Ephemeral decoding only. Never create instructions/functions or change ProgramContext.
public class ExportKeesonPseudo extends GhidraScript {
 public void run() throws Exception {
  if(!"1856c1baec5f9bca7151e5b550fdf0a8d749e87f889d963a3a343293a4160966".equals(currentProgram.getExecutableSHA256()))throw new IllegalStateException("Wrong input SHA256");
  String[] args=getScriptArgs(); File out=new File(args[0]);out.mkdirs();
  PseudoDisassembler decoder=new PseudoDisassembler(currentProgram);
  for(int n=1;n<args.length;n++){
   String[] rr=args[n].split(":");
   long start=Long.parseLong(rr[0],16),end=Long.parseLong(rr[1],16);
   PseudoDisassemblerContext context=new PseudoDisassemblerContext(currentProgram.getProgramContext());
   context.flowStart(toAddr(start));
   context.setValue(currentProgram.getRegister("TMode"),BigInteger.ONE);
   try(PrintWriter w=new PrintWriter(new File(out,rr[0]+"_"+rr[1]+".txt"))){
    w.println("PSEUDO_RANGE "+rr[0]+" "+rr[1]+" Thumb TMode=1; transient decoder only, no database mutations; range anchors require caller review");
    for(long pos=start;pos<=end;){
     Address a=toAddr(pos);PseudoInstruction i=decoder.disassemble(a,context,false);
     byte[] bytes=i.getBytes();StringBuilder hex=new StringBuilder();
     for(byte b:bytes)hex.append(String.format("%02x",b&255));
     w.print("INSN "+a+" "+hex+" "+i);
     int h=(bytes[0]&255)|((bytes[1]&255)<<8);
     if((h&0xf800)==0x4800){
      Address lit=toAddr(((pos+4)&~3L)+((h&255)*4));
      w.print(" REF[READ:"+lit+"="+Integer.toHexString(getInt(lit))+"]");
     }
     w.println();pos+=i.getLength();
    }
   }
  }
 }
}
