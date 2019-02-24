/*
   CS/ECE 552, Spring '19
   Homework #5, Problem #1
  
   This module creates a 16-bit register.  It has 1 write port, 2 read
   ports, 3 register select inputs, a write enable, a reset, and a clock
   input.  All register state changes occur on the rising edge of the
   clock. 
*/
module rf (
           // Outputs
           readData1, readData2, err,
           // Inputs
           clk, rst, readReg1Sel, readReg2Sel, writeRegSel, writeData, writeEn
           );
   
   input        clk, rst;
   input [2:0]  readReg1Sel;
   input [2:0]  readReg2Sel;
   input [2:0]  writeRegSel;
   input [15:0] writeData;
   input        writeEn;

   output [15:0] readData1;
   output [15:0] readData2;
   output        err;

   wire[15:0] data_out [7:0];
   wire[7:0] write_on, reg_err;


   decoder_3_8 decoder_write_control(.in(writeRegSel), .out(write_on), .en(writeEn));

   reg_16b reg_0(.q(data_out[0]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[0]), .err(reg_err[0]));
   reg_16b reg_1(.q(data_out[1]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[1]), .err(reg_err[1]));
   reg_16b reg_2(.q(data_out[2]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[2]), .err(reg_err[2]));
   reg_16b reg_3(.q(data_out[3]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[3]), .err(reg_err[3]));
   reg_16b reg_4(.q(data_out[4]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[4]), .err(reg_err[4]));
   reg_16b reg_5(.q(data_out[5]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[5]), .err(reg_err[5]));
   reg_16b reg_6(.q(data_out[6]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[6]), .err(reg_err[6]));
   reg_16b reg_7(.q(data_out[7]), .d(writeData), .clk(clk), .rst(rst), .w_en(write_on[7]), .err(reg_err[7]));

   assign err = (|reg_err | readReg1Sel === 3'bx | readReg2Sel === 3'bx) ? 1 : 0;

   mux3_8_16b mux_read_out_1(.In0(data_out[0]), .In1(data_out[1]), .In2(data_out[2]), .In3(data_out[3]), .In4(data_out[4]), 
                     .In5(data_out[5]), .In6(data_out[6]), .In7(data_out[7]), .S(readReg1Sel), .Out(readData1));

   mux3_8_16b mux_read_out_2(.In0(data_out[0]), .In1(data_out[1]), .In2(data_out[2]), .In3(data_out[3]), .In4(data_out[4]), 
                     .In5(data_out[5]), .In6(data_out[6]), .In7(data_out[7]), .S(readReg2Sel), .Out(readData2));
   
   



   

endmodule
