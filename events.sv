module tb;
  event e1,e2,e3,e4;
  initial begin
    @(e2)
    $display("process:3 completed");
    ->e3;
  end
  initial begin
    @(e3)
    $display("process:4 completed");
    ->e4;
  end
  initial begin
    @(e1)
    $display("process:2 completed");
    ->e2;
  end
  initial begin
    $display("process:6 completed");
    ->e1;
  end
endmodule
//output:
# KERNEL: process:6 completed
# KERNEL: process:2 completed
# KERNEL: process:3 completed
# KERNEL: process:4 completed
    
             
          
             
    
  
 
