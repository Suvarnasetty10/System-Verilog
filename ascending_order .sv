//ascending order of the array
class sample;
  int i,j;
  rand bit[3:0] a[];
  int val;
  constraint c1 {a.size==10; //element count
                 foreach(a[i]){
                   if(i>=0)
                     a[i]>a[i-1];
                }
                }
endclass
module tb;
  sample s=new();
  int i;
  initial begin
    assert(s.randomize());
    foreach(s.a[i])
    $display("a[%0d]=%0d ",i,s.a[i]);   
  end
endmodule
//output:
# KERNEL: a[0]=1 
# KERNEL: a[1]=3 
# KERNEL: a[2]=5 
# KERNEL: a[3]=6 
# KERNEL: a[4]=9 
# KERNEL: a[5]=10 
# KERNEL: a[6]=11 
# KERNEL: a[7]=12 
# KERNEL: a[8]=13 
# KERNEL: a[9]=14                  
