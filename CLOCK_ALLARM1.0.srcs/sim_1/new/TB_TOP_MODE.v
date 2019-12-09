
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
// Description: Testbench per testare che i registri della sveglia aumentino correttamente.
// i registri dell'orologio devono rimanere invariati
 // con il passare del tempo. BISOGNA PRIMA MODIFICARE genmin. aumentare threshold !!
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_TOP_MODE(

    );
    reg [4:0] i; reg [4:0]k;
    wire [7:0] an;
    wire [6:0] seg;
    reg ck,reset,MM,HH,MODE;
    TOP dut(ck,reset,MM,HH,MODE,seg,an,blk);
    always #5 ck=~ck;
    initial begin ck=1;reset=1;MM=0;HH=0;MODE=0; 
    
    #20 reset=0;
    #60;
    @(negedge ck) MODE=1; @(negedge ck) MODE=0; //passo in modalita sveglia
    #60;
    // imposto la sveglia alle 6:05;
    for(i=0;i<6;i=i+1)
          begin  @(negedge ck) HH=1; @(negedge ck) HH=0; #500 ;end // imposto le 6:00
          
    for(k=0;k<5;k=k+1)
          begin  @(negedge ck) MM=1; @(negedge ck) MM=0; #500;end // imposto le 6:00
    
  
         end
endmodule
