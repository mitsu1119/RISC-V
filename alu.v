module ALU(ALUOp, Read_data_1, Read_data_2, ALUResult, Zero);
	input [3:0] ALUOp;
	input [63:0] Read_data_1, Read_data_2;
	output reg [63:0] ALUResult;
	output Zero;

	always @(*) begin
		case (ALUOp)
			4'b0000 : ALUResult = Read_data_1 & Read_data_2;
			4'b0001 : ALUResult = Read_data_1 | Read_data_2;
			4'b0010 : ALUResult = Read_data_1 + Read_data_2;
			4'b0110 : ALUResult = Read_data_1 - Read_data_2;
			default : ALUResult = 0;
		endcase
	end

	assign Zero = (ALUResult == 64'b0);

endmodule
