`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2019 06:48:20 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer( input ck,reset,button,hitDeb,
                  output reg nob,clear);
                  
     reg [3:0] state,stateNext;
     parameter [3:0] init = 4'b0000;
     parameter [3:0] setNOB1 = 4'b0001 ; 
     parameter [3:0] setNOB0 = 4'b0010 ; 
     parameter [3:0] freeze = 4'b0011 ; 
     parameter [3:0] finish = 4'b0100 ;   
     parameter [3:0] waitNegEdge = 4'b0101 ; 
     parameter [3:0] freeze1 = 4'b0110 ; 
     parameter [3:0] finish1 = 4'b111 ;   
     parameter [3:0] nextFront = 4'b1000 ;   
     parameter [3:0] setNob1 = 4'b1001 ;  
     parameter [3:0] setNob0 = 4'b1010 ;
     parameter [3:0] final = 4'b1011 ;
     
                     
                  always @(posedge ck,posedge reset)
                     if(reset) state<=0;
                     else state<=stateNext;
                    
                  always @(state,button,hitDeb)
                  case(state)
                  init : if(button) stateNext=setNOB1;
                        else stateNext=init;
                  setNOB1: stateNext= setNOB0;
                  setNOB0: stateNext= freeze;
                               
                               
                  freeze: if(hitDeb) stateNext=finish; else stateNext=freeze;
                  finish: stateNext=waitNegEdge;
                  
                  waitNegEdge:if(button)stateNext=waitNegEdge;else stateNext=freeze1;
                  freeze1: if(hitDeb) stateNext=finish1;
                  else stateNext=freeze1;
                  finish1:stateNext=setNob1;
//                  nextFront: if(button) stateNext=setNob1; else stateNext= nextFront;
                  setNob1: stateNext=setNob0;
                  setNob0: stateNext=final;
                  final:stateNext=init;
                  default: stateNext=init;
                  endcase
                  always @(state)
                   case(state)
                   init: begin nob=0;clear=1; end
                   setNOB1: begin nob=1;clear=1; end
                   setNOB0: begin nob=0;clear=1; end
                   freeze: begin nob=0;clear=0; end
                   finish: begin nob=0;clear=1; end
                   
                   waitNegEdge:begin nob=0;clear=1; end
                   freeze1:begin nob=0;clear=0; end
                   finish1: begin nob=0;clear=1; end
                   setNob1:begin nob=0;clear=1; end
                   setNob0:begin nob=0;clear=1; end
                   final:begin nob=0;clear=1; end
                   default: begin nob=0;clear=1; end
                   endcase
                   
                   
endmodule
