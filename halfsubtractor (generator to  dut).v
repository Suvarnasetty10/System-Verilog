// Code  for halfsubtractor (generator to  dut)
module halfsubtractor(a,b,diff,borrow);
  input a,b;
  output diff,borrow;
  assign diff=a^b;
  assign borrow= (~a)&b;
endmodule

interface inter;
  logic a;
  logic b;
  logic diff;
  logic borrow;
  endinterface

class generator;
  mailbox mbx;
    bit a, b;
    bit diff,borrow;
  task run();
    for(int i=0;i<4;i++)begin
      {a,b}=i;
    mbx.put({a,b});
      $display("generator test cases a:%0b,b:%0b",a,b);
    end
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;
  task run();
    bit [1:0]temp;
    bit a,b;
    forever begin
    mbx.get(temp);
    vif.a=temp[1];
    vif.b=temp[0];
    
    #10;
      $display ("Driver applied:a=%0b,b=%0b,diff=%0b,borrow=%0b",vif.a,vif.b,vif.diff,vif.borrow);
    end
  endtask
endclass
module tb;
  inter aif();
  halfsubtractor dut(.a(aif.a),.b(aif.b),.diff(aif.diff),.borrow(aif.borrow));
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
    end
endmodule
//output:
# generator test cases a:0,b:0
# generator test cases a:0,b:1
# generator test cases a:1,b:0
# generator test cases a:1,b:1
# Driver applied:a=0,b=0,diff=0,borrow=0
# Driver applied:a=0,b=1,diff=1,borrow=1
# Driver applied:a=1,b=0,diff=1,borrow=0
# Driver applied:a=1,b=1,diff=0,borrow=0

