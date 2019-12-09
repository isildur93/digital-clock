`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 11:48:18 PM
// Design Name: 
// Module Name: DISPLAY
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


module display(input ck, reset,input [3:0] in0, [3:0] in1, [3:0]in2, [3:0]in3, 
output [6:0] seg, output [7:0] an );
  wire [3:0] inseg; 
  wire [3:0] sel; 
   
   multiplexerDisplay m1(sel,in0,in1,in2,in3,inseg);
   count8 contatore8(ck,reset,en,sel);
   decoder dcoder(sel,an);
   genRefresh generatoreRefresh(ck,reset,en);
   sevenseg sevenSeg(inseg,seg);
        
endmodule

module count8(
               input ck, reset, en, 
               output reg [3:0] count);
               reg [3:0] count_next;
    
      always @(posedge ck, posedge reset)
               if(reset) count<=4'd0;
               else  count<=count_next;
      always @(en,count)
               if(en) begin if(count<8) count_next=count+1;  else count_next=0;end 
              
               else count_next=count;
               
        
        
             
                  
endmodule
//-----------------------MODIFICARE PRIMA DI METTERE IN FPGA-------------------------------
module genRefresh(input ck,reset,output  refresh);
parameter [4:0]  threshold= 18'd5 ;
             
          reg [4:0] cnt, cnt_next;
          
       always @(posedge ck, posedge reset )
     if(reset) cnt<=0;
     else cnt<=cnt_next;

always@(cnt)
 if(cnt<(threshold-1))
   cnt_next=cnt+1;
   else cnt_next=0;

assign refresh = cnt == threshold-1?  1 : 0; //hit at 4 



endmodule



module decoder(input [3:0] sel,output reg [7:0] an);
   always @(sel)
      case(sel)
      4'b0000: an=8'b11111110;
      4'b0001: an=8'b11111101;
      4'b0010: an=8'b11111011;
      4'b0011: an=8'b11110111;
      4'b0100: an=8'b11101111;
      4'b0101: an=8'b11011111;
      4'b0110: an=8'b10111111;
      4'b0111: an=8'b01111111;
    
      default: an=8'b11111111;
      endcase
   endmodule
 


module sevenseg(
                input [3:0] inseg,
                output reg  [6:0] seg);
 always @(inseg)
    case(inseg)
       4'h0: seg=7'b1000000;
       4'h1: seg=7'b1111001;
       4'h2: seg=7'b0100100;
       4'h3: seg=7'b0110000;
       4'h4: seg=7'b0011001;
       4'h5: seg=7'b0010010;
       4'h6: seg=7'b0000010;
       4'h7: seg=7'b1111000;
       4'h8: seg=7'b0000000;
       4'h9: seg=7'b0011000; 
       4'hA: seg=7'b0001000;
       4'hB: seg=7'b0000011;
       4'hC: seg=7'b1000110;
       4'hD: seg=7'b0100001;
       4'hE: seg=7'b0000110;
       4'hF: seg=7'b0001110;
       default: seg=7'b0000000;
      endcase
   endmodule




module multiplexerDisplay (
          input [3:0] sel,
          input [3:0] in0,in1,in2,in3,
          output reg [3:0] inseg);
          always @(sel,in0,in1,in2,in3)
         case(sel)
         4'd0: inseg=in0;
         4'd1: inseg=in1;
         4'd2: inseg=in2;
         4'd3: inseg=in3;
        
         default: inseg =4'b0000;
         endcase
     endmodule 
