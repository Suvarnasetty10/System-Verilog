 virtual class base;
  int a;
  int b;
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction
endclass

module tb;
  base ba;
  initial begin
    ba=new();
    ba.display();
    ba.a=10;
    ba.b=20;
    ba.display();
  end
endmodule
//output:
ERROR VCP2937 "Cannot instantiate abstract class: base." "testbench.sv" 12  13
    
  
