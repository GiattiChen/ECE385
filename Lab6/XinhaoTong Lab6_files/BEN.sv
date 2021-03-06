module BEN(	input logic Clk, N, Z, P, LD_BEN,
				input logic[2:0] IR11_9,
				output logic BEN
);

always_ff @ (posedge Clk)
	begin
		if(LD_BEN)
			BEN <= (P&IR11_9[0]) | (Z&IR11_9[1]) | (N&IR11_9[2]);
	end
endmodule
