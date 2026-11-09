import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;import ghidra.program.model.symbol.*;import ghidra.program.model.listing.*;import java.io.*;
public class FindAcquisitionRefs extends GhidraScript {
 public void run() throws Exception {String[]a=getScriptArgs();try(PrintWriter w=new PrintWriter(new File(a[0]))){
 for(int j=1;j<a.length;j++){long n=Long.parseLong(a[j],16);w.println("TARGET "+a[j]);
 for(long x=0x08010000;x<=0x08032618;x+=2){Address ad=toAddr(x);if((getInt(ad)&0xffffffffL)!=n)continue;w.println("LITERAL "+ad);
 for(Reference r:getReferencesTo(ad)){Function f=getFunctionContaining(r.getFromAddress());w.println(" REF "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(f==null?"none":f.getEntryPoint()));}
 }
 for(Reference r:getReferencesTo(toAddr(n))){Function f=getFunctionContaining(r.getFromAddress());w.println("DIRECT_REF "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(f==null?"none":f.getEntryPoint()));}
 }}}
}
