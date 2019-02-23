/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    4-1 mux template
*/
module mux4_1(InA, InB, InC, InD, S, Out);
    input        InA, InB, InC, InD;
    input [1:0]  S;
    output       Out;

	wire A_B_sel, C_D_sel;

    // YOUR CODE HERE
	mux2_1 mux_A_B(.S(S[0]), .InA(InA), .InB(InB), .Out(A_B_sel));
	mux2_1 mux_C_D(.S(S[0]), .InA(InC), .InB(InD), .Out(C_D_sel));
	mux2_1 mux_out(.S(S[1]), .InA(A_B_sel), .InB(C_D_sel), .Out(Out));

endmodule
