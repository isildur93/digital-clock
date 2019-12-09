`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 10:41:55 PM
// Design Name: 
// Module Name: multiplexer
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


module multiplexer(input sel,
     input [3:0] unitMinut,
     input [3:0] decMinut,
     input [3:0] unithour,
     input [3:0] dechour,
     input [3:0] unitMinutALLARM,
     input [3:0] decHoursALLARM,
     input [3:0] unitHourALLARM,
     input [3:0] decHourALLARM,
      
    output [3:0] unitMinutChoose,
    output [3:0] decMinutChoose,
    output [3:0] unitHourChoose,
    output [3:0] decHourChoose
    );
    assign unitMinutChoose=sel==0?unitMinut:unitMinutALLARM;
    assign decMinutChoose=sel==0?decMinut:decHoursALLARM;
    
    assign unitHourChoose=sel==0?unithour:unitHourALLARM;
    assign decHourChoose=sel==0?dechour:unitHourALLARM;
    
   endmodule
