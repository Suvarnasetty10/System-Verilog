module tb;
  task  swap(input bit [3:0]a,bit[3:0]b);
    bit[3:0]temp;
    temp=a;
    a=b;
    b=temp;
    $display("a=%0d,b=%0d",a,b);
  endtask
  initial
    begin
      bit[3:0]a;
      bit[3:0]b;
      a=9;
      b=7;
      swap(a,b);
      #10;
      $display("a=%0d,b=%0d",a,b);
    end
endmodule
//output:
# KERNEL: a=7,b=9
# KERNEL: a=9,b=7
               
