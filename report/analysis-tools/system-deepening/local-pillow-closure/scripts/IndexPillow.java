import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import java.io.*;
public class IndexPillow extends GhidraScript {
 public void run() throws Exception {
  File out=new File(getScriptArgs()[0]);out.mkdirs();
  try(PrintWriter w=new PrintWriter(new File(out,"functions.txt"))){
   for(Function f:currentProgram.getFunctionManager().getFunctions(true))w.println(f.getEntryPoint()+" "+f.getName()+" "+f.getBody());
  }
  try(PrintWriter w=new PrintWriter(new File(out,"strings-refs.txt"))){
   long a=0x08008000L,end=a+90220;
   while(a<end){long start=a;StringBuilder s=new StringBuilder();
    while(a<end){int c=getByte(toAddr(a))&255;if(c<32||c>126)break;s.append((char)c);a++;}
    if(s.length()>=5){w.println("STRING "+Long.toHexString(start)+" "+s);
     for(Reference r:getReferencesTo(toAddr(start))){Function f=getFunctionContaining(r.getFromAddress());w.println(" REF "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(f==null?"none":f.getEntryPoint()));}}
    a++;
   }
  }
 }
}
