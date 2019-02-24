module mux3_8_16b(In0, In1, In2, In3, In4, In5, In6, In7, S, Out);

    input [15:0] In0, In1, In2, In3, In4, In5, In6, In7;
    input [2:0] S;
    output [15:0] Out;

    mux3_8 mux3_8_0(.In0(In0[0]), .In1(In1[0]), .In2(In2[0]), .In3(In3[0]), .In4(In4[0]), .In5(In5[0]), .In6(In6[0]), .In7(In7[0]), .S(S), .Out(Out[0]));
    mux3_8 mux3_8_1(.In0(In0[1]), .In1(In1[1]), .In2(In2[1]), .In3(In3[1]), .In4(In4[1]), .In5(In5[1]), .In6(In6[1]), .In7(In7[1]), .S(S), .Out(Out[1]));
    mux3_8 mux3_8_2(.In0(In0[2]), .In1(In1[2]), .In2(In2[2]), .In3(In3[2]), .In4(In4[2]), .In5(In5[2]), .In6(In6[2]), .In7(In7[2]), .S(S), .Out(Out[2]));
    mux3_8 mux3_8_3(.In0(In0[3]), .In1(In1[3]), .In2(In2[3]), .In3(In3[3]), .In4(In4[3]), .In5(In5[3]), .In6(In6[3]), .In7(In7[3]), .S(S), .Out(Out[3]));
    mux3_8 mux3_8_4(.In0(In0[4]), .In1(In1[4]), .In2(In2[4]), .In3(In3[4]), .In4(In4[4]), .In5(In5[4]), .In6(In6[4]), .In7(In7[4]), .S(S), .Out(Out[4]));
    mux3_8 mux3_8_5(.In0(In0[5]), .In1(In1[5]), .In2(In2[5]), .In3(In3[5]), .In4(In4[5]), .In5(In5[5]), .In6(In6[5]), .In7(In7[5]), .S(S), .Out(Out[5]));
    mux3_8 mux3_8_6(.In0(In0[6]), .In1(In1[6]), .In2(In2[6]), .In3(In3[6]), .In4(In4[6]), .In5(In5[6]), .In6(In6[6]), .In7(In7[6]), .S(S), .Out(Out[6]));
    mux3_8 mux3_8_7(.In0(In0[7]), .In1(In1[7]), .In2(In2[7]), .In3(In3[7]), .In4(In4[7]), .In5(In5[7]), .In6(In6[7]), .In7(In7[7]), .S(S), .Out(Out[7]));
    mux3_8 mux3_8_8(.In0(In0[8]), .In1(In1[8]), .In2(In2[8]), .In3(In3[8]), .In4(In4[8]), .In5(In5[8]), .In6(In6[8]), .In7(In7[8]), .S(S), .Out(Out[8]));
    mux3_8 mux3_8_9(.In0(In0[9]), .In1(In1[9]), .In2(In2[9]), .In3(In3[9]), .In4(In4[9]), .In5(In5[9]), .In6(In6[9]), .In7(In7[9]), .S(S), .Out(Out[9]));
    mux3_8 mux3_8_10(.In0(In0[10]), .In1(In1[10]), .In2(In2[10]), .In3(In3[10]), .In4(In4[10]), .In5(In5[10]), .In6(In6[10]), .In7(In7[10]), .S(S), .Out(Out[10]));
    mux3_8 mux3_8_11(.In0(In0[11]), .In1(In1[11]), .In2(In2[11]), .In3(In3[11]), .In4(In4[11]), .In5(In5[11]), .In6(In6[11]), .In7(In7[11]), .S(S), .Out(Out[11]));
    mux3_8 mux3_8_12(.In0(In0[12]), .In1(In1[12]), .In2(In2[12]), .In3(In3[12]), .In4(In4[12]), .In5(In5[12]), .In6(In6[12]), .In7(In7[12]), .S(S), .Out(Out[12]));
    mux3_8 mux3_8_13(.In0(In0[13]), .In1(In1[13]), .In2(In2[13]), .In3(In3[13]), .In4(In4[13]), .In5(In5[13]), .In6(In6[13]), .In7(In7[13]), .S(S), .Out(Out[13]));
    mux3_8 mux3_8_14(.In0(In0[14]), .In1(In1[14]), .In2(In2[14]), .In3(In3[14]), .In4(In4[14]), .In5(In5[14]), .In6(In6[14]), .In7(In7[14]), .S(S), .Out(Out[14]));
    mux3_8 mux3_8_15(.In0(In0[15]), .In1(In1[15]), .In2(In2[15]), .In3(In3[15]), .In4(In4[15]), .In5(In5[15]), .In6(In6[15]), .In7(In7[15]), .S(S), .Out(Out[15]));

endmodule

