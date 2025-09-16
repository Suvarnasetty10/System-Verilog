// or browse Examples
class vlsi;
  int a;
  int b;
endclass

module tb;
  initial begin
    vlsi v1, v2;
    v1 = new();
    v2 = new();
    
    // Initialize v2
    v2.a = 100;
    v2.b = 305;
    // Shallow copy: create new v1 object copying v2's scalar fields
    v1 = new v2;
   v2.a=1000;
   v2.b=4500;
    
    // Print contents explicitly
    $display("v1.a = %0d, v1.b = %0d", v1.a, v1.b);
    $display("v2.a = %0d, v2.b = %0d", v2.a, v2.b);
  end
endmodule
//output:
# KERNEL: v1.a = 100, v1.b = 305
# KERNEL: v2.a = 1000, v2.b = 4500
