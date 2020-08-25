module control(input logic Clk, Reset, ClearA_LoadB, Run, M,
					output logic fn, Shift_En, Cl_A, Ld_A, Ld_B, Cl_X, Ld_X);
	 enum logic [4:0] {A,B0,B1,C0,C1,D0,D1,E0,E1,F0,F1,G0,G1,H0,H1,I0,I1,J}	curr_state, next_state;
	 
	 //updates flip flop, current state is the only one
	 always_ff @ (posedge Clk)
	 begin
		  if (Reset)
				curr_state <= A;
		  else 
				curr_state <= next_state;
	 end
	 
	 // Assign outputs based on state
	 always_comb
		begin
		
		   next_state = curr_state; //default
			case (curr_state)
				A:		 if (Run)
							begin
							  next_state = B0;
							end
//						 else 
//							  next_state = A;
				B0:	 next_state = B1;
				B1:	 next_state = C0;
				C0:	 next_state = C1;
				C1:	 next_state = D0;
				D0:	 next_state = D1;
				D1:	 next_state = E0;
				E0:	 next_state = E1;
				E1:	 next_state = F0;
				F0:	 next_state = F1;
				F1:	 next_state = G0;
				G0:	 next_state = G1;
				G1:	 next_state = H0;
				H0:	 next_state = H1;
				H1:	 next_state = I0;
				I0:	 next_state = I1;
				I1:	 next_state = J;
				J : 	 if (~Run)
								next_state = A;
//						 else 
//								next_state = J;

			endcase
			
			case (curr_state)
				A:
				begin
					// clear XA and load B when Clear_Load is high
					Cl_A = 1'b1;
					Cl_X = 1'b1;
//               Cl_A = ClearA_LoadB;
					Ld_A = 1'b0;
               Ld_B = ClearA_LoadB;
//					Cl_X = ClearA_LoadB;
					Ld_X = 1'b0;
               Shift_En = 1'b0;
					fn = 0;
		      end			
				B0, C0, D0, E0, F0, G0, H0:
				begin
					if (M == 1)
						begin 
							// load XA from the result of the adder (the adder is always working, M decides whether to take the result from adder)
							Cl_A = 1'b0;
							Ld_A = 1'b1;
							Ld_B = 1'b0;
							Cl_X = 1'b0;
							Ld_X = 1'b1;
							Shift_En = 1'b0;
							fn = 0;
						end
					else 
						begin
							// do nothing, just go to the next state(shift)
							Cl_A = 1'b0;
							Ld_A = 1'b0;
							Ld_B = 1'b0;
							Cl_X = 1'b0;
							Ld_X = 1'b0;
							Shift_En = 1'b0;
							fn = 0;
						end
				end
				// SHIFT situation 
				B1, C1, D1, E1, F1, G1, H1:
				begin
					Cl_A = 1'b0;
					Ld_A = 1'b0;
               Ld_B = 1'b0;
					Cl_X = 1'b0;
					Ld_X = 1'b0;
               Shift_En = 1'b1;
					fn = 0;
				end
				// the MSB bit from the multiplier, decide whether to ADD or SUB, change (fn)
				I0:
				begin
					if (M == 1) 
						begin 
							// load XA from the result of the adder (the adder is always working, M decides whether to take the result from adder)
							Cl_A = 1'b0;
							Ld_A = 1'b1;
							Ld_B = 1'b0;
							Cl_X = 1'b0;
							Ld_X = 1'b1;
							Shift_En = 1'b0;
							fn = 1;
						end
					else 
						begin
							// do nothing, just go to the next state(shift)
							Cl_A = 1'b0;
							Ld_A = 1'b0;
							Ld_B = 1'b0;
							Cl_X = 1'b0;
							Ld_X = 1'b0;
							Shift_En = 1'b0;
							fn = 0;
						end
				end
				I1:
				begin
					Cl_A = 1'b0;
					Ld_A = 1'b0;
               Ld_B = 1'b0;
					Cl_X = 1'b0;
					Ld_X = 1'b0;
               Shift_En = 1'b1;
					fn = 0;
				end
				J:
				begin
					Cl_A = 1'b0;
					Ld_A = 1'b0;
					Ld_B = 1'b0;
					Cl_X = 1'b0;
					Ld_X = 1'b0;
					Shift_En = 1'b0;
					fn = 0;
				end
			endcase
		end
endmodule

			
//// example module from lab4, need to be commented	
//
////Two-always example for state machine
//
//module control (input  logic Clk, Reset, LoadA, LoadB, Execute,
//                output logic Shift_En, Ld_A, Ld_B );
//
//    // Declare signals curr_state, next_state of type enum
//    // with enum values of A, B, ..., F as the state values
//	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
//    enum logic [3:0] {A, B, C, D, E, F, BB,CC,DD,EE}   curr_state, next_state; 
//
//	//updates flip flop, current state is the only one
//    always_ff @ (posedge Clk)  
//    begin
//        if (Reset)
//            curr_state <= A;
//        else 
//            curr_state <= next_state;
//    end
//
//    // Assign outputs based on state
//	always_comb
//    begin
//        
//		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
//        unique case (curr_state) 
//
//            A :    if (Execute)
//                       next_state = B;
//            B :    next_state = BB;
//				
//            BB:    next_state = C;
//            C :    next_state = CC;
//            CC:    next_state = D;
//				D :    next_state = DD;
//            DD:    next_state = E;
//            E :    next_state = EE;
//				EE:    next_state = F;
//				
//            F :    if (~Execute) 
//                       next_state = A;
//							  
//        endcase
//   
//		  // Assign outputs based on ‘state’
//        case (curr_state) 
//	   	   A: 
//	         begin
//                Ld_A = LoadA;
//                Ld_B = LoadB;
//                Shift_En = 1'b0;
//		      end
//	   	   F: 
//		      begin
//                Ld_A = 1'b0;
//                Ld_B = 1'b0;
//                Shift_En = 1'b0;
//		      end
//	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
//		      begin 
//                Ld_A = 1'b0;
//                Ld_B = 1'b0;
//                Shift_En = 1'b1;
//		      end
//        endcase
//    end
//
//endmodule
