module tb;
  wire a,b,c;
  alias a=b;
  alias c=b;
  assign a=1'b0;
  initial begin
    #1;
    $display("a=%0b,b=%0b,c=%0b",a,b,c);
  end
endmodule
//output:
# KERNEL: a=0,b=0,c=0
