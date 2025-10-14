//Modes of constraints:
class sample;
  rand bit[7:0]a,b,c;
  constraint c1{ a-b-c == 20;}
endclass

module tb;
  sample s=new();
  initial begin
    s.a=100;
    s.a.rand_mode(0);//a=100 disabled
    assert(s.randomize());
    $display("a=%0d,b=%0d,c=%0d",s.a,s.b,s.c);
    s.a.rand_mode(1);//a is enabled
    assert(s.randomize());
    $display("a=%0d,b=%0d,c=%0d",s.a,s.b,s.c);
    s.rand_mode(0);//disabled all a,b,c
    assert(s.randomize());
    $display("a=%0d,b=%0d,c=%0d",s.a,s.b,s.c);
    s.rand_mode(1);//enabled all a,b,c
    assert(s.randomize());
    $display("a=%0d,b=%0d,c=%0d",s.a,s.b,s.c);
  end
endmodule
//output:
# KERNEL: a=100,b=7,c=73
# KERNEL: a=160,b=113,c=27
# KERNEL: a=160,b=113,c=27
# KERNEL: a=226,b=191,c=15
