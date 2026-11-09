import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.pcode.*;
import ghidra.program.model.symbol.*;
import java.io.*;import java.util.*;
public class SlicePersistence extends GhidraScript {
 String expr(Varnode v,int depth,HashSet<Varnode> seen){
  if(v==null)return "null";if(v.isConstant())return "0x"+Long.toHexString(v.getOffset());
  String name=v.toString();try{HighVariable h=v.getHigh();if(h!=null&&h.getName()!=null)name=h.getName()+"@"+name;}catch(Exception e){}
  if(depth==0||seen.contains(v))return name;seen.add(v);PcodeOp d=v.getDef();if(d==null)return name;
  StringBuilder s=new StringBuilder(d.getMnemonic()+"(");for(int k=0;k<d.getNumInputs();k++){if(k>0)s.append(",");s.append(expr(d.getInput(k),depth-1,new HashSet<Varnode>(seen)));}return s.append(")").toString();
 }
 void dump(PrintWriter w,AddressSetView body)throws Exception{for(Instruction i:currentProgram.getListing().getInstructions(body,true)){w.print("INSN "+i.getAddress()+" ");for(byte b:i.getBytes())w.printf("%02x",b&255);w.print(" "+i);for(Reference r:i.getReferencesFrom()){w.print(" REF["+r.getReferenceType()+":"+r.getToAddress());if(r.getReferenceType().isData())try{w.print("="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception e){}w.print("]");}w.println();}}
 public void run()throws Exception{
  String[] a=getScriptArgs();if(!a[1].equals(currentProgram.getExecutableSHA256()))throw new IllegalStateException("identity mismatch");File o=new File(a[0]);o.mkdirs();TreeSet<Address> funcs=new TreeSet<>();int selected=0;
  try(PrintWriter sites=new PrintWriter(new File(o,"selected-sites.tsv"));PrintWriter missing=new PrintWriter(new File(o,"ownerless-context.txt"))){
   for(Instruction i:currentProgram.getListing().getInstructions(true)){
    boolean hit=i.getFlowType().isComputed()&&!i.getMnemonicString().toLowerCase().startsWith("tbb")&&!i.getMnemonicString().toLowerCase().startsWith("udf");
    for(Reference r:i.getReferencesFrom())if(r.getToAddress().getOffset()==0x2648cL||r.getToAddress().getOffset()==0x264beL)hit=true;
    if(!hit)continue;Function f=getFunctionContaining(i.getAddress());sites.println(i.getAddress()+"\t"+(f==null?"none":f.getEntryPoint())+"\t"+i);selected++;
    if(f!=null)funcs.add(f.getEntryPoint());else{missing.println("SITE "+i.getAddress());dump(missing,new AddressSet(i.getAddress().subtract(40),i.getAddress().add(24)));}
   }
  }
  for(int k=2;k<a.length;k++){Function f=getFunctionAt(toAddr(Long.parseLong(a[k],16)));if(f!=null)funcs.add(f.getEntryPoint());}
  DecompInterface dc=new DecompInterface();DecompileOptions opt=new DecompileOptions();opt.setRespectReadOnly(false);dc.setOptions(opt);dc.openProgram(currentProgram);
  int completed=0;try(PrintWriter slices=new PrintWriter(new File(o,"value-slices.tsv"));PrintWriter status=new PrintWriter(new File(o,"status.tsv"))){
   for(Address x:funcs){monitor.checkCancelled();Function f=getFunctionAt(x);DecompileResults d=dc.decompileFunction(f,30,monitor);status.println(x+"\t"+d.decompileCompleted()+"\t"+d.getErrorMessage());status.flush();
    try(PrintWriter w=new PrintWriter(new File(o,x+".txt"))){w.println("FUNCTION "+x+" BODY "+f.getBody());for(Reference r:getReferencesTo(x))w.println("REF_TO "+r.getFromAddress()+" "+r.getReferenceType());if(d.decompileCompleted()){completed++;w.println(d.getDecompiledFunction().getC());HighFunction h=d.getHighFunction();Iterator<PcodeOpAST> it=h.getPcodeOps();while(it.hasNext()){PcodeOpAST p=it.next();int op=p.getOpcode();if(op==PcodeOp.CALL||op==PcodeOp.CALLIND||op==PcodeOp.BRANCHIND||op==PcodeOp.STORE||op==PcodeOp.LOAD){slices.print(x+"\t"+p.getSeqnum().getTarget()+"\t"+p.getMnemonic());for(int k=0;k<p.getNumInputs();k++)slices.print("\t"+expr(p.getInput(k),6,new HashSet<Varnode>()));slices.println();}}}else w.println("DECOMPILE_ERROR "+d.getErrorMessage());dump(w,f.getBody());}
   }
  }dc.dispose();try(PrintWriter w=new PrintWriter(new File(o,"coverage.txt"))){w.println("SHA256 "+currentProgram.getExecutableSHA256());w.println("selected_sites "+selected);w.println("selected_functions "+funcs.size());w.println("decompile_completed "+completed);w.println("ReadOnly/noanalysis. P-code expression depth6 is bounded syntax, not whole-program alias or feasibility proof. Existing function bodies can merge disjoint entries; asm is authoritative.");}
 }
}
