class totalpeople;
  int a;
endclass
class female extends totalpeople;
  int b;
endclass
class male extends totalpeople;
  int y;
endclass
module tb;  
  bit c;
  bit t;
  bit e;
  bit k;
  bit o;
  totalpeople tp=new();
  female f=new();
  male m=new();
  initial begin
    o=$cast(f,tp);
    $display("cast success: %0b", o);
  end
  initial begin
    c=$cast(tp,f);
    $display("cast success: %0b", c);
  end
  initial begin
    t=$cast(m,tp);
    $display("cast success: %0b", t);
  end
  initial begin
    e=$cast(f,m);
    $display("cast success: %0b", e);
  end
  initial begin
    k=$cast(tp,f);
    $display("cast success: %0b", k);
  end
 /* initial begin
    o=$cast(tp,f);
    $display("cast success: %0b", o);
  end*/
endmodule
//output:
# KERNEL: cast success: 0
# KERNEL: cast success: 1
# KERNEL: cast success: 0
# KERNEL: cast success: 0
# KERNEL: cast success: 1
