`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2019 15:49:21
// Design Name: 
// Module Name: TB_minuti
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TB_minuti(
    );
    reg ck,reset,MM,HH,clear;
    wire [3:0] cntUnita;
    wire [3:0] cntDecine;
    wire [3:0] cntUnitaOre;
    wire [3:0] cntDecineOre;
    reg [5:0] i; reg [5:0] j;reg [5:0] l;
     //for(i=0;i<10;i=i+1) begin @(negedge ck) MM=1; @(negedge ck) MM=0; #500; end
      
       //for(j=0;j<10;j=j+1) begin @(negedge ck) MM=1; @(negedge ck) MM=0; #500; end
    wire en_unit_min,clr_unit_min,hit9ore,hit5,en_dec_min;
    
    min_Controller dut(ck, reset, MM, hit9,hit5,en_unit_min, en_dec_min,
                           clr_unit_min, clr_dec_min);
                           counter09 c1(ck,reset,en_unit_min,clr_unit_min,cntUnita,hit9); //MINUTI
                           counter05 c2(ck,reset,en_dec_min,clr_dec_min,cntDecine,hit5);     
                           
    hour_Controller dut1(ck, reset, HH, hit9ore,hit2,hit3,en_unit_ore, en_dec_ore,
                           clr_unit_ore, clr_dec_ore);
      
                          //ORE
                           counter09_spec c3(ck,reset,en_unit_ore,clr_unit_ore,cntUnitaOre,hit9ore,hit3); //unita
                           counter02 c4(ck,reset,en_dec_ore,clr_dec_ore,cntDecineOre,hit2);//decine
                          //counter03(ck,reset,start,clear,cnt,hit);
                           initial  begin clear=0; ck=1;reset=0;MM=0; #20 reset=1;#40 reset=0;
    
       for(l=0;l<26;l=l+1) begin @(negedge ck) HH=1; @(negedge ck) HH=0; #500; end
       #500;
        for(i=0;i<10;i=i+1) begin @(negedge ck) MM=1; @(negedge ck) MM=0; #700; end end
      
       //for(j=0;j<10;j=j+1) begin @(negedge ck) MM=1; @(negedge ck) MM=0; #500; end  end
    always #5 ck=~ck;
endmodule
