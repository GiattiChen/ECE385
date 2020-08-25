module datapath (
	input logic Clk, Reset,
//	input logic [15:0] PC, 
	input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
	input logic GatePC, GateMDR, GateALU, GateMARMUX,
	input logic [1:0] PCMUX, ADDR2MUX, ALUK,
	input logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
	input logic MIO_EN,
	// the MDR_In is the output from the module MEM2IO: Data_to_CPU(MDR_In)
	input logic [15:0] MDR_In, 
	output logic [15:0] MAR, MDR, IR, PC,
	output logic [11:0] LED,
	output logic BEN
);

// here "local" means the temp data between MUX and REGISTER/BUS/MUX
logic [15:0] MDR_local, BUS, PC_next, PC_local;
logic [15:0] SR1val, SR2val; // corresponding values in register SR1 and SR2 (outputed from REG FILE)
logic N_in, Z_in, P_in;
logic N_out, Z_out, P_out;
logic [15:0] ALU_local, MARMUX_local, ADDR2MUX_local, ADDR1MUX_local, SR2MUX_local;

logic [15:0] COMP5, COMP7, COMP10, COMP11;
logic [2:0] SR1_IN, SR2_IN, DR_IN;


COMP_5  comp5 (.IN(IR[10:0]), .OUT(COMP5));
COMP_7  comp7 (.IN(IR[8:0]),  .OUT(COMP7));
COMP_10 comp10(.IN(IR[5:0]),  .OUT(COMP10));
COMP_11 comp11(.IN(IR[4:0]),  .OUT(COMP11));

//logic [15:0] IR_local;
//assign IR_local = IR;
//register_12 LED_reg(.Clk(Clk), .Reset(Reset), .Load(LD_LED), .data_in(IR_local[11:0]), .data_out(LED));

// set the main data BUS with 4-gate to select
// possible data: PC, MDR, ALUval, MARMUXval
bus_mux BUS_inst(.a0(PC), .a1(MDR), .a2(ALU_local), .a3(MARMUX_local), .s({GatePC, GateMDR, GateALU, GateMARMUX}), .out(BUS));

// Load the value of PC to MAR through BUS
register MAR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .data_in(BUS), .data_out(MAR));

// Load the value MDR from BUS or MDR_In
// before that, first select MDR through the mux controlled by MIO.EN, if 1, select Data_to_CPU(MDR_In)
mux2 MDR_mux(.a0(BUS), .a1(MDR_In), .s(MIO_EN), .out(MDR_local));
// then load it into register
register MDR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .data_in(MDR_local), .data_out(MDR));

// load MDR to IR
register IR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .data_in(BUS), .data_out(IR));

// PC <- PC + 1 and select PC
assign PC_next = PC + 16'b0000000000000001;
// change the value MARMUX_local and BUS ????
mux4 PC_mux(.a0(PC_next), .a1(BUS), .a2(MARMUX_local), .a3(16'b0), .s(PCMUX), .out(PC_local));
register PC_reg(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .data_in(PC_local), .data_out(PC));
		
//Added Parts for week2 
//-------------------------------------

// Address Calculating Part	
//ADDR2MUXval and ADDR1MUXval
mux4 addr2mux(.a0(16'h0), .a1(COMP10), .a2(COMP7), .a3(COMP5), .s(ADDR2MUX), .out(ADDR2MUX_local));
mux2 addr1mux(.a0(PC), .a1(SR1val), .s(ADDR1MUX), .out(ADDR1MUX_local));
//adder values from ADDR2MUXval and ADDR1MUXval
ALU Address_adder (.A(ADDR1MUX_local), .B(ADDR2MUX_local), .ALUK(2'b00), .OUT(MARMUX_local)); // set ALUK = 00 for ADD
		
// Register File Part
//Three mux to select for SR1, SR2 and DR
mux2_3bit SR1_in(.a0(IR[11:9]), .a1(IR[8:6]), .s(SR1MUX), .out(SR1_IN));
assign SR2_IN = IR[2:0];
mux2_3bit DR_in(.a0(IR[11:9]), .a1(3'b111), .s(DRMUX), .out(DR_IN));
//
		Reg_File regfile(.*, .LD_Reg(LD_REG), .SR1_in(SR1_IN), .SR2(SR2_IN), .DR_in(DR_IN), .In(BUS), .SR1_out(SR1val), .SR2_out(SR2val));
		
// SR2MUX and ALU Part
mux2 SR2_mux(.a0(SR2val), .a1(COMP11), .s(SR2MUX), .out(SR2MUX_local));
ALU Regiter_adder(.A(SR1val), .B(SR2MUX_local), .ALUK(ALUK), .OUT(ALU_local));

// BEN and NZP part
NZP nzp(.*); // module NZP(input logic Clk, N_in, Z_in, P_in, LD_CC, output logic N_out, Z_out, P_out);
BEN ben(.Clk(Clk), .N(N_out), .Z(Z_out), .P(P_out), .LD_BEN(LD_BEN), .IR11_9(IR[11:9]), .BEN(BEN));
		
		
// Set NZP
always_comb begin
			// if the first bit is 1, it is negative
			if (BUS[15]) begin
				N_in <= 1'b1;
				Z_in <= 1'b0;
				P_in <= 1'b0;
			end
			else begin
				case (BUS)
					16'b0:
						begin
							N_in <= 1'b0;
							Z_in <= 1'b1;
							P_in <= 1'b0;
						end
				default:
				begin
					N_in <= 1'b0;
					Z_in <= 1'b0;
					P_in <= 1'b1;
				end
				endcase
		  end
end
			
		

		
//load LED
always_ff @ (posedge Clk) begin
	if (LD_LED) begin
		LED <= IR[11:0];
	end else if (Reset)	begin
		LED <= 12'h0;
	end else LED <= LED;
end

		
endmodule 




// the module for register
// the register only controlled by the "Load", with no function of SHIFT
module register (input  logic Clk, Reset, Load,
              input  logic [15:0]  data_in,
              output logic [15:0]  data_out
);

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  data_out <= 16'h0000;
		 else if (Load)
			  data_out <= data_in;
    end
endmodule


// the module for bus_mux
module bus_mux
# (parameter width = 16)
(
	input logic  [width-1:0] a0,a1,a2,a3,
	input logic  [3:0] s,
	output logic [width-1:0] out
);
	always_comb begin
		case(s)
			4'b1000:
				out = a0;
			4'b0100:
				out = a1;
			4'b0010:
				out = a2;
			4'b0001:
				out = a3;
			default:
				out = 16'h0;
		endcase
	end

endmodule

// the module for mux2
// the model to use it: mux2 ****(.a0(), .a1(), .s(), .out());
module mux2
# (parameter width = 16)
(	
	input logic [width-1:0] a0, a1,
	input logic s,
	output logic [width-1:0] out
);
	always_comb begin
		case (s)
			1'b0:
				out = a0;
			1'b1:
				out = a1;
		endcase
	end
endmodule


// the module for mux2_3bit
// the model to use it: mux2_3bit ****(.a0(), .a1(), .s(), .out());
module mux2_3bit
# (parameter width = 3)
(	
	input logic [width-1:0] a0, a1,
	input logic s,
	output logic [width-1:0] out
);
	always_comb begin
		case (s)
			1'b0:
				out = a0;
			1'b1:
				out = a1;
		endcase
	end
endmodule


// the module for mux4
// the model to use it: mux4 ****(.a0(), .a1(), .a2(), .a4(), .s(), .out());
module mux4
# (parameter width = 16)
(
	input logic [width-1:0] a0, a1, a2, a3,
	input logic [1:0] s,
	output logic [width-1:0] out
);
	always_comb begin
		case (s)
			2'b00:
				out = a0;
			2'b01:
				out = a1;
			2'b10:
				out = a2;
			2'b11:
				out = a3;
		endcase
	end
endmodule












//module datapath(
//                      input logic Clk, Reset, 
//							 input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
//							 input logic GatePC, GateMDR, GateALU, GateMARMUX,
//							 input logic [1:0] PCMUX, ADDR2MUX, ALUK,
//							 input logic DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
//							 input logic [15:0] MDR_In,
//							 input logic MIO_EN,
//							 output logic [15:0] MAR, MDR, IR,
//							 output logic [11:0] LED,
//							 output logic BEN
//
//)
//
//
////	BUS_MUX BUSnew (.d0(PC), .d1(MDR), .d2(ALUval), .d3(MARMUXval), .s({GatePC, GateMDR, GateALU, GateMARMUX}), .y(BUS));
////	register MAR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .data_in(BUS), .data_out(MAR));
////		
////	mux2 mdrMUX(.d0(BUS), .d1(MDR_In), .s(MIO_EN), .y(MDRval));
////	register MDR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .data_in(MDRval), .data_out(MDR));
////
////	assign PCplus1 = PC+1;
////	register IR_reg(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .data_in(BUS), .data_out(IR));
////	mux4 pcmux(.d0(PCplus1), .d1(MARMUXval), .d2(BUS), .d3(16'b0), .s(PCMUX), .y(PCval));
////	register PC_reg(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .data_in(PCval), .data_out(PC));
//
//
//endmodule
