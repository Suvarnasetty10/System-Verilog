//decoder design code (generator to dut)
module decoder(
  input [1:0]d,
  output reg [3:0]y);
  always@(*)begin
    case(d)
      2'b00:y=4'b0001;
      2'b01:y=4'b0010;
      2'b10:y=4'b0100;
      2'b11:y=4'b1000;
    endcase
  end
endmodule
      
interface inter;
  logic [3:0]y;
  logic [1:0]d;
endinterface
//testbench
class generator;
  mailbox mbx;
  logic[1:0]d;
  task run();
    for(int i=0;i<8;i++)begin
      d=$random;
      //y=$random;
      mbx.put(d);
      $display("generated  one d=%2b",d);
    end
  endtask
endclass
class driver;
  mailbox mbx;
  virtual inter vif;
  logic [1:0]temp;
  logic [3:0]y;
  logic [1:0]d;
  task run();
    forever begin
      mbx.get(temp);
        vif.d=temp[1:0];
    #10;
        $display("driver d=%2b,y=%4b",vif.d,vif.y);
      end
  endtask
endclass
               
module tb;
  inter aif();
  decoder u1(.d(aif.d),.y(aif.y));
  mailbox mbox;
  generator gen;
  driver div;
  initial begin
    gen=new();
    div=new();
    mbox=new();
    
    div.mbx=mbox;
    gen.mbx=mbox;
    div.vif=aif;
    fork
      gen.run();
      div.run();
    join
  end
endmodule
//output:
# generated  one d=00
# generated  one d=01
# generated  one d=01
# generated  one d=11
# generated  one d=01
# generated  one d=01
# generated  one d=01
# generated  one d=10
# driver d=00,y=0001
# driver d=01,y=0010
# driver d=01,y=0010
# driver d=11,y=1000
# driver d=01,y=0010
# driver d=01,y=0010
# driver d=01,y=0010
# driver d=10,y=0100


