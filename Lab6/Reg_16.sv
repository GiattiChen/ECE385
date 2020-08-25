
module reg_16 (input  logic Clk, Reset, Shift_In, Load, Shift_En,
              input  logic [15:0]  D,
              output logic Shift_Out,
              output logic [15:0]  Data_Out);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= 16'h0000;
		 else if (Load)
			  Data_Out <= D;
		 else if (Shift_En)
		 begin
			  //concatenate shifted in data to the previous left-most 3 bits
			  //note this works because we are in always_ff procedure block
			  Data_Out <= { Shift_In, Data_Out[15:1] }; 
	    end
    end
	
    assign Shift_Out = Data_Out[0];

endmodule