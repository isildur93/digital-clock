`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.12.2019 22:34:35
// Design Name: 
// Module Name: minuti_unita
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Questo modulo rappresenta i minuti. è composto da due contatori da 0 a 9. il contatore delle 
//unita deve fare 6 cicli. quello delle decine 5.
//deve essere presente un segnale in uscira che faccia partire le unita delle ore.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module minuti(       input ck,
                     input reset,
                     input up_unit,
                     input up_dec,
                     input clear_unit,
                    
                     input clear_dec,
                     output [3:0] um, //unit minut on 4 bit 
                     output [3:0] dm); // dec minut on 4 bit
                     counter09 unit_minut(ck,reset,up_unit,clear_unit,um);
                     counter09 dec_minut(ck,reset,up_dec,clear_dec,dm);
                     
                     
endmodule



