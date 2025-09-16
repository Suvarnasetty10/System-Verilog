class first;
  int data=50;
endclass
class second;
  first f;
  function new();
    f=new();
  endfunction
endclass

module tb;
  initial begin
    second s;
    s=new();
    $display("data=%0d",s.f.data);
    s.f.data=80;
    $display("data=%0d",s.f.data);
  end
endmodule
//output:
# KERNEL: data=50
# KERNEL: data=80

    
