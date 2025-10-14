//constraints modes:
class sample;
  rand bit[7:0]a,b;
  constraint c1{a inside{[40:60]};}
  constraint c2{b inside{10,20,30};}             
endclass
module tb;
  sample s=new();
  initial begin
    assert(s.randomize());
    $display("a=%0d,b=%0d",s.a,s.b);
    s.c1.constraint_mode(0);
    assert(s.randomize());
    $display("a=%0d,b=%0d",s.a,s.b);
    s.c1.constraint_mode(1);
    assert(s.randomize());
    $display("a=%0d,b=%0d",s.a,s.b);
    s.c2.constraint_mode(0);
    assert(s.randomize());
    $display("a=%0d,b=%0d",s.a,s.b);
    s.c2.constraint_mode(1);
    assert(s.randomize());
    $display("a=%0d,b=%0d",s.a,s.b);
  end
endmodule
//output:
# KERNEL: a=47,b=20
# KERNEL: a=160,b=10
# KERNEL: a=48,b=20
# KERNEL: a=41,b=74
# KERNEL: a=56,b=10
