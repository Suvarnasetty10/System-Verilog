class sample;
  rand int a;
  constraint cd{a dist{[100:290]:/2,[350:1000]:/3,[1500:2500]:/5};}
endclass
  
module tb;
  sample s=new();
  initial begin
    repeat(10)begin
      assert(s.randomize());
      $display("a=%0d",s.a);
    end
  end
endmodule
//output:
# KERNEL: a=789
# KERNEL: a=513
# KERNEL: a=1675
# KERNEL: a=663
# KERNEL: a=265
# KERNEL: a=1840
# KERNEL: a=1793
# KERNEL: a=179
# KERNEL: a=200
# KERNEL: a=114
