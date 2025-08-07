// Code your design code
module add(a,b,c,d);
  input a,b;
  output c;
  output d;
  assign c=a^b;
  assign d=a&b;
endmodule
// Code your testbench here
// or browse Examples
interface  inter;
  logic a;
  logic b;
  logic c;
  logic d;
endinterface
//testbench code
 module tb;
   inter aif();
   add u1 (.a(aif.a),.b(aif.b),.c(aif.c),.d(aif.d));
   initial begin
     aif.a=0;aif.b=0;#10;
     aif.a=0;aif.b=1;#10;
     aif.a=1;aif.b=0;#10;
     aif.a=1;aif.b=1;
   end
   initial begin
     $monitor ("a=%0b,b=%0b,c=%0b,d=%0b",aif.a,aif.b,aif.c,aif.d);
     #100;
     $finish;
   end
   endmodule
//output:
a=0,b=0,c=0,d=0
a=0,b=1,c=1,d=0
a=1,b=0,c=1,d=0
a=1,b=1,c=0,d=1

  


  
