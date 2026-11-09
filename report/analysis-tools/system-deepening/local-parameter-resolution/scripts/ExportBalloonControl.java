import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.lang.Register;
import java.math.BigInteger;
import java.io.*;
public class ExportBalloonControl extends GhidraScript {
 public void run() throws Exception {
  String[] args=getScriptArgs(); File out=new File(args[0]);out.mkdirs();
  DecompInterface dc=new DecompInterface();DecompileOptions opts=new DecompileOptions();opts.setRespectReadOnly(true);dc.setOptions(opts);dc.openProgram(currentProgram);
  for(int n=1;n<args.length;n++){
   Address a=toAddr(Long.parseLong(args[n],16));
   Function f=getFunctionAt(a);
   if(f==null){if(getInstructionAt(a)==null){Register t=currentProgram.getRegister("TMode");currentProgram.getProgramContext().setValue(t,a,a,BigInteger.ONE);disassemble(a);}f=createFunction(a,"analysis_"+a);}
   if(f==null){println("NO FUNCTION "+a);continue;}
   try(PrintWriter w=new PrintWriter(new File(out,a+".txt"))){
    w.println("ORIGINAL SHA256 "+currentProgram.getExecutableSHA256());w.println("Analysis metadata only, no input bytes changed. Newly defined callback functions use existing Thumb bytes.");
    DecompileResults d=dc.decompileFunction(f,30,monitor);w.println(d.decompileCompleted()?d.getDecompiledFunction().getC():d.getErrorMessage());
    w.println("ASSEMBLY ORIGINAL BYTES");
    InstructionIterator it=currentProgram.getListing().getInstructions(f.getBody(),true);
    while(it.hasNext()){Instruction i=it.next();w.print(i.getAddress()+" ");for(byte b:i.getBytes())w.printf("%02x",b&255);w.println(" "+i);}
   }
  }
  dc.dispose();
 }
}
