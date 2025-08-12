// Code  for fulladder(generator to  dut)
module fulladder(a,b,c,sum,carry);
  input a,b,c;
  output sum,carry;
  assign sum=a^b^c;
  assign carry=a&b|b&c|c&a;
endmodule

interface inter;
  logic a;
  logic b;
  logic c;
  logic sum;
  logic carry;
endinterface 
  
 // Code your testbench  (generator to dut)
// or browse Examples
class generator;
  mailbox mbx;
  bit a,b,c;
  bit sum ,carry;
  task run();
    for(int i=0;i<8;i++)begin
      {a,b,c}=i;
      mbx.put({a,b,c});
      $display("a=%0b,b=%0b,c=%0b",a,b,c);
    end
  endtask
endclass
    
 class driver;
   mailbox mbx;
   virtual inter vif;
   task run();
     bit[2:0] temp;
     bit a,b,c;
     bit sum ,carry; 
     forever begin
       mbx.get(temp);
       vif.a=temp[2];
       vif.b=temp[1];
       vif.c=temp[0];
       #10;
       $display(" DRiver applied a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b",vif.a,vif.b,vif.c,vif.sum,vif.carry);
     end
   endtask
 endclass

module tb;
  inter aif();
  fulladder dut(.a(aif.a),.b(aif.b),.c(aif.c),.sum(aif.sum),.carry(aif.carry));
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
# a=0,b=0,c=0
# a=0,b=0,c=1
# a=0,b=1,c=0
# a=0,b=1,c=1
# a=1,b=0,c=0
# a=1,b=0,c=1
# a=1,b=1,c=0
# a=1,b=1,c=1
#  DRiver applied a=0,b=0,c=0,sum=0,carry=0
#  DRiver applied a=0,b=0,c=1,sum=1,carry=0
#  DRiver applied a=0,b=1,c=0,sum=1,carry=0
#  DRiver applied a=0,b=1,c=1,sum=0,carry=1
#  DRiver applied a=1,b=0,c=0,sum=1,carry=0
#  DRiver applied a=1,b=0,c=1,sum=0,carry=1
#  DRiver applied a=1,b=1,c=0,sum=0,carry=1
#  DRiver applied a=1,b=1,c=1,sum=1,carry=1
