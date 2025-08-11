//23A91A0431
//K.Suvarna
// Code your design here
module halfadder(a,b,sum,carry);
  input a,b;
  output sum,carry;
  assign sum=a^b;
  assign carry = a&b;
endmodule

interface inter;
  logic a;
  logic b;
  logic sum;
  logic carry;
  endinterface
// Code your testbench code
// or browse Examples
///23A91A0431
//K.Suvarna
class generator;
  mailbox mbx;
    bit a, b;
    bit  sum,carry;
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
      $display ("Driver applied:a=%0b,b=%0b,sum=%0b,carry=%0b",vif.a,vif.b,vif.sum,vif.carry);
    end
  endtask
endclass
module tb;
  inter aif();
  halfadder dut(.a(aif.a),.b(aif.b),.sum(aif.sum),.carry(aif.carry));
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
 generator test cases a:0,b:0
# generator test cases a:0,b:1
# generator test cases a:1,b:0
# generator test cases a:1,b:1
# Driver applied:a=0,b=0,sum=0,carry=0
# Driver applied:a=0,b=1,sum=1,carry=0
# Driver applied:a=1,b=0,sum=1,carry=0
# Driver applied:a=1,b=1,sum=0,carry=1
