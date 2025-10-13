//inside constraints
class sample;
  rand bit [31:0] x;
  constraint ci { x inside { [25:35]} ;}
endclass

module tb;
  sample s;
  initial begin
    s=new();
    repeat(10) begin
      assert (s.randomize());
      $display("x=%0d",s.x);
    end
  end
endmodule
//output:
# KERNEL: x=35
# KERNEL: x=35
# KERNEL: x=25
# KERNEL: x=33
# KERNEL: x=35
# KERNEL: x=29
# KERNEL: x=25
# KERNEL: x=35
# KERNEL: x=31
# KERNEL: x=32
