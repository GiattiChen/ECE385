/************************************************************************
Avalon-MM Interface for AES Decryption IP Core

Dong Kai Wang, Fall 2017

For use with ECE 385 Experiment 9
University of Illinois ECE Department

Register Map:

 0-3 : 4x 32bit AES Key
 4-7 : 4x 32bit AES Encrypted Message
 8-11: 4x 32bit AES Decrypted Message
   12: Not Used
	13: Not Used
   14: 32bit Start Register
   15: 32bit Done Register

************************************************************************/
//logic [31:0] AES_KEY0;
//logic [31:0] AES_KEY1;
//logic [31:0] AES_KEY2;
//logic [31:0] AES_KEY3;
//
//logic [31:0] AES_MSG_EN0;
//logic [31:0] AES_MSG_EN1;
//logic [31:0] AES_MSG_EN2;
//logic [31:0] AES_MSG_EN3;
//
//logic [31:0] AES_MSG_DE0;
//logic [31:0] AES_MSG_DE1;
//logic [31:0] AES_MSG_DE2;
//logic [31:0] AES_MSG_DE3;
//
//logic [31:0] blank0;
//logic [31:0] blank1;
//
//logic [31:0] AES_START;
//logic [31:0] AES_DONE;

module avalon_aes_interface (
	// Avalon Clock Input
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,						// Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,		// Avalon-MM Byte Enable
	input  logic [3:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit
	output logic [31:0] EXPORT_DATA		// Exported Conduit Signal to LEDs
);


logic [15:0][31:0] Reg_Array;
logic [3:0][31:0] Reg_temp; // store data for Reg_Array[8:11] temporarily
logic done;


AES AES_inst(.CLK(CLK),
				 .RESET(RESET),
				 .AES_START(Reg_Array[14][0]),
				 .AES_DONE(done),
				 .AES_KEY({Reg_Array[0][31:0],Reg_Array[1][31:0],Reg_Array[2][31:0],Reg_Array[3][31:0]}),
				 .AES_MSG_ENC({Reg_Array[4][31:0],Reg_Array[5][31:0],Reg_Array[6][31:0],Reg_Array[7][31:0]}),
				 .AES_MSG_DEC({Reg_temp[0][31:0],Reg_temp[1][31:0],Reg_temp[2][31:0],Reg_temp[3][31:0]}));

	
assign DATA_EXPORT = {Reg_Array[4][31:16], Reg_Array[7][15:0]};



always_ff @ (posedge CLK)
begin
	if (AVL_CS)
	begin
		if (RESET)
			begin
				// clear all registers
				Reg_Array[0] <= 32'b0;
				Reg_Array[1] <= 32'b0;
				Reg_Array[2] <= 32'b0;
				Reg_Array[3] <= 32'b0;
				Reg_Array[4] <= 32'b0;
				Reg_Array[5] <= 32'b0;
				Reg_Array[6] <= 32'b0;
				Reg_Array[7] <= 32'b0;
				Reg_Array[8] <= 32'b0;
				Reg_Array[9] <= 32'b0;
				Reg_Array[10] <= 32'b0;
				Reg_Array[11] <= 32'b0;
				Reg_Array[12] <= 32'b0;
				Reg_Array[13] <= 32'b0;
				Reg_Array[14] <= 32'b0;
				Reg_Array[15] <= 32'b0;
			end
		else if (AVL_WRITE)
			begin
				case (AVL_BYTE_EN)
					4'b1111:
						Reg_Array[AVL_ADDR]<= AVL_WRITEDATA[31:0];
					4'b1100:
						Reg_Array[AVL_ADDR]<= {AVL_WRITEDATA[31:16],Reg_Array[AVL_ADDR][15:0]};
					4'b0011:
						Reg_Array[AVL_ADDR]<= {Reg_Array[AVL_ADDR][31:16],AVL_WRITEDATA[15:0]};
					4'b1000:
						Reg_Array[AVL_ADDR]<= {AVL_WRITEDATA[31:24],Reg_Array[AVL_ADDR][23:0]};
					4'b0100:
						Reg_Array[AVL_ADDR]<= {Reg_Array[AVL_ADDR][31:24],AVL_WRITEDATA[23:16],Reg_Array[AVL_ADDR][15:0]};
					4'b0010:
						Reg_Array[AVL_ADDR]<= {Reg_Array[AVL_ADDR][31:16],AVL_WRITEDATA[15:8],Reg_Array[AVL_ADDR][7:0]};
					4'b0001:
						Reg_Array[AVL_ADDR]<= {Reg_Array[AVL_ADDR][31:8],AVL_WRITEDATA[7:0]};	
					default: 
						// do nothing
						Reg_Array[AVL_ADDR] <= Reg_Array[AVL_ADDR];
				endcase
			end
			
		else if (AVL_READ)
			begin 
			// required that readdata should have the value of the addressed register on the same cycle
				AVL_READDATA <= Reg_Array[AVL_ADDR];		
			end
	end
		
	if (done)
	begin
		Reg_Array[8][31:0] <=  Reg_temp[0];
		Reg_Array[9][31:0] <=  Reg_temp[1];
		Reg_Array[10][31:0] <=  Reg_temp[2];
		Reg_Array[11][31:0] <=  Reg_temp[3];
		Reg_Array[15][0] <= done;
			
	end
		
		
		// Not sure if need to consider the following two else cause to avoid latch
//		else
			//  if no read/write signal, do nothing
//			Reg_Array <= Reg_Array;
//	else
		// if not this chip, do nothing
//		Reg_Array <= Reg_Array;
end

endmodule
