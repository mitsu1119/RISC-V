`include "control_units.v"
`include "datapath.v"

module riscv(clk, reset, pc, Instruction, MemWrite, ALUResult, Write_data, Read_data);
	input clk, reset;
	output [63:0] pc;

	input [31:0] Instruction;
	output MemWrite;
	output [63:0] ALUResult, Write_data;
	input [63:0] Read_data;

	wire MemtoReg, PCSrc, Zero, ALUSrc, RegWrite;
	wire [3:0] ALUCo;

	ControlUnits ctu(Instruction, Zero, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite, ALUCo, PCSrc);

	DataPath dp(clk, reset, Instruction, RegWrite, MemtoReg, ALUSrc, ALUCo, ALUResult, Write_data, Zero, pc, PCSrc, Read_data);

endmodule
