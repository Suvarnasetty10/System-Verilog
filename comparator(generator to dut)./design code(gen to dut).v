// Code your design code for comparator(gen to dut)
module comparator(a,b,a_equal_b,a_less_b,a_greater_b);
  input a,b;
  output reg a_equal_b;
  output reg a_less_b;
  output reg a_greater_b;
  always@(*) begin
     a_equal_b   = 0;
      a_less_b    = 0;
      a_greater_b = 0;
    
    if (a==b)
       a_equal_b=1;
    else if(a<b)
      a_less_b=1;
    else
      a_greater_b=1;
  end
endmodule
      
 interface inter;
   logic a;
   logic b;
   logic a_equal_b;
   logic a_less_b;
   logic a_greater_b;
 endinterface
