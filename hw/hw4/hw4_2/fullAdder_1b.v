/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 1-bit full adder
*/
module fullAdder_1b(A, B, C_in, S, C_out);
    input  A, B;
    input  C_in;
    output S;
    output C_out;

	wire w_a_xor_b, w_nand_a_b, w_nand_cin;

    // YOUR CODE HERE
	//S output
	xor2 xor_a_b(.in1(A), .in2(B), .out(w_a_xor_b));
	xor2 xor_cin_a_b(.in1(C_in), .in2(w_a_xor_b), .out(S));

	//C_out output
	nand2 nand_a_b(.in1(A), .in2(B), .out(w_nand_a_b));
	nand2 nand_cin_a_xor_b(.in1(w_a_xor_b), .in2(C_in), .out(w_nand_cin));
	nand2 nand_out(.in1(w_nand_a_b), .in2(w_nand_cin), .out(C_out));

endmodule
