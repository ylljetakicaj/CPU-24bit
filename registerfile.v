module RegisterFile(
input wire[3:0] RS,
input wire[3:0] RT,
input wire[3:0] RD,
input wire[23:0] WriteData,
input wire RegWrite,
input wire Clock,
output wire[23:0] ReadRS,
output wire[23:0] ReadRT
    );
    
reg[23:0] Registers[23:0];

//Reseto te gjithe regjistrat ne 0
integer i;
initial 
begin
for(i=0;i<23;i=i+1)
   Registers[i] <= 23'd0; 
end

//Shkruaj ne regjiter
always @(posedge Clock)
begin
Registers[RD] <= WriteData;
end

//lexo regjistrat ReadData1, ReadData2
assign ReadRS = Registers[RS];
assign ReadRT = Registers[RT];


endmodule
