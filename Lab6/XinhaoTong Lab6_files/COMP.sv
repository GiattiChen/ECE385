module COMP_5(	input logic[10:0] IN,
					output logic[15:0] OUT
);

always_comb
	begin
		OUT[10:0] = IN[10:0];
		if (IN[10])
			OUT[15:11] = 5'b11111;
		else
			OUT[15:11] = 5'b00000;
	end
endmodule

module COMP_7(	input logic[8:0] IN,
					output logic[15:0] OUT
);

always_comb
	begin
		OUT[8:0] = IN[8:0];
		if (IN[8])
			OUT[15:9] = 7'b1111111;
		else
			OUT[15:9] = 7'b0000000;
	end
endmodule

module COMP_10(	input logic[5:0] IN,
					output logic[15:0] OUT
);

always_comb
	begin
		OUT[5:0] = IN[5:0];
		if (IN[5])
			OUT[15:6] = 10'b1111111111;
		else
			OUT[15:6] = 10'b0000000000;
	end
endmodule

module COMP_11(	input logic[4:0] IN,
					output logic[15:0] OUT
);

always_comb
	begin
		OUT[4:0] = IN[4:0];
		if (IN[4])
			OUT[15:5] = 11'b11111111111;
		else
			OUT[15:5] = 11'b00000000000;
	end
endmodule
