module carry_lookahead_adder
(
    input   logic[7:0]     A,
    input   logic[7:0]     B,
    output  logic[8:0]     Sum
);

    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  logic C4;
	  logic Pg0, Pg4;
	  logic Gg0, Gg4;
	  
	  always_comb
	  begin
	  C4 = Gg0 | (0&Pg0);
	  Sum[8] = Gg4 | (Gg0&Pg4) | (0&Pg0&Pg4);
	  end
	  
	  
	  four_bit_cla F0(.x(A[3:0]), .y(B[3:0]), .cin(0), .s(Sum[3:0]), .Pg(Pg0), .Gg(Gg0));
	  four_bit_cla F1(.x(A[7:4]), .y(B[7:4]), .cin(C4), .s(Sum[7:4]), .Pg(Pg4), .Gg(Gg4));
	  
endmodule



module four_bit_cla
(
	input [3:0] x,
	input [3:0] y,
	input cin,
	output logic[3:0] s,
	output logic Pg,
	output logic Gg
);
	logic g0, g1, g2, g3;
	logic p0, p1, p2, p3;
	logic c1, c2, c3;
	
	always_comb
	begin
	c1 = (cin&p0) | g0;
	c2 = (cin&p0&p1) | (g0&p1) | g1;
	c3 = (cin&p0&p1&p2) | (g0&p1&p2) | (g1&p2) | g2;
	end
	
	full_adder1 f0(.x(x[0]), .y(y[0]), .cin(cin), .p(p0), .g(g0), .s(s[0]));
	full_adder1 f1(.x(x[1]), .y(y[1]), .cin(c1), .p(p1), .g(g1), .s(s[1]));
	full_adder1 f2(.x(x[2]), .y(y[2]), .cin(c2), .p(p2), .g(g2), .s(s[2]));
	full_adder1 f3(.x(x[3]), .y(y[3]), .cin(c3), .p(p3), .g(g3), .s(s[3]));
	
	assign Pg = p0&p1&p2&p3;
	assign Gg = g3 | (g2&p3) | (g1&p2&p3) | (g0&p1&p2&p3);
	 
endmodule


module full_adder1
(
	input x,
	input y,
	input cin,
	output p,
	output g,
	output s 
);
	assign g = x&y;
	assign p = x^y;
	assign s = x^y^cin;


endmodule