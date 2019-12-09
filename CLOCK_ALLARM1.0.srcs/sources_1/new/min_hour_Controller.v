`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2019 12:47:45
// Design Name: 
// Module Name: min_hour_Controller
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


module min_Controller( input ck, reset, MM,up60, hit9,hit5,
                            output reg en_unit_min, en_dec_min,
                                 
                                   
                             output reg clr_unit_min, clr_dec_min
                                     

    );
    parameter idle = 5'd0;
    parameter s1 = 5'd1;
    parameter  s2 = 5'd2;
    parameter  s3 = 5'd3;
    parameter  s4= 5'd4;
    parameter  s5 = 5'd5;
    parameter  s6 = 5'd6; 
    parameter  s7 = 5'd7; 
    parameter  s8 = 5'd8; 
    parameter  s9 = 5'd9; 
    parameter  s10 = 5'd10; 
    parameter  s11 = 5'd11;
    parameter  s12 = 5'd12;
    parameter  s13 = 5'd13; 
    parameter  s14 = 5'd14; 
    reg [4:0] state,stateNext;
    always @(posedge ck,posedge reset)
    if(reset)
    state<=0;
    else state<=stateNext;
    
    always @(state,MM,hit9,hit5,up60)
     case(state)
     idle: if(MM|up60) stateNext=s1; else stateNext=idle;
     s1:if(MM)stateNext=s1; else stateNext=s2; 
     s2:if(up60) stateNext=s14; else if(~(hit9|hit5)) stateNext=s3; //00
      else if(hit9&(~hit5))  stateNext=s5;//01
       else if(hit5&(~hit9)) stateNext=s11;//10
      else if(hit5&hit9) stateNext=s13;
       else stateNext=idle;//11
       //da correggere
     s3:stateNext=s4;//en unita
     s4:stateNext=idle;
     s5: stateNext=s6;//up dec
     s6:stateNext=idle;
     s7:stateNext=s8; 
     s8:stateNext=s9;
     s9:stateNext=idle;
     s10:stateNext=idle;
     s11:stateNext=idle;
     s12:stateNext=idle;//s11 � lo stato in cui vado se ce hit5 
     s13:stateNext=idle; //AZZERO ENTRAMBI I CONTATOREI
     s14: stateNext=idle;
     
    
   endcase
   
    always @(state)
    case(state)
   idle: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s1: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s2: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s3: begin en_unit_min=1; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s4: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s5: begin en_unit_min=0; en_dec_min=1; clr_unit_min=0; clr_dec_min=0; end
     s6: begin en_unit_min=0; en_dec_min=0; clr_unit_min=1; clr_dec_min=0; end
     s7: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s8: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s9: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=1; end
     s10: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s11: begin en_unit_min=1; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s12: begin en_unit_min=0; en_dec_min=0; clr_unit_min=0; clr_dec_min=0; end
     s13: begin en_unit_min=0; en_dec_min=0; clr_unit_min=1; clr_dec_min=1; end
     s14: begin en_unit_min=1; en_dec_min=0; clr_unit_min=1; clr_dec_min=0; end
    endcase
    
    
endmodule
module hour_Controller( input ck, reset, HH,up24, hit9,hit2,hit3,
                            output reg en_unit_ore, en_dec_ore,
                             
                                 
                                   
                             output reg clr_unit_ore, clr_dec_ore
                                     

    );
    //en_unit_ore4,clr_unit_ore4
    parameter idle = 5'd0;
    parameter s1 = 5'd1;
    parameter  s2 = 5'd2;
    parameter  s3 = 5'd3;
    parameter  s4= 5'd4;
    parameter  s5 = 5'd5;
    parameter  s6 = 5'd6; 
    parameter  s7 = 5'd7; 
    parameter  s8 = 5'd8; 
    parameter  s9 = 5'd9; 
    parameter  s10 = 5'd10; 
    parameter  s11 = 5'd11;
    parameter  s12 = 5'd12;
    parameter  s13 = 5'd13; 
     parameter  s14 = 5'd14; 
    parameter  s15 = 5'd15; 
    parameter  s16 = 5'd16; 
    parameter  s17 = 5'd17;
    parameter  s18 = 5'd18;
   
    reg [4:0] state,stateNext;
    always @(posedge ck,posedge reset)
    if(reset)
    state<=0;
    else state<=stateNext;
    
    always @(state,HH,hit9,hit2,hit3,up24)
     case(state)
     idle: if(HH|up24) stateNext=s1; else stateNext=idle;
     s1: if(HH) stateNext=s1;else stateNext=s2;
     s2: stateNext=s3;
     s3: if(hit3&hit2&(~hit9)) stateNext=s12; else if(~(hit9|hit2)) stateNext=s4; else if((~hit9)&hit2)  stateNext=s6;
      else if(hit9&(~hit2)) stateNext=s8;else if(hit9&hit2) stateNext=s10; 
     s4:stateNext=s5; //s4 --> en unita
     s5: stateNext=idle;
     s6: stateNext=s7;// en unita
     s7:stateNext=idle;
     s8:stateNext=s9;
     s9:stateNext=idle;
     s10:stateNext=s11;
     s11:stateNext=s12;
     s12:stateNext=idle;
     
     
     
     
    
   endcase
   
    always @(state)
    case(state)
   idle: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s1: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s2: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s3: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s4: begin en_unit_ore=1; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s5: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s6: begin en_unit_ore=1; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s7: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s8: begin en_unit_ore=0; en_dec_ore=1; clr_unit_ore=1; clr_dec_ore=0; end
     s9: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s10: begin en_unit_ore=1; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s11: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
     s12: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=1; clr_dec_ore=1; end
//     s13: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=1; clr_dec_ore=1; end
//     s14: begin en_unit_ore=1; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
//     s15: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=0; clr_dec_ore=0; end
//     s16: begin en_unit_ore=1; en_dec_ore=0; clr_unit_ore=1; clr_dec_ore=1; end
//     s17: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=1; clr_dec_ore=1; end
//      s18: begin en_unit_ore=0; en_dec_ore=0; clr_unit_ore=1; clr_dec_ore=1; end
    endcase
    
   
endmodule