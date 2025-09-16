class vlsi;
  local int data;
  shortint data1;
  longint data2;
  function new( input int data=0, input shortint data1=0, input longint data2=0);
    this.data=data;
    this.data1=data1;
    this.data2=data2;
  endfunction
endclass
module tb;
  initial begin
    vlsi v;
    v=new(35,65,95);
    $display("data=%0d,data1=%0d,data2=%0d",v.data,v.data1,v.data2);
    #10;
    $finish;
    end
endmodule
//output:
ERROR VCP5248 "Cannot access local/protected member ""v.data"" from this scope." "testbench.sv" 15  51
FAILURE "Compile failure 1 Errors 0 Warnings  Analysis time: 0[s]."
