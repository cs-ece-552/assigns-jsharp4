/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 1
    
    A barrel shifter module.  It is designed to shift a number via rotate
    left, shift left, shift right arithmetic, or shift right logical based
    on the Op() value that is passed in (2 bit number).  It uses these
    shifts to shift the value any number of bits between 0 and 15 bits.
 */
module barrelShifter (In, Cnt, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   C = 4;
   parameter   O = 2;

   input [N-1:0]   In;
   input [C-1:0]   Cnt;
   input [O-1:0]   Op;
   output [N-1:0]  Out;

   /* YOUR CODE HERE */
   wire [N-1:0] out_bus [C-2:0];
   
   barrelRow #(N, O, 1) row_1(.In(In), .Shift(Cnt[0]), .Op(Op), .Out(out_bus[0]));
   barrelRow #(N, O, 2) row_2(.In(out_bus[0]), .Shift(Cnt[1]), .Op(Op), .Out(out_bus[1]));
   barrelRow #(N, O, 4) row_4(.In(out_bus[1]), .Shift(Cnt[2]), .Op(Op), .Out(out_bus[2]));
   barrelRow #(N, O, 8) row_8(.In(out_bus[2]), .Shift(Cnt[3]), .Op(Op), .Out(Out));         
   
endmodule
