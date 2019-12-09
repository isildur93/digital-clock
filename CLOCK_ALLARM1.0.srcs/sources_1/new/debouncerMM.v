`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2019 08:29:15 PM
// Design Name: 
// Module Name: debouncerMM
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

module debouncerMM( input ck,
        input reset,
        input button,
        output nob
        );
       
       
        debouncer debouncer(ck,reset,button,hit,nob,clear);
        counterDebouncer countDebouncer( ck, clear,hit);
        
    endmodule
