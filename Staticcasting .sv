module top;
  int x;//signed data type (32 bit wide)
  byte unsigned y;//unsigned data type(8 bit)
  //bit z; 
  initial begin
    x=-15;
    y=x;//implicit convertion//simplecodes
    $display("y=%0d",y);
    y=byte'(x);//expliacit convertion//complex codes
    $display("y=%0d",y);
   // z=bit'(x);
    //$display("z=%0d",z);  
  end
endmodule
//output:
KERNEL: y=241
# KERNEL: y=241
# KERNEL: z=1
    
