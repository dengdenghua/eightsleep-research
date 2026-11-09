import ghidra.app.script.GhidraScript;
import ghidra.program.model.address.*;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.pcode.JumpTable;
import java.util.*;
public class FixLegacySensorSwitch extends GhidraScript {
 public void run() throws Exception {
  Address start=toAddr("002097a0"),end=toAddr("0020b3ff"),branch=toAddr("002098a8"),table=toAddr("0046d5c8"),base=toAddr("002098ac");
  Function f=getFunctionAt(start);FunctionIterator it=currentProgram.getFunctionManager().getFunctions(start,true);
  while(it.hasNext()){Function g=it.next();if(g.getEntryPoint().compareTo(end)>0)break;if(g!=f)throw new IllegalStateException("Overlapping function "+g.getEntryPoint());}
  ArrayList<Address> dest=new ArrayList<>();
  for(int i=0;i<39;i++){int delta=getShort(table.add(i*2));Address a=base.add(delta*4);if(a.compareTo(start)<0||a.compareTo(end)>0)throw new IllegalStateException("Out-of-range target "+a);dest.add(a);println("STATE "+i+" signed16 "+delta+" -> "+a);disassemble(a);currentProgram.getReferenceManager().addMemoryReference(branch,a,RefType.COMPUTED_JUMP,SourceType.USER_DEFINED,-1);}
  f.setBody(new AddressSet(start,end));
  new JumpTable(branch,dest,true,0).writeOverride(f);
  println("Installed bounded 39-slot table: CMP W0,#0x26; unsigned bound before LDRH indexed by state*2, sign-extension with *4. Odd states use separate cleanup table. Read-only project session; changes will not persist.");
 }
}
