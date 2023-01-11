`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2023 08:38:24 PM
// Design Name: 
// Module Name: RegisterFileTEST
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


module RegisterFileTEST();

reg[3:0] RS, RT, RD;
reg[23:0]  WriteData; 
reg RegWrite, Clock;
wire[23:0] ReadRS, ReadRT;

initial
begin
#0 Clock=1'b0;
#5 RD=4'd2; WriteData = 24'd5; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite = 1'b0;
#5 RD=4'd3; WriteData = 24'd7; RegWrite=1'b1;
#5 Clock=1'b1;
#5 Clock=1'b0; RegWrite=1'b0;
#5 RS=4'd2; RT=4'd3;
#5 $stop;

end
RegisterFile RF(RS, RT, RD, WriteData, RegWrite, Clock, ReadRS, ReadRT);
endmodule
