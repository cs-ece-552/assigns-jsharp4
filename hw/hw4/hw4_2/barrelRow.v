module barrelRow (In, Shift, Op, Out);

   // declare constant for size of inputs, outputs (N) and # bits to shift (C)
   parameter   N = 16;
   parameter   O = 2;
   parameter   S = 8; //number of bits to shift

   input [N-1:0]   In;
   input Shift; //shift if 1
   input [O-1:0]   Op;
   output reg [N-1:0]  Out;

   /* YOUR CODE HERE */

   always @(In, Shift, Op)
      casex ({Shift, Op})
         3'b0xx   : Out = {In[N-1:0]};
         3'b100   : Out = {In[N-S-1:0], In[N-1:N-S]};
         3'b101   : Out = {In[N-S-1:0], {S{1'b0}} };
         3'b110   : Out = { {S{In[N-1]}}, In[N-1:S]};
         3'b111   : Out = { {S{1'b0}}, In[N-1:S]};
         default  : $error("DEFAULT CASE FOR BARREL SHIFTER");
      endcase

         
   
endmodule