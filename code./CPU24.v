`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 10:53:58 PM
// Design Name: 
// Module Name: CPU24
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

//Hyrje ne CPU - Clock CPU_IN_1
module CPU(input Clock);

//Telat e brendshem te CPU
wire[3:0] opcode; //D_OUT_1
//CU_OUT_X
wire RegDst, Branch, MemRead, MemWrite, RegWrite, MemToReg, ALUSrc;
wire[1:0] ALUOp;

//inicializimi i DataPath
DataPath DP
(
Clock,
RegDst, Branch, 
MemRead, MemWrite, 
RegWrite, MemToReg, 
ALUSrc, ALUOp, opcode
);

//Inicializimi i COntrol Unit
CU ControlUnit(
opcode,
RegDst,
Branch,
MemRead,
MemToReg,
ALUOp,
MemWrite,
ALUSrc,
RegWrite
);
endmodule
