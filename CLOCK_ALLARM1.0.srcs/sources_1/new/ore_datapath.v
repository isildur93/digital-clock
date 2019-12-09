`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2019 12:42:38
// Design Name: 
// Module Name: ore_datapath
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


module ore_datapath (input ck,
                     input reset,
                     input up_unit,
                     input up_dec,
                     input clear_unit,
                     input clear_dec,
                     output [3:0] uh, //unit hout on 4 bit 
                     output [3:0] dh); // dec hour on 4 bit
                     counter09 unit_hour(ck,reset,up_unit,clear_unit,uh);
                     counter09 dec_hour(ck,reset,up_dec,clear_dec,dh);
                     
                     
endmodule