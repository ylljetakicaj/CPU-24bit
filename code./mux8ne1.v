`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 07:43:15 PM
// Design Name: 
// Module Name: mux8ne1
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


module mux8ne1(
    input Hyrja0,
    input Hyrja1,
    input Hyrja2,
    input Hyrja3,
    input Hyrja4,
    input Hyrja5,
    input Hyrja6,
    input Hyrja7,
    input [2:0] S,
    output Dalja
    );
    
//s 000 H0
//s 010 H1
//s 011 H2
//s 100 H3
//s 101 H4
//s 100 H3
//s 001 H5
//s 111 H6
//s 110 H7

assign Dalja=S[2] ? (S[1]? (S[0] ? Hyrja4 : Hyrja7) : (S[0] ? Hyrja6 : Hyrja2)) : (S[1] ? (S[0] ? Hyrja3 : Hyrja1) : (S[0] ? Hyrja5 : Hyrja0));

endmodule
