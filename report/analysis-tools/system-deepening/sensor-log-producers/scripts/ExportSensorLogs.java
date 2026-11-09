import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.pcode.*;
import ghidra.program.model.mem.*;
import java.io.*;
import java.util.*;
import com.google.gson.Gson;

// Read-only: all functions, instructions and HighFunction values are existing analysis views.
public class ExportSensorLogs extends GhidraScript {
 private final Gson gson=new Gson();
 private final long logger=0x0801c8f8L;
 private void dump(PrintWriter w,AddressSetView body) throws Exception {
  for(Instruction i:currentProgram.getListing().getInstructions(body,true)){
   StringBuilder hex=new StringBuilder();for(byte b:i.getBytes())hex.append(String.format("%02x",b&255));
   w.print("INSN "+i.getAddress()+" "+hex+" "+i);
   for(Reference r:i.getReferencesFrom()){
    w.print(" REF["+r.getReferenceType()+":"+r.getToAddress());
    if(r.getReferenceType().isData())try{w.print("="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception e){}
    w.print("]");
   }
   w.println();
  }
 }
 private Set<Long> constants(Varnode v,int depth,Set<Varnode> seen){
  Set<Long> out=new TreeSet<>();if(v==null||depth>24||seen.contains(v))return out;
  if(v.isConstant()){out.add(v.getOffset());return out;}
  seen=new HashSet<>(seen);seen.add(v);PcodeOp d=v.getDef();if(d==null)return out;
  int op=d.getOpcode();
  if(op==PcodeOp.COPY||op==PcodeOp.CAST||op==PcodeOp.INT_ZEXT||op==PcodeOp.INT_SEXT)return constants(d.getInput(0),depth+1,seen);
  if(op==PcodeOp.MULTIEQUAL){for(int j=0;j<d.getNumInputs();j++){Set<Long>s=constants(d.getInput(j),depth+1,seen);if(s.isEmpty())return new TreeSet<Long>();out.addAll(s);}return out;}
  if(op==PcodeOp.INT_ADD||op==PcodeOp.PTRSUB||op==PcodeOp.PTRADD){
   Set<Long>a=constants(d.getInput(0),depth+1,seen),b=constants(d.getInput(1),depth+1,seen);
   Set<Long>scale=new TreeSet<>();if(op==PcodeOp.PTRADD)scale=constants(d.getInput(2),depth+1,seen);else scale.add(1L);
   if(a.size()*b.size()*scale.size()>32)return out;
   for(long x:a)for(long y:b)for(long z:scale)out.add((x+y*z)&0xffffffffL);return out;
  }
  return out;
 }
 private String stringAt(long a){try{StringBuilder s=new StringBuilder();for(int j=0;j<512;j++){int b=getByte(toAddr(a+j))&255;if(b==0)return s.toString();if(b<9||b>126)return null;s.append((char)b);}return null;}catch(Exception e){return null;}}
 private String expr(Varnode v,int depth){if(v==null)return "null";if(v.isConstant())return String.format("const:0x%x",v.getOffset());PcodeOp p=v.getDef();if(p==null)return v.toString();if(depth>5)return p.getMnemonic()+"(...)";StringBuilder b=new StringBuilder(p.getMnemonic()+"(");for(int i=0;i<p.getNumInputs();i++){if(i>0)b.append(",");b.append(expr(p.getInput(i),depth+1));}return b.append(")").toString();}
 public void run() throws Exception {
  if(!"1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563".equals(currentProgram.getExecutableSHA256()))throw new IllegalStateException("input identity mismatch");
  File out=new File(getScriptArgs()[0]);out.mkdirs();File funcs=new File(out,"functions");funcs.mkdirs();
  Map<String,Function> owners=new TreeMap<>();List<Map<String,Object>> refs=new ArrayList<>();
  try(PrintWriter w=new PrintWriter(new File(out,"callsites.asm.txt"))){
   for(Reference r:getReferencesTo(toAddr(logger))){
    Address a=r.getFromAddress();Function f=getFunctionContaining(a);Map<String,Object> rec=new LinkedHashMap<>();
    rec.put("callsite",a.toString());rec.put("ref_type",r.getReferenceType().toString());rec.put("owner",f==null?null:f.getEntryPoint().toString());refs.add(rec);
    if(f!=null)owners.put(f.getEntryPoint().toString(),f);
    w.println("CALLSITE "+a+" OWNER "+(f==null?"none":f.getEntryPoint()));
    Instruction i=getInstructionAt(a);Address start=a;for(int j=0;j<35;j++){Instruction prev=getInstructionBefore(start);if(prev==null||a.subtract(prev.getAddress())>160)break;start=prev.getAddress();}
    dump(w,new AddressSet(start,a));
   }
  }
  try(PrintWriter w=new PrintWriter(new File(out,"references.json"))){w.println(gson.toJson(refs));}
  DecompInterface dc=new DecompInterface();DecompileOptions opt=new DecompileOptions();opt.setRespectReadOnly(true);dc.setOptions(opt);dc.openProgram(currentProgram);
  try(PrintWriter calls=new PrintWriter(new File(out,"calls.jsonl"));PrintWriter meta=new PrintWriter(new File(out,"decompile.jsonl"))){
   for(Function f:owners.values()){
    DecompileResults d=dc.decompileFunction(f,60,monitor);Map<String,Object> m=new LinkedHashMap<>();m.put("owner",f.getEntryPoint().toString());m.put("completed",d.decompileCompleted());m.put("error",d.getErrorMessage());meta.println(gson.toJson(m));meta.flush();
    try(PrintWriter w=new PrintWriter(new File(funcs,f.getEntryPoint()+".txt"))){w.println("FUNCTION "+f.getEntryPoint()+" BODY "+f.getBody());if(d.decompileCompleted())w.println(d.getDecompiledFunction().getC());dump(w,f.getBody());}
    if(!d.decompileCompleted())continue;
    Iterator<PcodeOpAST> it=d.getHighFunction().getPcodeOps();
    while(it.hasNext()){
     PcodeOpAST p=it.next();if(p.getOpcode()!=PcodeOp.CALL||p.getInput(0).getOffset()!=logger)continue;
     Map<String,Object> row=new LinkedHashMap<>();row.put("callsite",p.getSeqnum().getTarget().toString());row.put("owner",f.getEntryPoint().toString());row.put("input_count",p.getNumInputs());
     List<Object> arguments=new ArrayList<>();for(int j=1;j<p.getNumInputs();j++){
      Varnode v=p.getInput(j);Map<String,Object> arg=new LinkedHashMap<>();arg.put("index",j-1);arg.put("expr",expr(v,0));Set<Long> constants=constants(v,0,new HashSet<Varnode>());arg.put("constant_values",constants);List<Object> strings=new ArrayList<>();for(long a:constants){String s=stringAt(a);if(s!=null){Map<String,Object> t=new LinkedHashMap<>();t.put("va",String.format("%08x",a));t.put("value",s);strings.add(t);}}arg.put("strings",strings);arguments.add(arg);
     }
     row.put("arguments",arguments);calls.println(gson.toJson(row));calls.flush();
    }
   }
  }
  dc.dispose();println("logger refs="+refs.size()+" owners="+owners.size());
 }
}
