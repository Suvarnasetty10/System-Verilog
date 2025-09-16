class packet;
  int count;
endclass

class vlsi;
  int a;
  int b;
  packet pck=new();
endclass

module tb;
  initial begin
    vlsi v1, v2;
    v1 = new();
    v2 = new();
    v2.pck.count=100;
    // Initialize v2
    v2.a = 100;
    v2.b = 305;
    // Shallow copy: create new v1 object copying v2's scalar fields
    v1 = new v2;
   v2.a=1000;
   v2.b=4500;
    
    // Print contents explicitly
    $display("v1=%0p", v1);
    $display("v2=%0p", v2);
    //$display("v2.a = %0d, v2.b = %0d", v2.a, v2.b);
  end
endmodule
//output:
# KERNEL: v1=100 305 <class handle>
# KERNEL: v2=1000 4500 <class handle>
