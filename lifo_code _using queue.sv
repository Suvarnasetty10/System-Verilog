class lifo;
  int intQ[$]; 
  function void put(int a);
    intQ.push_back(a);
  endfunction
  function void get(output int a);
    a = intQ.pop_back();
  endfunction
endclass

module tb;
  lifo dut=new();
  int num;
  initial begin
    repeat(5)begin
      num=$urandom_range(10,20);
      dut.put(num);
      $display("%0d",num);
    end
    repeat(5)begin
      dut.get(num);
      $display("%0d",num);
    end
  end
endmodule
//output:
# KERNEL: 19
# KERNEL: 14
# KERNEL: 18
# KERNEL: 10
# KERNEL: 13
# KERNEL: 13
# KERNEL: 10
# KERNEL: 18
# KERNEL: 14
# KERNEL: 19
  
   
      
      
        
  
