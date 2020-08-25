module lab5_toplevel (input logic   Clk,     // Internal
                                Reset,   // Push button 0
                                Run,   // Push button 1
                                ClearA_LoadB,   // Push button 2
                  input  logic [7:0]  S,     // input data
						output logic 		  X,
                  output logic [7:0]  Aval,    // DEBUG
                                Bval,
						output logic [6:0]  AhexL,
                                AhexU,
                                BhexL,
                                BhexU);
			
										  
										  
	 // local logic variables go here
	 logic Reset_SH, Run_SH, ClearA_LoadB_SH;
	 
	 logic fn, Shift_En, Cl_A, Ld_A, Ld_B, Cl_X, Ld_X;
	 logic A_0,M,X_local,X_temp;
	 
	 logic [7:0] A,B,S_local,A_temp;
//	 always_comb
//	 begin
//		AA = A;
//		BB = B;
//	 end
	 // use assign 
	 
	 assign 	Aval = A;
	 assign 	Bval = B;
	 assign	X = X_local;

	 
		

	 
	 // Instantiation of modules here, haven't assign inputs and outputs.
	 
	 control				control_unit(
								.Clk(Clk), 
								.Reset(Reset_SH),
								.ClearA_LoadB(ClearA_LoadB_SH), 
								.Run(Run_SH), 
								.M(B[0]),
								// following are output from control unit
								//note these are inferred assignments, because of the existence a logic variable 
								.fn, 
								.Shift_En, 
								.Cl_A, 
								.Ld_A, 
								.Ld_B, 
								.Cl_X, 
								.Ld_X);

    reg_8            reg_A(
								.Clk(Clk), 
								.Reset(Cl_A),      // a reset --> A
								.Shift_In(X_local), 
								.Load(Ld_A), 
								.Shift_En,
                        .D(A_temp),
								.Shift_Out(A_0),
								.Data_Out(A));
								
    reg_8            reg_B(
								.Clk(Clk), 
								.Reset(Reset_SH),  // b reset?
								.Shift_In(A_0), 
								.Load(Ld_B), 
								.Shift_En,
                        .D(S_local),
								.Shift_Out(M),
								.Data_Out(B));
								
	
	 adder_subtractor ADD_SUB9_unit(
								.A(A),
								.B(S_local),
								.fn,
								.S({X_temp,A_temp}));
								
								
	 Dreg 				Dreg_unit(
								.Clk, 
								.Load(Ld_X), 
								.Reset(Cl_X), 
								.D(X_temp),
								.Q(X_local));
								
	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );
								
	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );	
	 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(BhexU) );
//	 register_unit    reg_unit (
//                        .Clk(Clk),
//                        .Reset(Reset_SH),
//						    	  .A_In(X_local),
//                        .B_In(A_0),
//                        .Ld_A,
//                        .Ld_B,
//                        .Shift_En,
//                        .D(S_local), 
//                        .A_out(A_0),
//                        .B_out(M),
//                        .A(A),
//                        .B(B) );
	
	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments						
	  // need to be modified							
	  sync button_sync[2:0] (Clk, {~Reset, ~Run, ~ClearA_LoadB}, {Reset_SH, Run_SH, ClearA_LoadB_SH});
	  sync Din_sync[7:0] (Clk, S, S_local);
	  

endmodule



//// example module from lab4, need to be commented
//

//module Processor (input logic   Clk,     // Internal
//                                Reset,   // Push button 0
//                                LoadA,   // Push button 1
//                                LoadB,   // Push button 2
//                                Execute, // Push button 3
//                  input  logic [7:0]  Din,     // input data
//                  input  logic [2:0]  F,       // Function select
//                  input  logic [1:0]  R,       // Routing select
//                  output logic [3:0]  LED,     // DEBUG
//                  output logic [7:0]  Aval,    // DEBUG
//                                Bval,    // DEBUG
//                  output logic [6:0]  AhexL,
//                                AhexU,
//                                BhexL,
//                                BhexU);
//
//	 //local logic variables go here
//	 logic Reset_SH, LoadA_SH, LoadB_SH, Execute_SH;
//	 logic [2:0] F_S;
//	 logic [1:0] R_S;
//	 logic Ld_A, Ld_B, newA, newB, opA, opB, bitA, bitB, Shift_En,
//	       F_A_B;
//	 logic [7:0] A, B, Din_S;
//	 
//	 
//	 //We can use the "assign" statement to do simple combinational logic
//	 assign Aval = A;
//	 assign Bval = B;
//	 assign LED = {Execute_SH,LoadA_SH,LoadB_SH,Reset_SH}; //Concatenate is a common operation in HDL
//	 
//	 //Instantiation of modules here
//	 register_unit    reg_unit (
//                        .Clk(Clk),
//                        .Reset(Reset_SH),
//                        .Ld_A, //note these are inferred assignments, because of the existence a logic variable of the same name
//                        .Ld_B,
//                        .Shift_En,
//                        .D(Din_S),
//                        .A_In(newA),
//                        .B_In(newB),
//                        .A_out(opA),
//                        .B_out(opB),
//                        .A(A),
//                        .B(B) );
//    compute          compute_unit (
//								.F(F_S),
//                        .A_In(opA),
//                        .B_In(opB),
//                        .A_Out(bitA),
//                        .B_Out(bitB),
//                        .F_A_B );
//    router           router (
//								.R(R_S),
//                        .A_In(bitA),
//                        .B_In(bitB),
//                        .A_Out(newA),
//                        .B_Out(newB),
//                        .F_A_B );
//	 control          control_unit (
//                        .Clk(Clk),
//                        .Reset(Reset_SH),
//                        .LoadA(LoadA_SH),
//                        .LoadB(LoadB_SH),
//                        .Execute(Execute_SH),
//                        .Shift_En,
//                        .Ld_A,
//                        .Ld_B );
//	 HexDriver        HexAL (
//                        .In0(A[3:0]),
//                        .Out0(AhexL) );
//	 HexDriver        HexBL (
//                        .In0(B[3:0]),
//                        .Out0(BhexL) );
//								
//	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
//	 HexDriver        HexAU (
//                        .In0(A[7:4]),
//                        .Out0(AhexU) );	
//	 HexDriver        HexBU (
//                       .In0(B[7:4]),
//                        .Out0(BhexU) );
//								
//	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
//	  //These are array module instantiations
//	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
//	  //Note: We can invert the levels inside the port assignments
//	  sync button_sync[3:0] (Clk, {~Reset, ~LoadA, ~LoadB, ~Execute}, {Reset_SH, LoadA_SH, LoadB_SH, Execute_SH});
//	  sync Din_sync[7:0] (Clk, Din, Din_S);
//	  sync F_sync[2:0] (Clk, F, F_S);
//	  sync R_sync[1:0] (Clk, R, R_S);
//	  
//endmodule
