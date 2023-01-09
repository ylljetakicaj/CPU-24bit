`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 06:30:35 PM
// Design Name: 
// Module Name: DataPath
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


module DataPath(
input Clock, //Hyrje nga CPU - Teli CPU_IN_1
input RegDst, Branch, MemRead,
MemWrite, RegWrite, MemToReg, ALUSrc, //Hyrjet nga CU - Telat CU_OUT_X
input[1:0] ALUOp, //Hyrjet nga CU - Telat CU_OUT_X 
output [3:0] opcode,
output Dalja
);

reg[23:0] pc_initial; // Regjistri PC
wire[23:0] pc_next, pc4, pcbeq; //Telat: T1, T2, T3
wire[23:0] instruction; //Teli T5
wire[3:0] mux_regfile; //Teli T6
wire[23:0] readData1, readData2, writeData, //Telat T7-T9
mux_ALU, ALU_Out, Zgjerimi, memToMux, //Telat T10-T13
shifter2beq, branchAdderToMux, beqAddress; //Telat T14-T18
wire[3:0] ALUCtrl; //Teli T19
wire zerof, overflow, carryout; //Telat T20-T22
wire andMuxBranch; //Teli T23

initial
begin
    pc_initial = 24'd10; //Inicializimi fillesat i PC ne adresen 10
end

always@(posedge Clock)
begin
    pc_initial <= pc_next; //Azhurimi i PC ne cdo teh pozitiv me adresen e ardhshme
end

//T2 - PC rritet per 3 (ne sistemet 24 biteshe) per te gjitha instruksionet pervec BEQ
assign pc4 = pc_initial + 3;

//T14 - pergatitja e adreses per kercim ne BEQ (164 bit si MSB, 12 bit nga pjesa imediate, 1 bit shtyrje majtas (x2)
wire[23:0] shifter2beq1;
assign shifter2beq1 = {{11{instruction[11]}}, instruction[11:0], 1'b0};
assign shifter2beq = shifter2beq1 + shifter2beq1;

// Instr mem // inicializimi i IM (PC adresa hyrje, teli instruction dalje)
InstructionMemory IM(pc_initial, instruction);

//T6 - Percaktimi nese RD eshte RD (te R-formati) apo RD = RT (te I - formati) 
assign mux_regfile = (RegDst == 1'b1) ? instruction[11:8] : instruction[15:12];

//T12 - Zgjerimi nga 12 ne 24-bit - 12 bit si MSB dhe pjesa e instruction[11:0]
assign Zgjerimi = {{12{instruction[11]}}, instruction[11:0]};

//REGFILE 
//Inicializimi i RF(RS, RT, T6(RD[RD=RD || RD=RT]), T9, CU_OUT_X, CPU_IN_1, T7, T8)
RegisterFile RF(instruction[19:16], instruction[15:12], mux_regfile, writeData, RegWrite, Clock, readData1, readData2);

//T10 - Percaktimi nese hyrja e MUX-it M2 para ALU eshte Regjistri 2 i RF apo vlera imediate e funksionit
assign mux_ALU = (ALUSrc == 1'b1) ? Zgjerimi : readData2;

//inicializimi i ALU Control (CU_OUT_X, Function Code nga R-formati, Opcode, T19)
ALUControl AC(ALUOp, instruction[3:0], instruction[23:20], ALUCtrl);

//inicializimi i ALU(T7, T10, T19[3], T19[2], T19[1:0], T20, T11, T21, T22)
ALU24b ALU(readData1, mux_ALU, ALUCtrl[3], ALUCtrl[2:0], zerof, ALU_Out, overflow, carryout);

//inicializimi i Data Memory (T11, T8, CU_OUT_X, CU_OUT_X, CPU_IN_1, T13)
DataMemory DM(ALU_Out, readData2, MemWrite, MemRead, Clock, memToMux);

//T9 - teli qe i dergon te dhenat nga MUX - M3 ne Regfile
assign writeData = (MemToReg == 1'b1) ? memToMux : ALU_Out;

//T23 - Teli qe del nga porta DHE (shikon nese plotesohet kushti per BEQ)
assign andMuxBranch = zerof & Branch;

//T17 - Teli qe mban adresen ne te cilen do te kercej programi kur kushti BEQ plotesohet
assign beqAddres = pc4 + shifter2beq;

//T3 - Teli qe del nga MUX M4 
assign pcbeq = (andMuxBranch == 1'b1) ? beqAddress : pc4;

//Teli D_OUT_1 qe i dergohet CU
assign opcode = instruction[23:20];

assign Dalja=ALU_Out;

endmodule
