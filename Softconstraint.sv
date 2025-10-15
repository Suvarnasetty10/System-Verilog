// Code your testbench here
// or browse Examples
class sample;
  rand bit[7:0]a;
  constraint c1{soft {a==10};}
endclass

module tb;
  sample s=new();
  initial begin
    assert(s.randomize());
    $display("a=%0d",s.a);
    assert(s.randomize()with {a==101;});
    $display("a=%0d",s.a);
  end
endmodule
//output:
# KERNEL: a=10
# KERNEL: a=101
    
  
