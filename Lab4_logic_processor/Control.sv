//Two-always example for state machine

module control (input  logic Clk, Reset, LoadA, LoadB, Execute,
                output logic Shift_En, Ld_A, Ld_B );

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	 // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    enum logic [3:0] {A, B, C, D, E, F, BB,CC,DD,EE}   curr_state, next_state; 

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
        
		  	//required because I haven't enumerated all possibilities below
        unique case (curr_state) 

            A :    if (Execute)
                       next_state = B;
            B :    next_state = BB;
				
            BB:    next_state = C;
            C :    next_state = CC;
            CC:    next_state = D;
				D :    next_state = DD;
            DD:    next_state = E;
            E :    next_state = EE;
				EE:    next_state = F;
				
            F :    if (~Execute) 
                       next_state = A;
				default: 
					next_state  = curr_state;
        endcase
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   A: 
	         begin
                Ld_A = LoadA;
                Ld_B = LoadB;
                Shift_En = 1'b0;
		      end
	   	   F: 
		      begin
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift_En = 1'b0;
		      end
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin 
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift_En = 1'b1;
		      end
        endcase
    end

endmodule
