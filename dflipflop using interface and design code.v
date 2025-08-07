// Code your design here
module DFF (
  input  logic d,       
  input  logic clk,     
  input  logic rst_n,  
  output logic Q        
);

  always_ff @(posedge clk or posedge rst_n) begin
    if (rst_n)
      Q <= 1'b0;       
    else
      Q <= d;           
  end
endmodule
// Code your testbench here
// or browse Examples
interface  inter;
  logic d;
  logic clk;
  logic rst_n;
  logic Q;
endinterface
//testbench code
 module tb;
   inter aif();
   
   initial begin
     aif.clk=0;
     forever #5 aif.clk= ~aif.clk;
   end
   
   DFF u1 (.d(aif.d),.clk(aif.clk),.rst_n(aif.rst_n),.Q(aif.Q));
   initial begin
     aif.rst_n=1;aif.d=1;#10;
     aif.rst_n=0;aif.d=1;#10;
     aif.rst_n=0;aif.d=0;#10;
   end
   initial begin
     $monitor (" clk=%0b,rst_n=%0b;d=%0b;q=%0b",aif.clk,aif.rst_n,aif.d,aif.Q);
     #30;
     $finish;
   end
endmodule
//output:
 clk=0,rst_n=1;d=1;q=0
 clk=1,rst_n=1;d=1;q=0
 clk=0,rst_n=0;d=1;q=0
 clk=1,rst_n=0;d=1;q=1
 clk=0,rst_n=0;d=0;q=1
 clk=1,rst_n=0;d=0;q=0

  


