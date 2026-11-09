import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.*;
import ghidra.program.model.symbol.*;
import ghidra.program.model.scalar.Scalar;
import java.io.*;

// Candidate inventory only: matching an offset is not an object-alias proof.
public class AuditVersionOffsets extends GhidraScript {
 public void run() throws Exception {
  try(PrintWriter w=new PrintWriter(new File(getScriptArgs()[0]))) {
   w.println("Read-only inventory of existing decoded instructions; no recursive alias completeness claim.");
   long count=0,hits=0;
   InstructionIterator it=currentProgram.getListing().getInstructions(true);
   while(it.hasNext()) {
    Instruction i=it.next(); count++; boolean hit=false;
    for(int n=0;n<i.getNumOperands();n++) for(Object obj:i.getOpObjects(n))
     if(obj instanceof Scalar) {
      long value=((Scalar)obj).getUnsignedValue();
      if(value==0x4a4 || value==0x1a64 || value==0x1adc) hit=true;
     }
    for(Reference r:i.getReferencesFrom())
     if(r.getToAddress().getOffset()==0x5e5b14) hit=true;
    if(hit) {
     hits++; Function f=getFunctionContaining(i.getAddress());
     w.println("CANDIDATE "+i.getAddress()+" owner="+(f==null?"none":f.getEntryPoint())+" "+i);
    }
   }
   w.println("SCANNED "+count+" MATCHES "+hits);
  }
 }
}
