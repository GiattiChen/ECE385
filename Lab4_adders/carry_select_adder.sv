module carry_select_adder
(
    input   logic[15:0]     A,
    input   logic[15:0]     B,
    output  logic[15:0]     Sum,
    output  logic           CO
);

    /* TODO
     *
     * Insert code here to implement a carry select.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
    logic C0;
	 logic C10,C11; // C10 is the C1_out result with the assumption that the previous Cin is 0
						 // C11 is the C1_out result with the assumption that the previous Cin is 1
	 logic C20,C21;
	 logic CO0,CO1;
	 
	 logic[3:0] sum10,sum11;
	 logic[3:0] sum20,sum21;
	 logic[3:0] sum30,sum31;
	 
	 logic C1,C2;
	 
	
    four_bit_cra FRA0 (.x(A[3 : 0]),.y(B[3 : 0]),.cin(0),.s(Sum[3 : 0]),.cout(C0));
	 
    four_bit_cra FRA10(.x(A[7 : 4]),.y(B[7 : 4]),.cin(0),.s(sum10[3:0]),.cout(C10));
	 four_bit_cra FRA11(.x(A[7 : 4]),.y(B[7 : 4]),.cin(1),.s(sum11[3:0]),.cout(C11));
	 
    four_bit_cra FRA20(.x(A[11: 8]),.y(B[11: 8]),.cin(0),.s(sum20[3:0]),.cout(C20));
	 four_bit_cra FRA21(.x(A[11: 8]),.y(B[11: 8]),.cin(1),.s(sum21[3:0]),.cout(C21));
	 
	 
    four_bit_cra FRA30(.x(A[15:12]),.y(B[15:12]),.cin(0),.s(sum30[3:0]),.cout(CO0));
	 four_bit_cra FRA31(.x(A[15:12]),.y(B[15:12]),.cin(1),.s(sum31[3:0]),.cout(CO1));


	 always_comb begin 
		if (C0 == 0) begin
				C1 = C10;
				Sum[7:4] = sum10[3:0];
		
		end else begin
				C1 = C11;
				Sum[7:4] = sum11[3:0];
		end
		
		if (C1 == 0) begin
				C2 = C20;
				Sum[11:8] = sum20[3:0];
		end else begin 
				C2 = C21;
				Sum[11:8] = sum21[3:0];
		end
		
		if (C2 == 0) begin
				CO = CO0;
				Sum[15:12] = sum30[3:0];
		end else begin
				CO = CO1;
				Sum[15:12] = sum31[3:0];
		end
	 end 

	 
endmodule


/*
module four_bit_cra(
						 input [3:0] x,
						 input [3:0] y,
						 input cin,
						 output logic [3:0] s,
						 output logic cout
						 );
	 logic c0,c1,c2;

	 full_adder fa0(.x(x[0]),.y(y[0]),.cin(cin),.s(s[0]),.cout(c0));
	 full_adder fa1(.x(x[1]),.y(y[1]),.cin(c0 ),.s(s[1]),.cout(c1));	 
	 full_adder fa2(.x(x[2]),.y(y[2]),.cin(c1 ),.s(s[2]),.cout(c2));
	 full_adder fa3(.x(x[3]),.y(y[3]),.cin(c2 ),.s(s[3]),.cout(cout));

						
endmodule
						 

module full_adder (
						 input x,
						 input y,
						 input cin,
						 output logic s,
						 output logic cout
						 );
						 
	 assign s	 = x ^ y ^ cin;
	 assign cout = (x&y) | (y&cin) | (x&cin);
	 
endmodule
*/