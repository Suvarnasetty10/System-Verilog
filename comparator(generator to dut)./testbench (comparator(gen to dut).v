// Code your testbench here
// or browse Examples
class generator;
  mailbox mbx;
  bit a,b;
  task run();
    for ( int i=1;i<6;i++)begin
      a = $random;  // single-bit random
      b = $random;
    
       mbx.put({a,b});
      $display("generated values a=%0b,b=%0b",a,b);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif; 
  bit a,b;
  bit a_equal_b;
  bit a_less_b;
  bit a_greater_b;
  bit [1:0]temp;
  task run();
    //vif.a=temp[1];
    //vif.b=temp[0];
    for ( int i=1;i<6;i++)begin
      mbx.get(temp);
      vif.a=temp[1];
      vif.b=temp[0];
      #1;
      $display("driver values a=%0b,b=%0b, a_equal_b=%0b,a_less_b=%0b,a_greater_b=%0b",
         vif.a, vif.b, vif.a_equal_b, vif.a_less_b, vif.a_greater_b);    
    end
  endtask
endclass

module tb;
  inter aif();
  comparator dut(.a(aif.a),.b(aif.b),.a_equal_b(aif.a_equal_b),.a_less_b(aif.a_less_b),.a_greater_b(aif.a_greater_b));
  mailbox mbx;
  generator gen;
  driver div;
  initial begin
    mbx=new();
    gen=new();
    div=new();
    gen.mbx=mbx;
    div.mbx=mbx;
    div.vif=aif;
    fork 
      gen.run();
      div.run();
    join
  end
endmodule
