//23A91A0431
//designcode for fullsubtractor
module fullsubtractor(a,b,bin,diff,borrow);
  input a,b,bin;
  output diff,borrow;
  assign diff=a^b^bin;
  assign borrow = (~a)&b|b&bin|bin&(~a);
endmodule

interface inter;
  logic a;
  logic b;
  logic bin;
  logic diff;
  logic borrow;
endinterface 

//K.Suvarna
//Testcode for fullsubtractor
class generator;
  mailbox mbx;
  bit a,b,bin;
  bit diff ,borrow;
  task run();
    for(int i=0;i<8;i++)begin
      {a,b,bin}=i;
      mbx.put({a,b,bin});
      $display("a=%0b,b=%0b,bin=%0b",a,b,bin);
    end
  endtask
endclass
    
 class driver;
   mailbox mbx;
   virtual inter vif;
   task run();
     bit[2:0] temp;
     bit a,b,bin;
     bit diff ,borrow; 
     forever begin
       mbx.get(temp);
       vif.a=temp[2];
       vif.b=temp[1];
       vif.bin=temp[0];
       #10;
       $display(" DRiver applied a=%0b,b=%0b,bin=%0b,diff=%0b,borrow=%0b",vif.a,vif.b,vif.bin,vif.diff,vif.borrow);
     end
   endtask
 endclass

module tb;
  inter aif();
  fullsubtractor dut(.a(aif.a),.b(aif.b),.bin(aif.bin),.diff(aif.diff),.borrow(aif.borrow));
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

# a=0,b=0,bin=0
# a=0,b=0,bin=1
# a=0,b=1,bin=0
# a=0,b=1,bin=1
# a=1,b=0,bin=0
# a=1,b=0,bin=1
# a=1,b=1,bin=0
# a=1,b=1,bin=1
#  DRiver applied a=0,b=0,bin=0,diff=0,borrow=0
#  DRiver applied a=0,b=0,bin=1,diff=1,borrow=1
#  DRiver applied a=0,b=1,bin=0,diff=1,borrow=1
#  DRiver applied a=0,b=1,bin=1,diff=0,borrow=1
#  DRiver applied a=1,b=0,bin=0,diff=1,borrow=0
#  DRiver applied a=1,b=0,bin=1,diff=0,borrow=0
#  DRiver applied a=1,b=1,bin=0,diff=0,borrow=0
#  DRiver applied a=1,b=1,bin=1,diff=1,borrow=1
  
