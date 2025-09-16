class vlsi;
  int data;
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
//we use this keyword to use function argument  and classmember with same names//
output:
# KERNEL: data=35,data1=65,data2=95
