`define starting_range 60
`define ending_range 80
class sample #(parameter int p1=90,int p2=110);
rand bit[7:0]a;
rand bit[7:0]b;
rand bit[7:0]c;
rand bit[7:0]d;
rand bit[7:0]e;
constraint c1{ a inside {[10:20]};}
constraint c2{ b inside {20,30};}
constraint c3{ c inside {[10:20],30,40};}
constraint c4{ d inside {[`starting_range : `ending_range]};}
constraint c5{ e inside {[p1:p2]};}
endclass

module tb;
  sample s=new();
  initial begin
   
    repeat(5)begin
      assert(s.randomize());
      $display("a=%0d,b=%0d,c=%0d,d=%0d,e=%0d",s.a,s.b,s.c,s.d,s.e);
    end
  end
endmodule
//output:
# KERNEL: a=15,b=20,c=17,d=77,e=90
# KERNEL: a=14,b=20,c=11,d=62,e=101
# KERNEL: a=16,b=20,c=14,d=66,e=94
# KERNEL: a=17,b=30,c=11,d=70,e=107
# KERNEL: a=13,b=20,c=30,d=69,e=91
               

