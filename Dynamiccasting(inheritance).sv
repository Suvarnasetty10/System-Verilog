class ethernet_packet;
  int a;
endclass
class good_ethernet_packet extends ethernet_packet;
  int b;
endclass
class bad_ethernet_packet extends ethernet_packet;
  int e;
endclass
module tb;
  bit y,j;
  ethernet_packet eth_pkt;
  good_ethernet_packet g_pkt;
  bad_ethernet_packet b_pkt;
  initial begin
    eth_pkt=new();
    g_pkt=new();
    $cast(eth_pkt,g_pkt);
    y=$cast(eth_pkt,g_pkt);
    $display("y=%0d",y);
    $cast(b_pkt,eth_pkt);
    j=$cast(b_pkt,eth_pkt);
    $display("j=%0d",j);
  end 
endmodule
//output:
KERNEL: ASDB file was created in location /home/runner/dataset.asdb
# KERNEL: y=1
# RUNTIME: Error: RUNTIME_0197 testbench.sv (26): Illegal conversion to object of class bad_ethernet_packet from object of class good_ethernet_packet.
# KERNEL: Time: 0 ns,  Iteration: 0,  Instance: /tb,  Process: @INITIAL#20_0@.
# KERNEL: j=0
