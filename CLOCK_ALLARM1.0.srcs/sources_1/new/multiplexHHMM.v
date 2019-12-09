`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 08:56:36 PM
// Design Name: 
// Module Name: multiplexHHMM
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


module multiplexHHMM(input  MM,HH,input  sel,output  up60, up24, up60sv, up24sv);


     assign up60= sel==0?MM:0;
     assign up24= sel==0?HH:0;
     
     assign up60sv=sel==1?MM:0;
     assign up24sv=sel==1?HH:0;
    
endmodule
