import ghidra.app.script.GhidraScript;
import ghidra.app.emulator.EmulatorHelper;
import java.io.*;
public class VerifyRawFlags extends GhidraScript {
 public void run() throws Exception {
  PrintWriter w=new PrintWriter(new File(getScriptArgs()[0]));
  int[] levels={0,1,2,3,4,5,6,7,8,9,10,255,256,300};
  int[] probes={0,1,6,32,16,32,128,256,512,768,1500};
  int count=0;
  w.println("{\"kind\":\"Ghidra p-code emulation of original AArch64 instructions\",\"binary_sha256\":\""+currentProgram.getExecutableSHA256()+"\",\"start\":\"0x004340a4\",\"stop\":\"0x004340c0\",\"cases\":[");
  for(int header=0;header<=1;header++)for(int level:levels){
   EmulatorHelper e=new EmulatorHelper(currentProgram);
   try{
    long buf=0x20000000L;
    e.writeRegister(e.getPCRegister(),0x4340a4L);
    e.writeRegister("x19",buf);e.writeRegister("x21",header);e.writeRegister("x22",level);
    int steps=0;
    while(e.getExecutionAddress().getOffset()!=0x4340c0L){
     if(++steps>100||!e.step(monitor))throw new RuntimeException("emulation failed "+e.getLastError());
    }
    byte[] b=e.readMemory(toAddr(buf+0x10080),4);
    long flags=0;for(int i=0;i<4;i++)flags|=((long)b[i]&255)<<(8*i);
    int normalized=level>255?1:level;
    int expected=probes[Math.min(normalized,10)]|(normalized<4?0x4000:0)|(normalized==0?0x80000:0)|(header!=0?0x1000:0);
    if(flags!=expected)throw new RuntimeException("flags mismatch "+level+" "+header+" "+flags+" "+expected);
    if(count++>0)w.println(",");
    w.print("{\"level\":"+level+",\"header_enabled\":"+(header!=0)+",\"flags\":"+flags+",\"expected\":"+expected+",\"steps\":"+steps+",\"result\":\"PASS\"}");
   }finally{e.dispose();}
  }
  w.println("],\"total\":"+count+",\"result\":\"PASS\",\"scope\":\"Isolated constructor tail and flag setter, synthetic registers; not a complete compressor or device execution.\"}");w.close();
 }
}
