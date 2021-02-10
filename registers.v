module Registers(clk, Read_register_1, Read_register_2, RegWrite, Write_register, Write_data, Read_data_1, Read_data_2);
	input [4:0] Read_register_1, Read_register_2, Write_register;
	input clk, RegWrite;
	input [63:0] Write_data;
	output [63:0] Read_data_1, Read_data_2;

	reg [63:0] registers[31:0];

	always @(posedge clk)
		if(RegWrite) registers[Write_register] = Write_data;

	// registers[0] = 0;  (constantly)
	assign Read_data_1 = (Read_register_1 == 0) ? 0 : registers[Read_register_1];
	assign Read_data_2 = (Read_register_2 == 0) ? 0 : registers[Read_register_2];

endmodule

