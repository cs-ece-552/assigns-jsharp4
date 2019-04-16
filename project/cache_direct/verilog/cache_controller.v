module cache_controller(//inputs
                        clk,
                        rst,
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
    
    input clk, hit, dirty, valid, cache_err, mem_err, global_rd, global_wr, rst;
    input[3:0] busy;
    output comp, cache_write, global_hit, stall, err;

    output reg mem_wr, mem_rd, done, cache_write, global_hit, stall, en;
    reg access, writers_block;

    reg[3:0] state, next_state;

    always @(posedge clk, posedge rst)
        if (rst)
            state <= 4'b0;
        else
            state <= next_state;

    always @(*) begin
        access = 0;
        mem_wr = 0;
        mem_rd = 0;
        done = 0;
        global_hit = 0;
        stall = 0;
        cache_write = 0;
        en = 1;

        case(state)
            4'h0: begin //IDLE
                cache_write = (hit & valid);
                next_state = (en) ? (hit & valid) ? 4'h1 : 4'h2 : 4'h0;
            end
            4'h1: begin //DONE HIT
                global_hit = 1;
                stall = 1;
                done = 1;
            end
            4'h2: begin //MISS
                stall = 1;
                access = 1;
                next_state = (dirty & valid) ? 4'h6 : (global_rd) ? 4'h3 : (valid) ? 4'hb : 4'h4;
                mem_rd = (next_state == 4'h3) ? 1 : 0;
                mem_wr = (next_state == 4'h6) ? 1 : 0;
            end
            4'h3: begin //MR
                stall = 1;
                next_state = 4'h4;
                en = 0;
            end
            4'h4: begin //AW
                stall = 1;
                access = 1;
                cache_write = 1;
                next_state = (global_wr) ? 4'hb : 4'h5;
            end
            4'h5: begin //CR MISS DONE
                done = 1;
                next_state = 4'h0;
                stall = 1;
            end
            4'h6: begin//MW1
                stall = 1;
                next_state = 4'h7;
            end
            4'h7: begin//MW2
                stall = 1;
                next_state = 4'h8;
                en = 0;
            end
            4'h8: begin//MW3
                stall = 1;
                next_state = (global_wr) ? 4'hb : 4'h9;
                mem_rd = (next_state == 4'h9);
            end
            4'h9: begin//MR2
                stall = 1;
                next_state = 4'h3;
            end
            4'ha: begin//CW DONE MISS
                done = 1;
                next_state = 4'h0;
                stall = 1;
            end
            4'hb: begin//CW
                stall = 1;
                cache_write = 1;
                next_state = 4'ha;
            end
            // 4'hc: begin//AW2
            // end
            // 4'hd: begin
            // end
            // 4'he: begin
            // end
            default:
                next_state <= 4'h0;
          
        endcase
    end

    assign comp = !access;
    assign err = 0;

endmodule
            

