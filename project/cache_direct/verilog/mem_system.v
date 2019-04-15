/* $Author: karu $ */
/* $LastChangedDate: 2009-04-24 09:28:13 -0500 (Fri, 24 Apr 2009) $ */
/* $Rev: 77 $ */

module mem_system(/*AUTOARG*/
   // Outputs
   DataOut, Done, Stall, CacheHit, err,
   // Inputs
   Addr, DataIn, Rd, Wr, createdump, clk, rst
   );
   
   input [15:0] Addr;
   input [15:0] DataIn;
   input        Rd;
   input        Wr;
   input        createdump;
   input        clk;
   input        rst;
   
   output [15:0] DataOut;
   output Done;
   output Stall;
   output CacheHit;
   output err;

   wire cache_hit, dirty, valid, cache_err, comp, cache_wr, cache_en;
   
   wire [4:0] cache_tag_out;
   wire [15:0] cache_data_out, cache_data_in;

   /* data_mem = 1, inst_mem = 0 *
    * needed for cache parameter */
   parameter memtype = 0;
   cache #(0 + memtype) c0(// Outputs
                          .tag_out              (cache_tag_out),
                          .data_out             (cache_data_out),
                          .hit                  (cache_hit),
                          .dirty                (dirty),
                          .valid                (valid),
                          .err                  (cache_err),
                          // Inputs
                          .enable               (cache_en),
                          .clk                  (clk),
                          .rst                  (rst),
                          .createdump           (createdump),
                          .tag_in               (Addr[15:11]),
                          .index                (Addr[10:3]),
                          .offset               (Addr[2:0]),
                          .data_in              (cache_data_in),
                          .comp                 (comp),
                          .write                (cache_wr),
                          .valid_in             (1));

   wire mem_stall, mem_busy, mem_err, mem_wr, mem_rd, mem_data_out, mem_addr;

   four_bank_mem mem(// Outputs
                     .data_out          (mem_data_out),
                     .stall             (mem_stall),
                     .busy              (mem_busy),
                     .err               (mem_err),
                     // Inputs
                     .clk               (clk),
                     .rst               (rst),
                     .createdump        (createdump),
                     .addr              (mem_addr),
                     .data_in           (cache_data_out),
                     .wr                (mem_wr),
                     .rd                (mem_rd));

   
   // your code here

   //addr, data select logic
   assign cache_data_in = (Wr) ? DataIn : mem_data_out;
   assign mem_addr = (mem_rd) ? Addr : {cache_tag_out, Addr[10:0]};

   cache_controller controller(//inputs
                        .clk           (clk),
                        .hit           (cache_hit),
                        .dirty         (dirty),
                        .valid         (valid),
                        .cache_err     (cache_err),
                        .stall         (mem_stall),
                        .busy          (mem_busy),
                        .mem_err       (mem_err),
                        .global_rd     (Rd), 
                        .global_wr     (Wr),
                        //outputs
                        .comp          (comp),
                        .cache_write   (cache_wr),
                        .mem_wr        (mem_wr),
                        .mem_rd        (mem_rd),
                        .global_hit    (CacheHit),
                        .en            (cache_en),
                        .done          (Done), 
                        .err           (err)
                        );

   
endmodule // mem_system

// DUMMY LINE FOR REV CONTROL :9:
