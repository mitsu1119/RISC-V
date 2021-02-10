`include "control.v"
`include "alucontrol.v"

module ControlUnits(Instruction, Zero, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUCo, PCSrc);
	input [31:0] Instruction;
	input Zero;
	output MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, PCSrc;
	output [3:0] ALUCo;

	wire Branch;
	wire [1:0] ALUOp;

	Control control(Instruction[6:0], Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	ALUcontrol alu_control(ALUOp, Instruction[14:12], Instruction[31:25], ALUCo);

	assign PCSrc = Branch & Zero;
endmodule
