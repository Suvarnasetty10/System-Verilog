// Code your testbench here
// or browse Examples
class remote;
   function void presspower();
    $display("Default : No device selected");
  endfunction
endclass

class fan extends remote;
  function void presspower();
    $display("fan on / off");
  endfunction
endclass

class ac extends remote;
  function void presspower();
    $display("ac on / off");
  endfunction
endclass

class light extends remote;
  function void presspower();
    $display("light on / off");
  endfunction
endclass

module tb;
  remote device[3];
  initial begin
    //Polymorphism
    //base class handle = child class
    device[0]=fan::new();
    device[1]=ac::new();
    device[2]=light::new();
    foreach(device[i]) device[i].presspower;
      end
endmodule
//output:
# KERNEL: Default : No device selected
# KERNEL: Default : No device selected
# KERNEL: Default : No device selected
// polymorphism without  virtual keyword  at its function  considers the default case in the baseclass only will not consider the childclasses .tBaseclass overrides all the  childclasses. to eliminate that overriding 
//by the baseclass we use the virtual keyword.
