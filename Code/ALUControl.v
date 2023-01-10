`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 08:32:03 PM
// Design Name: 
// Module Name: ALUControl
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


module ALUControl(
input [1:0] ALUOp,
input [3:0] Funct,
input [3:0] opcode,
output reg [3:0] ALUCtrl
);

always @(ALUOp)
begin
case(ALUOp) // Pyet per vleren e ALUOp, 00-lw,sw; 01-beq,bne, 10-R-format, 11 - I-format
    2'b00: ALUCtrl = 4'b0100; //LW+SW (mbledhje)
    2'b01: ALUCtrl = 4'b1100; //BEQ+BNE (zbritje)
    2'b10: //R-Format
        case(Funct)
            4'b0000: ALUCtrl = 4'b0000; //AND
            4'b0001: ALUCtrl = 4'b0001; //OR
            4'b0010: ALUCtrl = 4'b0010; //ADD
            4'b0011: ALUCtrl = 4'b1010; //SUB
            4'b0100: ALUCtrl = 4'b0011;  //SLT
            4'b0110: ALUCtrl = 4'b0101;  //XOR
            4'b0111: ALUCtrl = 4'b0110;  //SLL
        endcase

    2'b11: //I-format
        case(opcode)
            4'b0110: ALUCtrl = 4'b0100; // per MUL
        endcase
endcase
end

endmodule
