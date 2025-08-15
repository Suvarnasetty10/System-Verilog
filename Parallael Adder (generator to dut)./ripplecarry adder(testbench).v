// Code your testbench here
// or browse Example
interface inter;
  logic[3:0]a;
  logic[3:0]b;
  logic cin;
  logic[3:0]s;
  logic[3:0]c;
endinterface

class generator;
  mailbox mbx;
  bit [3:0]a;
  bit [3:0]b;
  bit cin;
  task run();
    for( int i=0;i<6;i++)begin
      a=$random;
      b=$random;
      cin=$random;
      mbx.put({cin,a,b});
      $display(" generator _ a=%4b,b=%4b,cin=%0b",a,b,cin);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  bit [3:0]a;
  bit [3:0]b;
  bit cin;
  bit [8:0]temp; 
  task run();
    for( int i=0;i<6;i++)begin
       mbx.get(temp);
       vif.cin=temp[8];
       vif.a=temp[7:4];
       vif.b=temp[3:0];
      //mbx.get(temp);
      #2; $display(" driver_a=%4b,b=%4b,cin=%0b,s=%4b,c=%4b",vif.a,vif.b,vif.cin,vif.s,vif.c);
    end
  endtask
endclass

module tb;
  inter aif();
  paralleladder dut(.a(aif.a),.b(aif.b),.cin(aif.cin),.s(aif.s),.c(aif.c));
  mailbox mbx;
  generator gen;
  driver div;
  initial begin
    mbx=new();
    gen=new();
    div=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    fork 
      gen.run();
      div.run();
    join
  end
endmodule
