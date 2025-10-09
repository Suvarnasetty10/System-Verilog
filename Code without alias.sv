// Code your testbench here
// or browse Examples
module tb;
  int a,b,c;
  initial begin
    a=b;
    c=b;
    assign a=1'b1;
    #1;
    $display("a=%0b,b=%0b,c=%0b",a,b,c);
  end
endmodule
//output:
# KERNEL: a=1,b=0,c=0
