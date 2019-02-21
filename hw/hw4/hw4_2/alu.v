/*
    CS/ECE 552 Spring '19
    Homework #4, Problem 2

    A 16-bit ALU module.  It is designed to choose
    the correct operation to perform on 2 16-bit numbers from rotate
    left, shift left, shift right arithmetic, shift right logical, add,
    or, xor, & and.  Upon doing this, it should output the 16-bit result
    of the operation, as well as output a Zero bit and an Overflow
    (OFL) bit.
*/
module alu (A, B, Cin, Op, invA, invB, sign, Out, Zero, Ofl);

   // declare constant for size of inputs, outputs (N),
   // and operations (O)
   parameter    N = 16;
   parameter    O = 3;
   
   input [N-1:0] A;
   input [N-1:0] B;
   input         Cin;
   input [O-1:0] Op;
   input         invA;
   input         invB;
   input         sign;
   output reg [N-1:0] Out;
   output         Ofl;
   output         Zero;

   /* YOUR CODE HERE */
    wire [N-1:0] A_flip, B_flip, shift_out, adder_out, xor_out, and_out, or_out;
    wire Cout;
    
    assign A_flip = invA ? ~A : A;
    assign B_flip = invB ? ~B : B;

    barrelShifter shifter(.In(A_flip), .Cnt(B_flip[3:0]), .Op(Op[1:0]), .Out(shift_out));
    rca_16b adder(.A(A_flip), .B(B_flip), .C_in(Cin), .S(adder_out), .C_out(Cout));

    assign Ofl = (Op[1] | Op[0]) ? 0 : sign ? ( ~(A_flip[N - 1] ^ B_flip[N - 1]) & (adder_out[N-1] ^ A_flip[N - 1]) ) : Cout;
    assign Zero = ~|adder_out;

    always @(*) begin
    casex (Op)
        3'b0xx  : Out = shift_out;
        3'b100  : Out = adder_out;
        3'b101  : Out = A_flip & B_flip;
        3'b110  : Out = A_flip | B_flip;
        3'b111  : Out = A_flip ^ B_flip;
        default : $error("DEFAULT CASE ALU OUTPUT");
    endcase
    end

    
endmodule
