//code for mutilplexer(generator to driver)
module multiplexer (a,b,s,y);
  input a,b,s;
  output reg y;
  always@(*)begin
    case(s)
      1'b0:y=a;
      1'b1:y=b;
    endcase
  end
endmodule

interface inter;
  logic a;
  logic b;
  logic s;
  logic y;
endinterface
//Testbench for mutilplexer(generator to driver)
class generator;
  //mailbox.mbx;
  bit a=0;
  bit b=1;
  bit s=1;
  //bit s=0;
  bit y;
  mailbox mbx;
  task run();
    mbx.put({s,a,b});
    $display("generator test cases a:%0d,b:%0d,s=%0b",a,b,s);
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit [2:0]temp;
    mbx.get(temp);
    vif.s=temp[2];
    vif.a=temp[1];
    vif.b=temp[0];
    #10;
    $display ("Driver applied:a=%0d,b=%0d,s=%0d,y=%0b",vif.a,vif.b,vif.s,vif.y);
  endtask
endclass
//testbench 
module tb;
  inter aif();
  multiplexer dut(.a(aif.a),.b(aif.b),.s(aif.s),.y(aif.y));
  generator gen;
  driver div;
  mailbox mbx;
  initial begin
    gen=new();
    div=new();
    mbx=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    fork
      gen.run();
      div.run();
    join
    $finish;
    end
endmodule
//output:
KERNEL: generator test cases a:0,b:1,s=1
# KERNEL: Driver applied:a=0,b=1,s=1,y=1










