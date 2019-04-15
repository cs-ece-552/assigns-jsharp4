module cache_controller(//inputs
                        clk,
                        hit,
                        dirty,
                        valid,
                        cache_err,
                        stall,
                        busy,
                        mem_err,
                        global_rd, 
                        global_wr,
                        //outputs
                        comp,
                        cache_write,
                        mem_wr,
                        mem_rd,
                        global_hit,
                        en,
                        done, 
                        err);
    
    input clk, hit, dirty, valid, cache_err, stall, busy, mem_err, en, global_rd, global_wr;

    output comp, cache_write, global_hit;

    output reg mem_wr, mem_rd, done, err, global_hit;
    reg access, writers_block, en_block;

    //not doing system verilog, so can't make enum, but assume states:
    // IDLE = 0, AR = 1, MW_1 = 2, MW_1 = 3, MW_1 = 4, MW_1 = 5, MR_1 = 6, MR_2 = 7, DONE_AW = 8, DONE_HIT = 9, INVALID = 10

    reg[3:0] state, next_state;

    assign en = global_wr | global_rd;

    always @(posedge clk, posedge en) begin
        access = 0;
        mem_wr = 0;
        mem_rd = 0;
        done = 0;
        writers_block = 0;
        en_block = 1;
        global_hit = 0;
        err = 0;

        case(state)
            4'h0: begin //IDLE
                global_hit = hit;
                next_state <= (en) ? (hit) ? 4'h9 : 4'h1 : 4'h0;
                writers_block = 1;
            end
            4'h1: begin //AR
                access = 1;
                next_state <= (dirty) ? ((valid) ? 4'h2 : 4'ha) : ((global_wr) ? 4'h8 : 4'h6);
            end
            4'h2: begin//MW_1
                mem_wr = 1;
                next_state <= 4'h3;
            end
            4'h3: begin //MW_2
                en_block = 0;
                next_state <= 4'h4;
            end
            4'h4: begin //MW_3
                en_block = 0;
                next_state <= 4'h5;
            end
            4'h5: begin //MW_4
                en_block = 0;
                next_state <= (global_wr) ? 4'h8 : 4'h6;
            end
            4'h6: begin //MR_1:
                mem_rd = 1;
                en_block = 0;
                next_state <= 4'h7;
            end
            4'h7: begin //MR_2:
                en_block = 0;
                next_state <= 4'h8;
            end
            4'h8: begin//DONE_AW
                writers_block = 1;
                done = 1;
                next_state <= 4'h0;
            end
            4'h9: begin //DONE_HIT
                done = 1;
                next_state <= 4'h0;
            end
            4'ha: begin//INVALID
                err = 1;
                next_state <= 4'h0;
            end    
            default:
                next_state <= 4'h0;
        endcase

        state <= next_state;

    end

    assign cache_write = global_wr & writers_block;
    assign comp = !access;

endmodule
            
