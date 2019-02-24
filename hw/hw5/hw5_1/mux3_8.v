module mux3_8(In0, In1, In2, In3, In4, In5, In6, In7, S, Out);

    input In0, In1, In2, In3, In4, In5, In6, In7; 
    input [2:0] S;
    output Out;

    wire out_01, out_23, out_45, out_67, out_L20, out_L21;

    mux2_1 mux2_1_01(.InA(In0), .InB(In1), .S(S[0]), .Out(out_01));
    mux2_1 mux2_1_23(.InA(In2), .InB(In3), .S(S[0]), .Out(out_23));
    mux2_1 mux2_1_45(.InA(In4), .InB(In5), .S(S[0]), .Out(out_45));
    mux2_1 mux2_1_67(.InA(In6), .InB(In7), .S(S[0]), .Out(out_67));
    mux2_1 mux2_1_L20(.InA(out_01), .InB(out_23), .S(S[1]), .Out(out_L20));
    mux2_1 mux2_1_L21(.InA(out_45), .InB(out_67), .S(S[1]), .Out(out_L21));
    mux2_1 mux2_1_out(.InA(out_L20), .InB(out_L21), .S(S[2]), .Out(Out));

endmodule