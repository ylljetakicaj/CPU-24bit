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


module ALU1b(
    input A,
    input B,
    input BInvert,
    input CIN,
    input Less,
    input [2:0] Operation,
    output Result,
    output COUT
    );
    
    wire JoB, mB, Dhe, Ose, Mbledhesi, XOR, sll_wire, slt_wire, mul_wire;
    
    assign JoB = ~B;
    
    mux2ne1 muxB(B, JoB , BInvert, mB);
    
    assign Dhe = A & mB;
    assign Ose = A | mB;   
    mbledhesi adder (A, mB, CIN, Mbledhesi, COUT); 
    assign XOR = A^mB;
    assign sll_wire=A; //me bo veq ket funksion
    assign slt_wire= A<mB? 1:0;
    assign mul_wire=A*mB;
    mux8ne1( Dhe, Ose, Mbledhesi, XOR, sll_wire, slt_wire, mul_wire, Less, Operation, Result);
    
endmodule
