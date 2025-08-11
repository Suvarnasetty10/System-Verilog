//23A91A0431
//K.Suvarna
// Code  for Generation to dut (without driver).
module add(a,b,c);
  input [2:0]a,b;
  output[6:0]c;
  assign c=a+b;
endmodule
interface inter;
  logic [2:0]a;
  logic [2:0]b;
  logic[6:0]c;
endinterface
//Testbench:
///23A91A0431
//K.Suvarna
class generator;
  virtual inter vif;
  //mailbox mbx;
  task run();
    vif.a=3'd5;
    vif.b=3'd3;
    #1;
    $display("a=%0d,b=%0d,c=%0d",vif.a,vif.b,vif.c);
  endtask
endclass

module tb;
  inter aif();
  add dut(.a(aif.a), .b(aif.b), .c(aif.c));
  //add dut(aif);
  //mailbox mbx = new();
  initial begin
    generator gen = new();
    gen.vif=aif;
    //gen.mbx = mbx;         // connect mailbox
    gen.run();             // call run
  end
endmodule
