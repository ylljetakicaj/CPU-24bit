`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 09:54:41 PM
// Design Name: 
// Module Name: ALU1b
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


module ALU1(

    input A,
    input B,
    input CIN,
    input BInvert,
    input Less,
    input [1:0] Op,
    output Result,
    output CarryOut
    );
    
   wire JoB, mB, dhe_teli, ose_teli, mb_teli, XOR_teli,  slt_teli;
   
   assign JoB = ~B;
   

   mux2ne1 muxB(B, JoB, BInvert, mB);
 
   assign dhe_teli = A & mB;
   assign ose_teli = A | mB;
   assign XOR_teli = A ^ mB;
   assign slt_teli = A < mB ? 1 : 0;
   
   mbledhesi m1(A, mB, CIN, mb_teli, CarryOut);
   
    mux6ne1 MUX(dhe_teli, ose_teli, mb_teli, slt_teli, XOR_teli, Less, Op, Result);
    
    
endmodule
