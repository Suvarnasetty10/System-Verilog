module tb;
  int arr[5]={10,20,30,40,50};
  int i;
  initial begin
    $display("%0d",$size(arr));
    foreach(arr[i])
      $display("arr[%0d]=%0d",i,arr[i]);
     $display("%0p",arr);
    repeat(5)begin
      arr[i-1]=i;
      $display("arr[%0d]=%0d",i,arr[i]);
      i=i+1;
    end
    repeat(5)begin
      $display("%0d",i);
      i=i+1;
    end
  end
endmodule
//output:
# KERNEL: 5
# KERNEL: arr[0]=10
# KERNEL: arr[1]=20
# KERNEL: arr[2]=30
# KERNEL: arr[3]=40
# KERNEL: arr[4]=50
# KERNEL: 10 20 30 40 50
# KERNEL: arr[0]=10
# KERNEL: arr[1]=20
# KERNEL: arr[2]=30
# KERNEL: arr[3]=40
# KERNEL: arr[4]=50
# KERNEL: 5
# KERNEL: 6
# KERNEL: 7
# KERNEL: 8
# KERNEL: 9
