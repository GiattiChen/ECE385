module NZP(	input logic Clk, N_in, Z_in, P_in, LD_CC,
				output logic N_out, Z_out, P_out
);

always_ff @(posedge Clk)
	begin
		if(LD_CC)
			begin
				N_out <= N_in;
				Z_out <= Z_in;
				P_out <= P_in;
			end
	end
endmodule
