`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/04/2023 09:45:22 PM
// Design Name: 
// Module Name: mbledhesi
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


module mbledhesi(
    input A,
    input B,
    input CIN,
    output SUM,
    output COUT
    );
    
    assign SUM = A ^ B ^ CIN;
    assign COUT = CIN & A | CIN & B | A & B;
endmodule
