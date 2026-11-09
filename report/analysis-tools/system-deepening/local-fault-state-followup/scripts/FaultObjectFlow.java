import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.pcode.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.address.*;
import java.util.*;
import java.io.*;
public class FaultObjectFlow extends GhidraScript {
 static final int DEPTH=24,CAP=64;
 Map<Long,HighFunction> funcs=new LinkedHashMap<>(); Map<Long,Map<Integer,Set<Long>>> bindings=new HashMap<>();
 long current; int loadAssumptions=0; long expressions=0;
 static class V {TreeSet<Long> n=new TreeSet<>();boolean partial=false; V(){} V(long x){n.add(x&0xffffffffL);} public String toString(){String s=n.toString();StringBuilder b=new StringBuilder();for(long x:n){if(b.length()>0)b.append(',');b.append(String.format("%08x",x));}return "{"+b+"}"+(partial?"?":"");}}
 V unknown(){V x=new V();x.partial=true;return x;}
 V union(V a,V b){a.partial|=b.partial;for(long z:b.n){if(a.n.size()<CAP)a.n.add(z);else a.partial=true;}return a;}
 boolean relevant(long a){return a==0x2000aa30L || a>=0x2000bf88L&&a<0x2000c538L;}
 V eval(Varnode v,int depth,Set<Varnode> seen){
  expressions++;if(v==null||depth<=0||seen.contains(v))return unknown();
  if(v.isConstant())return new V(v.getOffset());
  if(v.isInput()){
   int slot=-1;if(v.getHigh() instanceof HighParam)slot=((HighParam)v.getHigh()).getSlot();
   if(slot<0&&v.isRegister()){String n=currentProgram.getRegister(v.getAddress(),v.getSize()).getName();if(n.matches("r[0-3]"))slot=Integer.parseInt(n.substring(1));}
   Set<Long> b=bindings.getOrDefault(current,Collections.emptyMap()).get(slot);if(b!=null){V out=new V();out.n.addAll(b);return out;}return unknown();
  }
  PcodeOp d=v.getDef();if(d==null)return unknown();Set<Varnode> next=new HashSet<>(seen);next.add(v);int code=d.getOpcode();
  if(code==PcodeOp.COPY||code==PcodeOp.CAST||code==PcodeOp.INT_ZEXT)return eval(d.getInput(0),depth-1,next);
  if(code==PcodeOp.MULTIEQUAL){V o=new V();for(Varnode in:d.getInputs())union(o,eval(in,depth-1,next));return o;}
  if(code==PcodeOp.LOAD){V addr=eval(d.getInput(1),depth-1,next),out=new V();out.partial=addr.partial;
   for(long a:addr.n){
    if(a>=0x08010000L&&a+v.getSize()<=0x08033000L){try{long w=0;for(int k=0;k<v.getSize();k++)w|=((long)currentProgram.getMemory().getByte(toAddr(a+k))&255)<<(8*k);union(out,new V(w));}catch(Exception e){out.partial=true;}}
    else if(v.getSize()==4&&a>=0x2000c3ecL&&a<0x2000c400L&&((a-0x2000c3ecL)%4==0)){union(out,new V(0x2000bf88L+((a-0x2000c3ecL)/4)*0xe0));out.partial=true;loadAssumptions++;}
    else out.partial=true;
   }return out;
  }
  if(code==PcodeOp.PTRSUB||code==PcodeOp.PTRADD||code==PcodeOp.INT_ADD||code==PcodeOp.INT_SUB||code==PcodeOp.INT_MULT||code==PcodeOp.INT_AND||code==PcodeOp.INT_OR||code==PcodeOp.INT_LEFT||code==PcodeOp.INT_RIGHT||code==PcodeOp.SUBPIECE){
   V a=eval(d.getInput(0),depth-1,next),b=eval(d.getInput(1),depth-1,next),c=code==PcodeOp.PTRADD?eval(d.getInput(2),depth-1,next):new V(1);V out=new V();out.partial=a.partial||b.partial||c.partial;
   for(long x:a.n)for(long y:b.n)for(long z:c.n){if(out.n.size()>=CAP){out.partial=true;return out;}long n=0;
    switch(code){case PcodeOp.PTRADD:n=x+y*z;break;case PcodeOp.PTRSUB:case PcodeOp.INT_ADD:n=x+y;break;case PcodeOp.INT_SUB:n=x-y;break;case PcodeOp.INT_MULT:n=x*y;break;case PcodeOp.INT_AND:n=x&y;break;case PcodeOp.INT_OR:n=x|y;break;case PcodeOp.INT_LEFT:n=y>=32?0:x<<y;break;case PcodeOp.INT_RIGHT:n=y>=32?0:x>>>y;break;case PcodeOp.SUBPIECE:n=x>>>(y*8);break;}out.n.add(n&0xffffffffL);
   }return out;
  }return unknown();
 }
 V val(Varnode v){return eval(v,DEPTH,new HashSet<>());}
 String expr(Varnode v,int depth,Set<Varnode> seen){if(v==null)return "null";if(v.isConstant())return String.format("0x%x",v.getOffset());if(depth<=0||seen.contains(v))return "...";if(v.isInput())return "entry:"+v;PcodeOp d=v.getDef();if(d==null)return v.toString();Set<Varnode> s=new HashSet<>(seen);s.add(v);StringBuilder b=new StringBuilder(d.getMnemonic()+"(");for(int i=0;i<d.getNumInputs();i++){if(i>0)b.append(',');b.append(expr(d.getInput(i),depth-1,s));}return b.append(')').toString();}
 public void run()throws Exception{
  File out=new File(getScriptArgs()[0]);out.mkdirs();DecompInterface dc=new DecompInterface();DecompileOptions opts=new DecompileOptions();opts.setRespectReadOnly(true);dc.setOptions(opts);dc.openProgram(currentProgram);
  try(PrintWriter status=new PrintWriter(new File(out,"decompile-status.tsv"))){status.println("function\tstatus");FunctionIterator fi=currentProgram.getFunctionManager().getFunctions(true);while(fi.hasNext()){Function f=fi.next();long a=f.getEntryPoint().getOffset();if(a==0x08017634L){status.println(f.getEntryPoint()+"\tSKIP diagnostic internals");continue;}DecompileResults d=dc.decompileFunction(f,30,monitor);status.println(f.getEntryPoint()+"\t"+(d.decompileCompleted()?"OK":d.getErrorMessage()));if(d.decompileCompleted())funcs.put(a,d.getHighFunction());}}
  // Three bounded caller-to-callee propagation rounds; this is candidate generation, not full alias proof.
  try(PrintWriter bind=new PrintWriter(new File(out,"binding-edges.tsv"))){bind.println("round\tcaller\tcallsite\tcallee\targument\tvalues");
   for(int round=0;round<3;round++)for(Map.Entry<Long,HighFunction> e:funcs.entrySet()){current=e.getKey();Iterator<PcodeOpAST> it=e.getValue().getPcodeOps();while(it.hasNext()){PcodeOpAST op=it.next();if(op.getOpcode()!=PcodeOp.CALL)continue;V target=op.getOpcode()==PcodeOp.CALL?new V(op.getInput(0).getOffset()):val(op.getInput(0));for(long t:target.n){if(!funcs.containsKey(t)||t==0x08017634L||t==0x0801066cL||t==0x08027fb8L)continue;for(int i=1;i<op.getNumInputs()&&i<=4;i++){V v=val(op.getInput(i));TreeSet<Long> keep=new TreeSet<>();for(long a:v.n)if(relevant(a))keep.add(a);if(keep.isEmpty())continue;Set<Long> b=bindings.computeIfAbsent(t,k->new HashMap<>()).computeIfAbsent(i-1,k->new TreeSet<>());int old=b.size();for(long a:keep)if(b.size()<CAP)b.add(a);if(b.size()!=old)bind.println(round+"\t"+String.format("%08x",current)+"\t"+op.getSeqnum().getTarget()+"\t"+String.format("%08x",t)+"\t"+(i-1)+"\t"+v);}}}}}
  try(PrintWriter ops=new PrintWriter(new File(out,"object-operations.tsv"));PrintWriter copies=new PrintWriter(new File(out,"all-block-helper-calls.tsv"));PrintWriter b=new PrintWriter(new File(out,"function-bindings.tsv"))){
   ops.println("function\tsite\tkind\taddress_or_target\tvalues_or_arguments\texpression");copies.println("function\tsite\ttarget\tdestination\tsource_or_byte\tlength\targuments_expression");
   for(Map.Entry<Long,Map<Integer,Set<Long>>> e:bindings.entrySet())b.println(String.format("%08x",e.getKey())+"\t"+e.getValue());
   for(Map.Entry<Long,HighFunction> e:funcs.entrySet()){current=e.getKey();Iterator<PcodeOpAST> it=e.getValue().getPcodeOps();while(it.hasNext()){PcodeOpAST op=it.next();int c=op.getOpcode();
    if(c==PcodeOp.STORE||c==PcodeOp.LOAD){V addr=val(op.getInput(1));boolean hit=false;for(long a:addr.n)if(relevant(a))hit=true;if(hit)ops.println(String.format("%08x",current)+"\t"+op.getSeqnum().getTarget()+"\t"+op.getMnemonic()+"\t"+addr+"\t"+(c==PcodeOp.STORE?val(op.getInput(2)):"size="+op.getOutput().getSize())+"\t"+expr(op.getInput(1),12,new HashSet<>()));}
    if(c==PcodeOp.CALL||c==PcodeOp.CALLIND){V target=op.getOpcode()==PcodeOp.CALL?new V(op.getInput(0).getOffset()):val(op.getInput(0));boolean helper=target.n.contains(0x0801066cL)||target.n.contains(0x08027fb8L);StringBuilder vals=new StringBuilder(),ex=new StringBuilder();boolean hit=false;for(int i=1;i<op.getNumInputs();i++){V v=val(op.getInput(i));for(long a:v.n)if(relevant(a))hit=true;if(i>1){vals.append(';');ex.append(';');}vals.append(v);ex.append(expr(op.getInput(i),10,new HashSet<>()));}if(helper)copies.println(String.format("%08x",current)+"\t"+op.getSeqnum().getTarget()+"\t"+target+"\t"+vals.toString().replace(';','\t')+"\t"+ex);if(hit)ops.println(String.format("%08x",current)+"\t"+op.getSeqnum().getTarget()+"\t"+op.getMnemonic()+"\t"+target+"\t"+vals+"\t"+ex);}
   }}
  }
  try(PrintWriter w=new PrintWriter(new File(out,"scope.txt"))){w.println("sha256="+currentProgram.getExecutableSHA256());w.println("functions="+funcs.size()+"; depth="+DEPTH+"; set cap="+CAP+"; propagation rounds=3; expressions="+expressions);w.println("RAM load assumption: normally registered scheduler slots 2000c3ec+4*i point to 2000bf88+e0*i; retains partial=true. No arbitrary RAM constants or return-value summaries.");w.println("No path feasibility, global alias fixed point, callback target closure, loop fixed point or whole-program negative proof. Diagnostic function internals intentionally skipped.");}
  dc.dispose();
 }
}
