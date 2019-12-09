`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 07:02:40 PM
// Design Name: 
// Module Name: blink
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


module blink( input ck,
 input [3:0] um,
 input [3:0] dm,
 input [3:0] uh,
 input [3:0] dh, 
 input [3:0] us, 
 input [3:0] ds,
 input [3:0] ush, 
 input [3:0] dsh,
 output blk

    );
    assign blk =({um,dm,uh,dh}=={us,ds,ush,dsh})?1:0;
    
endmodule
