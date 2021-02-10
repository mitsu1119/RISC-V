module Control(opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
	input [6:0] opcode;
	output Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
	output [1:0] ALUOp;

	reg [7:0] ct;

	assign {ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = ct;

	always @(*)
		case (opcode)
			7'b0110011 : ct = 8'b00100010;	// R-type
			7'b0000011 : ct = 8'b11110000;	// I-type (load)
			7'b0100011 : ct = 8'b10001000;	// S-type (store)
			7'b1100011 : ct = 8'b00000101;	// B-type (beq)
			default : ct = 8'bxxxxxxxx;
		endcase
endmodule
