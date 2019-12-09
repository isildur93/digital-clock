`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2019 03:10:25 PM
// Design Name: 
// Module Name: TB_TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Testbench per testare che l'orologio avanzi correttamente
 // con il passare del tempo
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_TOP(

    );
    wire [7:0] an;
    wire [6:0] seg;
    reg ck,reset,MM,HH,MODE;
    TOP dut(ck,reset,MM,HH,MODE,seg,an,blk);
    always #5 ck=~ck;
    initial begin ck=1;reset=1;MM=0;HH=0;MODE=0; 
    #20 reset=0;
   
   
   
   
   
    
    
    
    
  
     end
endmodule
