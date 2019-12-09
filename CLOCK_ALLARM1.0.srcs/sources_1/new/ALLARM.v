`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 06:37:11 PM
// Design Name: 
// Module Name: ALLARM
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


module ALLARM( input ck,reset,MM,HH,output [3:0] cntUnita,output [3:0] cntDecine,
output [3:0] cntUnitaOre, output [3:0] cntDecineOre

    );
    wire hit9,hit5,en_unit_min,en_dec_min,clr_unit_min,clr_dec_min;
    wire en_unit_ore,clr_unit_ore,hit9ore,hit3,hit2,en_dec_ore,clr_dec_ore;
    //MInUTI
    min_Controller min_controller(ck, reset, MM,up60, hit9,hit5,en_unit_min, en_dec_min,clr_unit_min, clr_dec_min);
    counter09 unita(ck,reset,en_unit_min,clr_unit_min,cntUnita,hit9); 
    counter05 decine(ck,reset,en_dec_min,clr_dec_min,cntDecine,hit5);  
    
    
    
    //ORE
    
     hour_Controller hour_controller(ck, reset, HH,up24, hit9,hit2,hit3,en_unit_ore, en_dec_ore,clr_unit_ore, clr_dec_ore);
     counter09_spec unitaORe(ck,reset,en_unit_ore,clr_unit_ore,cntUnitaOre,hit9ore,hit3); //unita
     counter02 decineOre(ck,reset,en_dec_ore,clr_dec_ore,cntDecineOre,hit2);//decine
endmodule
