`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2019 06:49:28 PM
// Design Name: 
// Module Name: counterDebouncer
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


module counterDebouncer( input ck, clear, output hit);
reg [16:0] count,countNext;
always @(posedge ck, posedge clear)
   if(clear)  count<=0;
   else count <= countNext;

always @(count,clear)
 if(clear) countNext=0;
 else if(count<99999) countNext=count+1;
 else countNext=0;
 assign hit= count==99999?1:0;
   
     
endmodule