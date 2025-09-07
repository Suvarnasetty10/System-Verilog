//typedef enum{blue,green,red,yellow}color_tb;
module tb;
  typedef enum{blue,green,red,yellow}color_tb;
  color_tb color;
  initial 
    begin
      color=color.first();
      $display("color=%0d,colourname=%0s",color,color.name);
      color=color.next();
      $display("color=%0d,colourname=%0s",color,color.name);
      color=color.last();
      $display("color=%0d,colourname=%0s",color,color.name);
      color=color.prev();
      $display("color=%0d,colourname=%0s",color,color.name);
      color=color.prev();
      $display("color=%0d,colourname=%0s",color,color.name);
      color=color.prev();
      $display("color=%0d,colourname=%0s",color,color.name);
       color=color.prev();
      $display("color=%0d,colourname=%0s",color,color.name);
       color=color.prev();
      $display("color=%0d,colourname=%0s",color,color.name);
    end
endmodule
//output:
# KERNEL: color=0,colourname=blue
# KERNEL: color=1,colourname=green
# KERNEL: color=3,colourname=yellow
# KERNEL: color=2,colourname=red
# KERNEL: color=1,colourname=green
# KERNEL: color=0,colourname=blue
# KERNEL: color=3,colourname=yellow
# KERNEL: color=2,colourname=red
      
  
