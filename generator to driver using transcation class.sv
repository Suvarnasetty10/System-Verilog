class apb_tx;
  rand bit wr_rd;
  rand bit [7:0] addr;
  rand bit [31:0] data;
  rand bit [3:0] sel;
  
  function void print(string thub);
    $display("[%0s] wr_rd=%0b  addr=%0h  data=%0h  sel=%0b",thub,wr_rd,addr,data,sel);
  endfunction
  
  constraint sel_c{
    sel inside {4'b0101,4'b0011,4'b1100,4'b0010,4'b0000};
  }
endclass

class apb_gen;
  mailbox mbox;
  apb_tx tx;
  task run();
    repeat(5) begin
      tx=new();
      tx.randomize();
      tx.print("apb_gen");
      mbox.put(tx);
    end
  endtask
endclass

class apb_bfm;
  mailbox mbox;
  apb_tx tx;
  task run();
    repeat(5) begin
      tx=new();
      mbox.get(tx);
      tx.print("apb_bfm");
    end
  endtask
endclass

module top;
  mailbox mbox;
  apb_gen gen;
  apb_bfm bfm;
  initial begin
    mbox=new();
    gen=new();
    bfm=new();
    gen.mbox=mbox;
    bfm.mbox=mbox;
    fork
      gen.run();
      bfm.run();
    join
  end 
endmodule
//output:
# KERNEL: [apb_gen] wr_rd=0  addr=61  data=2e3ed583  sel=101
# KERNEL: [apb_gen] wr_rd=0  addr=df  data=32c4fe90  sel=0
# KERNEL: [apb_gen] wr_rd=0  addr=63  data=a00d6e4b  sel=10
# KERNEL: [apb_gen] wr_rd=0  addr=14  data=87444b42  sel=1100
# KERNEL: [apb_gen] wr_rd=1  addr=a5  data=8682075a  sel=101
# KERNEL: [apb_bfm] wr_rd=0  addr=61  data=2e3ed583  sel=101
# KERNEL: [apb_bfm] wr_rd=0  addr=df  data=32c4fe90  sel=0
# KERNEL: [apb_bfm] wr_rd=0  addr=63  data=a00d6e4b  sel=10
# KERNEL: [apb_bfm] wr_rd=0  addr=14  data=87444b42  sel=1100
# KERNEL: [apb_bfm] wr_rd=1  addr=a5  data=8682075a  sel=101

      
  

  
