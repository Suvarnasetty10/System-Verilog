// Code your testbench here
// or browse Examples
virtual class remote;
    pure virtual function void presspower();
    //$display("default:NO device selected");
  //endfunction
endclass
class fan extends remote;
  function void presspower();
    $display("fan on /off");
  endfunction
endclass

class ac extends remote;
  /*function void presspower();
    $display("ac on /off");
  endfunction*/
endclass

class light extends remote;
  function void presspower();
    $display("light on /off");
  endfunction
endclass

module tb;
  remote device[3];
  initial begin
    //polymorphism
    //base class handle= child class
    device[0]=fan::new();
    device[1]=ac::new();
    device[2]=light::new();
    foreach(device[i])
      device[i].presspower;
  end
endmodule
//output:
ERROR VCP2938 "Cannot declare class ac as non abstract class due to not implemented pure virtual methods:" "testbench.sv" 16  9
ERROR VCP2941 "... see pure virtual method: presspower declaration." "testbench.sv" 4  42
//by using abstration methods we will get the errors ====> that  for ac method is not derived for it  . by getting that error we can solve that issue.     
