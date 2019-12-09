`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2019 08:58:20 AM
// Design Name: 
// Module Name: mode
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


module mode(
    input ck,
    input reset,
    input mode,
    output reg scene
    );
    
   reg [1:0] state, state_next;
   parameter CLOCK_MODE = 2'b00;
   parameter transition = 2'b01;
   parameter ALLARM_MODE = 2'b10;
   parameter transition1 = 2'b11;
   
   always @(posedge ck, posedge reset)
   if(reset) state<=0;
   else state<=state_next;
   
   always @(state,mode)
   case(state)
   CLOCK_MODE: if(mode) state_next= transition; else state_next=CLOCK_MODE;
   transition: if(mode) state_next=transition; else state_next=ALLARM_MODE;
   ALLARM_MODE: if(mode) state_next=transition1; else state_next=ALLARM_MODE;
   transition1: state_next=CLOCK_MODE;
   default:state_next=CLOCK_MODE;
   endcase
   
  always @(state)
  case(state) 
  CLOCK_MODE: scene=0;
  transition: scene=0;
  ALLARM_MODE: scene=1;
  transition1:scene=1;
  default:scene=0;
  endcase
  
   endmodule
