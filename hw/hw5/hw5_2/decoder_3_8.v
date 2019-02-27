module decoder_3_8(in, out, en);

    input en;
    input [2:0] in;
    output [7:0] out;

    reg [7:0] out_if_en;

    always @(*) begin
        out = 8'h00;
        case (in)
            3'b000  : out_if_en = 8'h01;
            3'b001  : out_if_en = 8'h02;
            3'b010  : out_if_en = 8'h04;
            3'b011  : out_if_en = 8'h08;
            3'b100  : out_if_en = 8'h10;
            3'b101  : out_if_en = 8'h20;
            3'b110  : out_if_en = 8'h40;
            3'b111  : out_if_en = 8'h80;
            default : $error("DEFAULT CASE FOR decoder_3_8");
        endcase
    end

    assign out = en ? out_if_en : 8'h00;

endmodule

