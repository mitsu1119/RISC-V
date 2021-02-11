`include "datapath.v"
`include "control_units.v"

module RISCV(clk, reset, Instruction, Read_data, Write_data, ALUResult, pc, MemRead, MemWrite);
	input clk, reset;
	input [31:0] Instruction;
	output [63:0] pc;
	wire PCSrc;

	wire RegWrite, MemtoReg, ALUSrc;
	input [63:0] Read_data;
	output [63:0] Write_data;

	wire Zero;
	wire [3:0] ALUCo;
	output [63:0] ALUResult;
	output MemRead, MemWrite;

	ControlUnits cu(Instruction, Zero, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUCo, PCSrc);

	DataPath dp(clk, reset, Instruction, RegWrite, MemtoReg, ALUSrc, ALUCo, ALUResult, Write_data, Zero, pc, PCSrc, Read_data);
endmodule
