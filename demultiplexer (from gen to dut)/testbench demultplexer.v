class generator; 
  mailbox mbx;
  bit y,s;
  task run();
    for(int i=0;i<8;i++) begin
     y=$random;
     s=$random;
      mbx.put({s,y});
    //for(int i=0;i<8;i++) begin
      $display("y=%0b;s=%0b",y,s);
    end
  endtask
endclass

class driver;
  mailbox mbx;
  virtual inter vif;
  bit [1:0]temp;
  bit y,s;
  bit i0,i1;
  task run();
    forever begin
      mbx.get(temp);
      y=temp[1];
      s=temp[0];
      vif.y=y;
      vif.s=s;
      #2;
      $display("y=%0b;s=%0b,i0=%0b,i1=%0b",vif.y,vif.s,vif.i0,vif.i1);
    end
  endtask
endclass

module tb;
  inter aif();
  demultiplexer dut(.s(aif.s),.y(aif.y),.i0(aif.i0),.i1(aif.i1));
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
  
  
      
  
