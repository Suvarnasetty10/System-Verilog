module tb;
  string s1="suvarna";
  string s2="SUVARNA";
  string s3="SUVARNA";
  string s4;
  real num;
  initial
    begin
      $display("%0s", s1.substr(0,6));
      s4={s1.substr(3,6)," ",s3.substr(3,6)};
      $display("%0s",s4);
    end
endmodule
//output:
#KERNEL: suvarna
# KERNEL: arna ARNA

  
