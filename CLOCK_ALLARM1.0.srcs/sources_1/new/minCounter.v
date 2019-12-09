`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 05:19:15 PM
// Design Name: 
// Module Name: minCounter
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


module minCounter( input ck, clear, min, output hit);
reg [7:0] count,countNext;
always @(posedge ck, posedge clear)
   if(clear)  count<=0;
   else count <= countNext;

always @(count,clear,min)
 if(clear) countNext=0;
 else if(count<60) if(min) countNext=count+1; else countNext=count;
 else countNext=0;
 assign hit= count==60?1:0;
 
     
endmodule