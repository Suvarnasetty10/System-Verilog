class apb_tx;
  rand bit wr_rd;
  rand bit[7:0] addr;
  rand bit[31:0]data;
  rand bit[3:0]sel;
  
  function void print();
    $display("wr_rd=%0b",wr_rd);
    $display("addr=%0h",addr);
    $display("data=%0h",data);
    $display("sel=%0b",sel);
  endfunction
  //constraint: compulsary rule need to follow.
  constraint sel_c{
    sel inside{4'b0010, 4'b0100,4'b1000,4'b1001,4'b0000};
  }
endclass

module tb;
  //integer a;//static data type(32 bit)
  apb_tx tx;//dynamic dta type
  //size of the tx=size(wr_rd)+size(addr)+size(data)+size(sel)=45bits
  
  initial begin
    tx=new();
    tx.print();
    tx.randomize();
    tx.print();
  end
endmodule
//output:
# KERNEL: wr_rd=0
# KERNEL: addr=0
# KERNEL: data=0
# KERNEL: sel=0
# KERNEL: wr_rd=1
# KERNEL: addr=d4
# KERNEL: data=ba001ddf
# KERNEL: sel=1001
    
  
