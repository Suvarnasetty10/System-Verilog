module tb;
  task one();
    $display("Task 1 is started :%0t",$time);
    #20;
    $display("Task1 is completed :%0t",$time);
  endtask
  task two();
    $display("Task2 is started :%0t",$time);
    #10;
    $display("Task2 is completed:%0t",$time);
  endtask
  task three();
    $display("Task3 is started :%0t",$time);
    #5;
    $display("Task3 is completed:%0t",$time);
  endtask
  initial begin
  fork
    one();
    two();
    //three();
  join_none//join none of the  above tasks excutes first only task which in join none enablesor trigger first,and then excutes according to the dealy 
  three();
  end
endmodule
//output:
Task3 is started :0
Task 1 is started :0
Task2 is started :0
Task3 is completed:5
Task2 is completed:10
Task1 is completed :20
    
  
    
    
