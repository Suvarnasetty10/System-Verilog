module tb;
  string s1="1234";
  string s2="345";
  real num;
  initial
    begin
      $display("%0f", s1.atoreal());
      $display("%0f", s2.atoreal());
      num= s1.atoreal()+s2.atoreal();
      $display("%0f", num);
    end
endmodule
//output:
# KERNEL: 1234.000000
# KERNEL: 345.000000
# KERNEL: 1579.000000
  
