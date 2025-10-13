class sample;
  //rand bit[7:0] a;
  rand bit[7:0]arrays[];
  constraint cu { unique {arrays}; arrays.size==10;}
endclass

module tb;
  sample s=new();
  int i;
  initial begin
    //repeat(10)begin
     assert(s.randomize());
    foreach(s.arrays[i])
    
    $display("a[%0d]=%0d",i,s.arrays[i]);
    
  end
endmodule
output:
# KERNEL: a[0]=100
# KERNEL: a[1]=232
# KERNEL: a[2]=49
# KERNEL: a[3]=78
# KERNEL: a[4]=191
# KERNEL: a[5]=184
# KERNEL: a[6]=87
# KERNEL: a[7]=16
# KERNEL: a[8]=235
# KERNEL: a[9]=57
