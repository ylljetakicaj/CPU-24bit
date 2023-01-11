`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/11/2023 08:05:01 PM
// Design Name: 
// Module Name: ALU24TEST
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


module ALU24TEST(

    );
    reg [23:0] A;
    reg [23:0] B;       
    reg BNegate;
    reg [1:0] Op;
    wire Zero;
    wire [23:0] Result;
    wire Overflow;
    wire CarryOut;
    

initial
$monitor("A=%d, B=%d, BNegate=%b, Op=%b, Zero=%b, Result=%d, Overflow =%b, CarryOut=%b", A, B,  BNegate, Op, Zero, Result, CarryOut, Overflow);
initial
begin

//AND
#0 A=24'd10; B=24'd10; BNegate=24'b0; Op=2'b00;
#10 A=24'd40; B=24'd30; BNegate=24'b0; Op=2'b00;

//OR
#10 A=24'd5; B=24'd5; BNegate=24'b0; Op=2'b01;
#10 A=24'd6; B=24'd3; BNegate=24'b0; Op=2'b01;

//ADD
#10 A=24'd5; B=24'd5; BNegate=24'b0; Op=2'b10;
#10 A=24'd6; B=24'd3; BNegate=24'b0; Op=2'b10;

//SUB
#10 A=24'd5; B=24'd5; BNegate=24'b1; Op=2'b10;
#10 A=24'd6; B=24'd3; BNegate=24'b1; Op=2'b10;

//XOR
#10 A=24'd10; B=24'd20; BNegate=24'b0; Op=2'b10;
#10 A=24'd10; B=24'd40; BNegate=24'b0; Op=2'b10;

#10 $stop; 
$stop;
end
ALU24b ALU24(A, B, BNegate, Op, Zero, Result, Overflow, CarryOut);
endmodule
