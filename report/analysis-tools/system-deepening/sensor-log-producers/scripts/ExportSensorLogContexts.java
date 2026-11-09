import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.mem.*;
import java.io.*;

// Read-only export: never change disassembly, functions, context or RAM flags.
public class ExportSensorLogContexts extends GhidraScript {
 private void dump(PrintWriter w,AddressSetView body) throws Exception {
  InstructionIterator it=currentProgram.getListing().getInstructions(body,true);
  while(it.hasNext()){
   Instruction i=it.next();StringBuilder hex=new StringBuilder();
   for(byte b:i.getBytes())hex.append(String.format("%02x",b&255));
   w.print("INSN "+i.getAddress()+" "+hex+" "+i);
   for(Reference r:i.getReferencesFrom()){
    w.print(" REF["+r.getReferenceType()+":"+r.getToAddress());
    if(r.getReferenceType().isData())try{w.print("="+Integer.toHexString(getInt(r.getToAddress())));}catch(Exception e){}
    w.print("]");
   }
   w.println();
  }
 }
 public void run() throws Exception {
  if(!"1a125674542934f36266f88d9f8ca378a6a5ca696d9e58305d1b0e533f795563".equals(currentProgram.getExecutableSHA256()))throw new IllegalStateException("Unexpected input hash");
  String[] args=getScriptArgs();File out=new File(args[0]);out.mkdirs();
  try(PrintWriter meta=new PrintWriter(new File(out,"program.txt"))){
   meta.println("NAME "+currentProgram.getName());
   meta.println("EXECUTABLE_SHA256 "+currentProgram.getExecutableSHA256());
   meta.println("LANGUAGE "+currentProgram.getLanguageID());
   for(MemoryBlock b:currentProgram.getMemory().getBlocks())
    meta.println("BLOCK "+b.getName()+" "+b.getStart()+" "+b.getEnd()+" initialized="+b.isInitialized()+" write="+b.isWrite());
  }
  DecompInterface dc=new DecompInterface();
  DecompileOptions options=new DecompileOptions();options.setRespectReadOnly(true);dc.setOptions(options);dc.openProgram(currentProgram);
  for(int n=1;n<args.length;n++){
   if(args[n].startsWith("refs@")){
    Address a=toAddr(Long.parseLong(args[n].substring(5),16));
    try(PrintWriter w=new PrintWriter(new File(out,"refs_"+a+".txt"))){
     w.println("REFERENCES_ONLY "+a);
     for(Reference r:getReferencesTo(a)){Function owner=getFunctionContaining(r.getFromAddress());w.println("REF_TO "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(owner==null?"none":owner.getEntryPoint()));}
    }
    continue;
   }
   if(args[n].contains(":")){
    String[] range=args[n].split(":");
    Address start=toAddr(Long.parseLong(range[0],16)),end=toAddr(Long.parseLong(range[1],16));
    try(PrintWriter w=new PrintWriter(new File(out,args[n].replace(':','_')+".txt"))){
     w.println("RANGE "+start+" "+end+" existing decoded instructions only; no disassembly mutation");
     dump(w,new AddressSet(start,end));
    }
    continue;
   }
   Address a=toAddr(Long.parseLong(args[n],16));Function f=getFunctionAt(a);
   if(f==null)f=getFunctionContaining(a);
   try(PrintWriter w=new PrintWriter(new File(out,args[n]+".txt"))){
    w.println("TARGET "+a+" function="+(f==null?"none":f.getEntryPoint()));
    for(Reference r:getReferencesTo(a)){ Function owner=getFunctionContaining(r.getFromAddress()); w.println("REF_TO "+r.getFromAddress()+" "+r.getReferenceType()+" owner="+(owner==null?"none":owner.getEntryPoint())); }
    if(f==null)continue;
    w.println("FUNCTION_BODY "+f.getBody());
    DecompileResults d=dc.decompileFunction(f,60,monitor);
    if(d.decompileCompleted())w.println(d.getDecompiledFunction().getC());else w.println("DECOMPILE_ERROR "+d.getErrorMessage());
    dump(w,f.getBody());
   }
  }
  try(PrintWriter mask=new PrintWriter(new File(out,"mask-instructions.txt"))){
   for(Instruction i:currentProgram.getListing().getInstructions(true)){
    String t=i.toString().toLowerCase();
    if(t.contains("cpsid")||t.contains("cpsie")||t.contains("primask")||t.contains("basepri")||t.contains("faultmask")||i.getMnemonicString().equalsIgnoreCase("mrs")||i.getMnemonicString().equalsIgnoreCase("msr")){
     Function owner=getFunctionContaining(i.getAddress());mask.println("OWNER "+(owner==null?"none":owner.getEntryPoint()));dump(mask,new AddressSet(i.getAddress(),i.getAddress()));
    }
   }
  }
  dc.dispose();
 }
}
