/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    a 4-bit (quad) 4-1 Mux template
*/
module mux2_1_16b(InA, InB, S, Out);

    // parameter N for length of inputs and outputs (to use with larger inputs/outputs)
    parameter N = 16;

    input [N-1:0]   InA, InB;
    input           S;
    output [N-1:0]  Out;

    // YOUR CODE HERE
	mux2_1 mux_1b_0(.S(S), .InA(InA[0]), .InB(InB[0]), .Out(Out[0]));
	mux2_1 mux_1b_1(.S(S), .InA(InA[1]), .InB(InB[1]), .Out(Out[1]));
	mux2_1 mux_1b_2(.S(S), .InA(InA[2]), .InB(InB[2]), .Out(Out[2]));
	mux2_1 mux_1b_3(.S(S), .InA(InA[3]), .InB(InB[3]), .Out(Out[3]));
    mux2_1 mux_1b_4(.S(S), .InA(InA[4]), .InB(InB[4]), .Out(Out[4]));
    mux2_1 mux_1b_5(.S(S), .InA(InA[5]), .InB(InB[5]), .Out(Out[5]));
    mux2_1 mux_1b_6(.S(S), .InA(InA[6]), .InB(InB[6]), .Out(Out[6]));
    mux2_1 mux_1b_7(.S(S), .InA(InA[7]), .InB(InB[7]), .Out(Out[7]));
    mux2_1 mux_1b_8(.S(S), .InA(InA[8]), .InB(InB[8]), .Out(Out[8]));
    mux2_1 mux_1b_9(.S(S), .InA(InA[9]), .InB(InB[9]), .Out(Out[9]));
    mux2_1 mux_1b_10(.S(S), .InA(InA[10]), .InB(InB[10]), .Out(Out[10]));
    mux2_1 mux_1b_11(.S(S), .InA(InA[11]), .InB(InB[11]), .Out(Out[11]));
    mux2_1 mux_1b_12(.S(S), .InA(InA[12]), .InB(InB[12]), .Out(Out[12]));
    mux2_1 mux_1b_13(.S(S), .InA(InA[13]), .InB(InB[13]), .Out(Out[13]));
    mux2_1 mux_1b_14(.S(S), .InA(InA[14]), .InB(InB[14]), .Out(Out[14]));
    mux2_1 mux_1b_15(.S(S), .InA(InA[15]), .InB(InB[15]), .Out(Out[15]));




endmodule
