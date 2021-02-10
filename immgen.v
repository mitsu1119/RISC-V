// sign extend
module ImmGen(Instruction, imm);
	input [31:0] Instruction;
	output reg [63:0] imm;

	// opcode = Instruction[6:0]
	always @(*) begin
		case (Instruction[6:0])
			7'b0000011 : imm = {{53{Instruction[31]}}, Instruction[30:20]};		// I-type (load)
			7'b0100011 : imm = {{53{Instruction[31]}}, Instruction[30:25], Instruction[11:7]};	// S-type (store)
			7'b1100011 : imm = {{53{Instruction[31]}}, Instruction[7], Instruction[30:25], Instruction[11:8]};	// B-type (beq)
			default : imm = 64'hxxxxxxxxxxxxxxxx;
		endcase
	end
endmodule
