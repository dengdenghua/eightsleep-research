import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
public class ExportControl extends GhidraScript {
 public void run() throws Exception {
  String[] a=getScriptArgs(); File out=new File(a[0]);out.mkdirs();
  if(a.length>1 && a[1].equals("080090d0") && getFunctionAt(toAddr("080090e0"))!=null)removeFunctionAt(toAddr("080090e0"));
  for(int j=1;j<a.length;j++){Address p=toAddr(a[j]);if(getFunctionAt(p)==null){disassemble(p);createFunction(p,null);}}
  if(a.length>1 && a[1].equals("080090d0"))getFunctionAt(toAddr("080090d0")).setBody(new AddressSet(toAddr("080090d0"),toAddr("08009115")));
  DecompInterface dc=new DecompInterface();dc.openProgram(currentProgram);
  for(int j=1;j<a.length;j++){Address p=toAddr(a[j]);Function f=getFunctionAt(p);
   try(PrintWriter w=new PrintWriter(new File(out,a[j]+".txt"))){
    w.println("TARGET "+p+" function="+f);if(f==null)continue;
    w.println("BODY "+f.getBody());DecompileResults d=dc.decompileFunction(f,60,monitor);
    if(d.decompileCompleted())w.println(d.getDecompiledFunction().getC());else w.println(d.getErrorMessage());
    for(Instruction i:currentProgram.getListing().getInstructions(f.getBody(),true)){
     w.print("INSN "+i.getAddress()+" ");for(byte v:i.getBytes())w.printf("%02x",v&255);w.print(" "+i);
     for(Reference r:i.getReferencesFrom()){w.print(" REF "+r.getReferenceType()+"="+r.getToAddress());if(r.getReferenceType().isData())try{w.print(" WORD="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception ex){}}
     w.println();
    }
   }
  }dc.dispose();
 }
}
