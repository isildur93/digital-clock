`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2019 22:55:37
// Design Name: 
// Module Name: TB_minuti_unita
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


module TB_minuti_unita(

    );
    wire [3:0] unita;reg ck,reset,start,clear;
    reg [5:0]i;
    reg [5:0]j;
     minuti_unita m(ck,reset,start,clear,unita);
    
    
    
    initial  begin clear=0; ck=0;reset=0;start=0; #20 reset=1;#40 reset=0;
     for(i=0;i<7;i=i+1) begin @(negedge ck) start=1; @(negedge ck) start=0; end
      #30 clear=1;
      #40 clear=0;
       for(j=0;j<10;j=j+1) begin @(negedge ck) start=1; @(negedge ck) start=0; end  end
    always #5 ck=~ck;
endmodule
