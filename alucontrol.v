module ALUcontrol(ALUOp, funct3, funct7, ALUco);
	input [1:0] ALUOp;
	input [2:0] funct3;
	input [6:0] funct7;
	output reg [3:0] ALUco;

	wire [10:0] funct = {funct3[2:0], funct7[6:0]};

	always @(*)
		case (ALUOp)
			2'b00 : ALUco = 4'b0010;	// load, store
			2'b01 : ALUco = 4'b0110;	// beq
			default : case (funct)
					10'b0000000000 : ALUco = 4'b0010;	// add
					10'b0100000000 : ALUco = 4'b0110;	// sub
					10'b0000000111 : ALUco = 4'b0000;	// and
					10'b0000000110 : ALUco = 4'b0001;	// or
					default : ALUco = 4'bxxxx;
			endcase
		endcase
endmodule

