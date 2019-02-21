/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 2
    
    a 16-bit RCA module
*/
module rca_16b(A, B, C_in, S, C_out);

    // declare constant for size of inputs, outputs (N)
    parameter   N = 16;
	parameter	N_4 = 4;

    input [N-1: 0] A, B;
    input          C_in;
    output [N-1:0] S;
    output         C_out;

	wire c_out[N_4 - 2:0];

    // YOUR CODE HERE
	rca_4b rca_lsb_4(.A(A[3:0]), .B(B[3:0]), .C_in(C_in), .C_out(c_out[0]), .S(S[3:0]));
	rca_4b rca_lsb_1_4(.A(A[4 + 3 : 4]), .B(B[4 + 3 : 4]), .C_in(c_out[0]), .S(S[4 + 3 : 4]), .C_out(c_out[1]));
	rca_4b rca_lsb_2_4(.A(A[2*4 + 3 : 2*4]), .B(B[2*4 + 3 : 2*4]), .C_in(c_out[1]), .S(S[2*4 + 3 : 2*4]), .C_out(c_out[2]));
	rca_4b rca_msb_4(.A(A[N - 1: N - 4]), .B(B[N - 1: N - 4]), .C_in(c_out[N_4 - 2]), .C_out(C_out), .S(S[N - 1: N - 4]));

endmodule
