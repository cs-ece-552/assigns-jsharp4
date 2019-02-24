/*
    CS/ECE 552 Spring '19
    Homework #3, Problem 1

    2-1 mux template
*/
module mux2_1(InA, InB, S, Out);
    input   InA, InB;
    input   S;
    output  Out;

    wire nAS, nBS, nS;

    // YOUR CODE HERE
	not1 not_S(.in1(S), .out(nS));
	nand2 nand_sel_a(.in1(InA), .in2(nS), .out(nAS));
	nand2 nand_sel_b(.in1(InB), .in2(S), .out(nBS));
	nand2 nand_out(.in1(nAS), .in2(nBS), .out(Out));

endmodule
