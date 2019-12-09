`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 05:08:45 PM
// Design Name: 
// Module Name: genMinuti
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


module genMinuti(input ck,reset,output  refresh);
parameter [4:0]  threshold= 5'd5 ;
             
          reg [4:0] cnt, cnt_next;
          
       always @(posedge ck, posedge reset )
     if(reset) cnt<=0;
     else cnt<=cnt_next;

always@(cnt)
 if(cnt<(threshold))
   cnt_next=cnt+1;
   else cnt_next=0;

assign refresh = cnt==threshold?  1 : 0;



endmodule
