
// Code your design here
module demultiplexer(i0,i1,s,y);
  input y,s;
  output i0,i1;
  assign i0 = (s == 1'b1)? y:1'b0;
  assign i1 = (s == 1'b0)? y:1'b0;
endmodule

interface inter;
  logic y,s;
  logic i0,i1;
endinterface 












