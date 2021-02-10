`include "registers.v"
`include "alu.v"
`include "immgen.v"

module DataPath(clk, reset, Instruction, RegWrite, MemtoReg, ALUSrc, ALUOp, ALUResult, Read_data_2, Zero, pc, PCSrc, Read_data);
	input clk, reset, PCSrc;
	input [31:0] Instruction;
	input [63:0] Read_data;
	output reg [63:0] pc;
	wire [63:0] pcnext, pcplus4, pcBranch, result;

	output [63:0] Read_data_2;
	wire [63:0] Read_data_1, Write_data, imm_or_reg_data;

	input RegWrite, ALUSrc, MemtoReg;
	input [3:0] ALUOp;
	output [63:0] ALUResult;
	output Zero;

	wire [63:0] imm, imm_shifted;

	ImmGen immgen(Instruction, imm);

	assign imm_shifted = {imm[62:0], 1'b0};
	
	assign pcBranch = pc + imm_shifted;

	assign pcplus4 = pc + 64'b100;

	assign pcnext = PCSrc ? pcBranch : pcplus4;

	always @(posedge clk, posedge reset)
		if(reset) pc <= 0;
		else pc <= pcnext;
	
	Registers registers(clk, Instruction[19:15], Instruction[24:20], RegWrite, Instruction[11:7], Write_data, Read_data_1, Read_data_2);

	assign imm_or_reg_data = ALUSrc ? imm : Read_data_2;	

	ALU alu(ALUOp, Read_data_1, imm_or_reg_data, ALUResult, Zero);

	assign result = MemtoReg ? Read_data : ALUResult;

endmodule
