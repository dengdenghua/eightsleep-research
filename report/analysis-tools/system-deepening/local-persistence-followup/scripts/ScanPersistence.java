import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.scalar.*;
import java.io.*;
public class ScanPersistence extends GhidraScript {
 public void run() throws Exception {
  String[] a=getScriptArgs();File dir=new File(a[0]);dir.mkdirs();
  long lo=Long.parseLong(a[1],16),hi=Long.parseLong(a[2],16);
  int count=0;int selected=0;
  try(PrintWriter all=new PrintWriter(new File(dir,"decoded-instructions.tsv"));PrintWriter hits=new PrintWriter(new File(dir,"range-refs.tsv"));PrintWriter indirect=new PrintWriter(new File(dir,"indirect-and-svc.tsv"));PrintWriter funcs=new PrintWriter(new File(dir,"functions.tsv"))){
   for(Function f:currentProgram.getFunctionManager().getFunctions(true))funcs.println(f.getEntryPoint()+"\t"+f.getName()+"\t"+f.getBody());
   for(Instruction i:currentProgram.getListing().getInstructions(true)){
    Function f=getFunctionContaining(i.getAddress());String owner=f==null?"none":f.getEntryPoint().toString();StringBuilder line=new StringBuilder(i.getAddress()+"\t"+owner+"\t");for(byte b:i.getBytes())line.append(String.format("%02x",b&255));line.append("\t"+i);
    boolean hit=false;
    for(int n=0;n<i.getNumOperands();n++)for(Object op:i.getOpObjects(n))if(op instanceof Scalar){long v=((Scalar)op).getUnsignedValue();if(v>=lo&&v<=hi)hit=true;}
    for(Reference r:i.getReferencesFrom()){
     line.append(" REF["+r.getReferenceType()+":"+r.getToAddress());long v=r.getToAddress().getOffset();if(v>=lo&&v<=hi)hit=true;
     if(r.getReferenceType().isData())try{long x=Integer.toUnsignedLong(getInt(r.getToAddress()));line.append("="+Long.toHexString(x));if(x>=lo&&x<=hi)hit=true;}catch(Exception e){}
     line.append("]");
    }
    all.println(line);count++;if(hit){hits.println(line);selected++;}
    String m=i.getMnemonicString().toLowerCase();if(i.getFlowType().isComputed()||m.startsWith("svc"))indirect.println(line);
   }
  }
  try(PrintWriter w=new PrintWriter(new File(dir,"coverage.txt"))){w.println("InputSHA256 "+currentProgram.getExecutableSHA256());w.println("Already-decoded instruction count "+count);w.println("Selected range-ref count "+selected);w.println("No new disassembly; range literal/reference matches are bounded locators, not arbitrary alias exclusion.");}
 }
}
