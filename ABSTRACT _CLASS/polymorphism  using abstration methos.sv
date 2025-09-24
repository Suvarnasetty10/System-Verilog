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
  function void presspower();
    $display("ac on /off");
  endfunction
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
# KERNEL: fan on /off
# KERNEL: ac on /off
# KERNEL: light on /off
// in these method is not declared  or definedin the  baseclass  and the methods are declared in all the subclasses or childclasses.
      
