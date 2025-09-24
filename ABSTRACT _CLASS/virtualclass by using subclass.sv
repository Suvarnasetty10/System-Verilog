 virtual class base;
  int a;
  int b;
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction
endclass

class sub extends base;
endclass

module tb;
  sub ba;
  initial begin
    ba=new();
    ba.display();
    ba.a=10;
    ba.b=20;
    ba.display();
  end
endmodule
//output:
# KERNEL: a=0,b=0
# KERNEL: a=10,b=20
