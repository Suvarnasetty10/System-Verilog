class sample;
  rand int a;
  constraint cd { a dist { 200:=2,400:=3,600:=5};}
  //constraint cd{a dist{[100:290]:/2,[350:1000]:/3,[1500:2500]:/5};}
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
# KERNEL: a=400
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=600
# KERNEL: a=200
# KERNEL: a=200
