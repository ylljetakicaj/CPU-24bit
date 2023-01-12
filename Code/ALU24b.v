`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/05/2023 07:56:31 PM
// Design Name: 
// Module Name: ALU24b
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


module ALU24b(
    input [23:0] A,
    input [23:0] B,
    input BNegate,
    input [1:0] Op,
    output Zero,
    output [23:0] Result,
    output Overflow,
    output CarryOut
    );
    
    wire [22:0] COUT;
    //LIDH 24 ALU 1-biteshe
    ALU1b ALU0(A[0], B[0], BNegate, BNegate, Result[15], Op, Result[0], COUT[0]);
    ALU1b ALU1(A[1], B[1], COUT[0], BNegate, 0, Op, Result[1], COUT[1]);
    ALU1b ALU2(A[2], B[2], COUT[1], BNegate, 0, Op, Result[2], COUT[2]);
	ALU1b ALU3(A[3], B[3], COUT[2], BNegate, 0, Op, Result[3], COUT[3]);
    ALU1b ALU4(A[4], B[4], COUT[3], BNegate, 0, Op, Result[4], COUT[4]);
    ALU1b ALU5(A[5], B[5], COUT[4], BNegate, 0, Op, Result[5], COUT[5]);
    ALU1b ALU6(A[6], B[6], COUT[5], BNegate, 0, Op, Result[6], COUT[6]);
    ALU1b ALU7(A[7], B[7], COUT[6], BNegate, 0, Op, Result[7], COUT[7]);
    ALU1b ALU8(A[8], B[8], COUT[7], BNegate, 0, Op, Result[8], COUT[8]);
    ALU1b ALU9(A[9], B[9], COUT[8], BNegate, 0, Op, Result[9], COUT[9]);
    ALU1b ALU10(A[10], B[10], COUT[9], BNegate, 0, Op, Result[10], COUT[10]);
    ALU1b ALU11(A[11], B[11], COUT[10], BNegate, 0, Op, Result[11], COUT[11]);
    ALU1b ALU12(A[12], B[12], COUT[11], BNegate, 0, Op, Result[12], COUT[12]);
    ALU1b ALU13(A[13], B[13], COUT[12], BNegate, 0, Op, Result[13], COUT[13]);
    ALU1b ALU14(A[14], B[14], COUT[13], BNegate, 0, Op, Result[14], COUT[14]);
    ALU1b ALU15(A[15], B[15], COUT[14], BNegate, 0, Op, Result[15], COUT[15]);
    ALU1b ALU16(A[16], B[16], COUT[15], BNegate, 0, Op, Result[16], COUT[16]);
    ALU1b ALU17(A[17], B[17], COUT[16], BNegate, 0, Op, Result[17], COUT[17]);
    ALU1b ALU18(A[18], B[18], COUT[17], BNegate, 0, Op, Result[18], COUT[18]);
    ALU1b ALU19(A[19], B[19], COUT[18], BNegate, 0, Op, Result[19], COUT[19]);
    ALU1b ALU20(A[20], B[20], COUT[19], BNegate, 0, Op, Result[20], COUT[20]);
    ALU1b ALU21(A[21], B[21], COUT[20], BNegate, 0, Op, Result[21], COUT[21]);
    ALU1b ALU22(A[22], B[22], COUT[21], BNegate, 0, Op, Result[22], COUT[22]);
    ALU1b ALU23(A[23], B[23], COUT[22], BNegate, 0, Op, Result[23], CarryOut);
    
    
    
assign Zero = ~(Result[0] | Result[1] | 
                Result[2] | Result[3] | 
                Result[4] | Result[5] | 
                Result[6] | Result[7] | 
                Result[8] | Result[9] | 
                Result[10] | Result[11] | 
                Result[12] | Result[13] | 
                Result[14] | Result[15] |
                Result[16] | Result[17] |
                Result[18] | Result[19] |
		Result[20] | Result[21] |
		Result[22] | Result[23] );
                    
    assign Overflow = COUT[22] ^ CarryOut;
    

endmodule
