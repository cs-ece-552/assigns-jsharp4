module reg_16b(q, d, clk, rst, w_en, err);
    parameter N = 16;
    
    input clk, rst, w_en;
    input [15:0] d;
    output [15:0] q;
    output err;

    wire [15:0] in;

    assign in = w_en ? d : q;

    assign err = (|d === 1'bx | w_en === 1'bx) ? 1 : 0;

    dff dff_0(.q(q[0]), .d(in[0]), .clk(clk), .rst(rst));
    dff dff_1(.q(q[1]), .d(in[1]), .clk(clk), .rst(rst));
    dff dff_2(.q(q[2]), .d(in[2]), .clk(clk), .rst(rst));
    dff dff_3(.q(q[3]), .d(in[3]), .clk(clk), .rst(rst));
    dff dff_4(.q(q[4]), .d(in[4]), .clk(clk), .rst(rst));
    dff dff_5(.q(q[5]), .d(in[5]), .clk(clk), .rst(rst));
    dff dff_6(.q(q[6]), .d(in[6]), .clk(clk), .rst(rst));
    dff dff_7(.q(q[7]), .d(in[7]), .clk(clk), .rst(rst));
    dff dff_8(.q(q[8]), .d(in[8]), .clk(clk), .rst(rst));
    dff dff_9(.q(q[9]), .d(in[9]), .clk(clk), .rst(rst));
    dff dff_10(.q(q[10]), .d(in[10]), .clk(clk), .rst(rst));
    dff dff_11(.q(q[11]), .d(in[11]), .clk(clk), .rst(rst));
    dff dff_12(.q(q[12]), .d(in[12]), .clk(clk), .rst(rst));
    dff dff_13(.q(q[13]), .d(in[13]), .clk(clk), .rst(rst));
    dff dff_14(.q(q[14]), .d(in[14]), .clk(clk), .rst(rst));
    dff dff_15(.q(q[15]), .d(in[15]), .clk(clk), .rst(rst));

endmodule

    
