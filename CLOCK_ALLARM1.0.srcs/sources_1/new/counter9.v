`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2019 12:44:03
// Design Name: 
// Module Name: counter9
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


module counter09(input ck,reset,start,clear,
                 output reg [3:0] cnt,
                 output  hit
                );
                 parameter STOP = 4'd9;
reg [3:0] cntNext;
always @(posedge ck,posedge reset)
if(reset)
cnt<=0;
else cnt<=cntNext;

always @(cnt,start,clear)
if(~clear)
if(start)
if(cnt<STOP) cntNext=cnt+1; else if(cnt==STOP) cntNext=0; else cntNext=cnt+1;
else cntNext=cnt;
else cntNext=0;

assign hit=cnt==9?1:0;
 endmodule
 
 
 
 module counter05(input ck,reset,start,clear,
                 output reg [3:0] cnt,
                 output  hit
                );
                 parameter STOP = 4'd5;
reg [3:0] cntNext;
always @(posedge ck,posedge reset)
if(reset)
cnt<=0;
else cnt<=cntNext;

always @(cnt,start,clear)
if(~clear)
if(start)
if(cnt<STOP) cntNext=cnt+1; else if(cnt==STOP) cntNext=0; else cntNext=cnt+1;
else cntNext=cnt;
else cntNext=0;

assign hit=cnt==5?1:0;



 endmodule
 

 
 module counter09_spec(input ck,reset,start,clear,
                 output reg [3:0] cnt,
                 output  hit,hit3
                );
                 parameter STOP = 4'd9;
reg [3:0] cntNext;
always @(posedge ck,posedge reset)
if(reset)
cnt<=0;
else cnt<=cntNext;

always @(cnt,start,clear)
if(~clear)
if(start)
if(cnt<STOP) cntNext=cnt+1; else if(cnt==STOP) cntNext=0; else cntNext=cnt+1;
else cntNext=cnt;
else cntNext=0;

assign hit=cnt==9?1:0;
assign hit3=cnt==3?1:0;



 endmodule
 
 
 
 
module counter02(input ck,reset,start,clear,
                 output reg [3:0] cnt,
                 output  hit
                );
                 parameter STOP = 4'd2;
reg [3:0] cntNext;
always @(posedge ck,posedge reset)
if(reset)
cnt<=0;
else cnt<=cntNext;

always @(cnt,start,clear)
if(~clear)
if(start)
if(cnt<STOP) cntNext=cnt+1; else if(cnt==STOP) cntNext=cntNext; else cntNext=cnt+1;
else cntNext=cnt;
else cntNext=0;

assign hit=cnt==2?1:0;



 endmodule