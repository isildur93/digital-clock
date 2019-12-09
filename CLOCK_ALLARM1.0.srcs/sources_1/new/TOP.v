`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2019 12:44:59
// Design Name: 
// Module Name: TOP
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


module TOP(input ck,reset,
            MM,HH,MODE,
 output [6:0] seg, output [7:0] an,output blk);
    wire [3:0] unitHourChoose;
    wire [3:0] decHourChoose;
    wire up60,up24,scene;
    wire [3:0]cntUnitaAL;
    wire [3:0] cntDecineAL;
    wire [3:0]cntUnitaOreAL;
    wire [3:0]cntDecineOreAL;
    wire [3:0] cntUnita;
    wire [3:0] cntDecine;
    wire [3:0] cntUnitaOre;
    wire [3:0] cntDecineOre;
    wire [3:0] decMinutChoose;
    wire [3:0] unitMinutChoose;
    mode mod(ck,reset, MODE,scene);
    multiplexHHMM mplhhmm(MM,HH,scene,up60,up24, up60sv, up24sv);
 //   debouncerMM mode(ck,reset, MODE,nobmode);
//    debouncerMM mm(ck,reset, MM,nobmm);
//    debouncerMM hh(ck,reset, HH,nobhh);
    CLOCK orologio(ck,reset,up60,up24,cntUnita,cntDecine,cntUnitaOre,cntDecineOre);
    ALLARM sveglia(ck,reset,up60sv,up24sv,cntUnitaAL, cntDecineAL,cntUnitaOreAL,cntDecineOreAL);
    
    
       
    
     multiplexer mpl( scene,
                      cntUnita,
                      cntDecine,
                      cntUnitaOre,
                      cntDecineOre,
                      
                      cntUnitaAL,
                      cntDecineAL,
                      cntUnitaOreAL,
                      cntDecineOreAL,
                      
                      unitMinutChoose,
                      decMinutChoose,
                      unitHourChoose,
                      decHourChoose);

    display ds(ck,reset,unitMinutChoose,decMinutChoose,unitHourChoose,decHourChoose,seg,an);
    
    blink Blink(ck,cntUnita,cntDecine,cntUnitaOre,cntDecineOre,cntUnitaAL, cntDecineAL,cntUnitaOreAL,cntDecineOreAL, blk);
endmodule
