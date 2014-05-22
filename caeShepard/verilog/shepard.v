module shepard(
    input rst,
    input clk,
    input idle,
    input start,
    output stall,
    
    input [1:0] aeId,
    
    //4read MCs
    output mc_req_ld_r0,
    output [47:0] mc_req_vadr_r0,
    input mc_rd_rq_stall_r0,
    input mc_rsp_push_r0,
    output mc_rsp_stall_r0,
    input [63:0] mc_rsp_data_r0,
    output mc_req_ld_r1,
    output [47:0] mc_req_vadr_r1,
    input mc_rd_rq_stall_r1,
    input mc_rsp_push_r1,
    output mc_rsp_stall_r1,
    input [63:0] mc_rsp_data_r1,
    
    output mc_req_ld_r2,
    output [47:0] mc_req_vadr_r2,
    input mc_rd_rq_stall_r2,
    input mc_rsp_push_r2,
    output mc_rsp_stall_r2,
    input [63:0] mc_rsp_data_r2,

    output mc_req_ld_r3,
    output [47:0] mc_req_vadr_r3,
    input mc_rd_rq_stall_r3,
    input mc_rsp_push_r3,
    output mc_rsp_stall_r3,
    input [63:0] mc_rsp_data_r3,

    //1Hash1 MC
    output mc_req_ld_h0,
    output [47:0] mc_req_vadr_h0,
    input mc_rd_rq_stall_h0,
    input mc_rsp_push_h0,
    output mc_rsp_stall_h0,
    input [63:0] mc_rsp_data_h0,

    //1Hash2 MC
    output mc_req_ld_h1,
    output [47:0] mc_req_vadr_h1,
    input mc_rd_rq_stall_h1,
    input mc_rsp_push_h1,
    output mc_rsp_stall_h1,
    input [63:0] mc_rsp_data_h1,

    //5Checker MCs
    output mc_req_ld_c0,
    output [47:0] mc_req_vadr_c0,
    input mc_rd_rq_stall_c0,
    input mc_rsp_push_c0,
    output mc_rsp_stall_c0,
    input [63:0] mc_rsp_data_c0,
    output mc_req_ld_c1,
    output [47:0] mc_req_vadr_c1,
    input mc_rd_rq_stall_c1,
    input mc_rsp_push_c1,
    output mc_rsp_stall_c1,
    input [63:0] mc_rsp_data_c1,
    output mc_req_ld_c2,
    output [47:0] mc_req_vadr_c2,
    input mc_rd_rq_stall_c2,
    input mc_rsp_push_c2,
    output mc_rsp_stall_c2,
    input [63:0] mc_rsp_data_c2,
    output mc_req_ld_c3,
    output [47:0] mc_req_vadr_c3,
    input mc_rd_rq_stall_c3,
    input mc_rsp_push_c3,
    output mc_rsp_stall_c3,
    input [63:0] mc_rsp_data_c3,
    output mc_req_ld_c4,
    output [47:0] mc_req_vadr_c4,
    input mc_rd_rq_stall_c4,
    input mc_rsp_push_c4,
    output mc_rsp_stall_c4,
    input [63:0] mc_rsp_data_c4,

    //1 store MC
    output mc_req_st_res,
    output [47:0] mc_req_vadr_res,
    output [63:0] mc_req_data_res, //could have been called mc_req_wr_rdclr_res
    input mc_wr_rq_stall_res,

    input [47:0] hash_base,
    input [31:0] hash_size,
    input [47:0] ref_base,
    input [47:0] read_base,
    input [31:0] read_size,
    input [47:0] res_base
);

wire r_reset;
// ISE can have issues with global wires attached to D(flop)/I(lut) inputs
FDSE rst_ff (.C(clk),.S(rst),.CE(r_reset),.D(!r_reset),.Q(r_reset)); 

//TODO:stall once started use done signal to determine finish
reg r_stall, c_stall;
reg r_done, c_done;
reg [31:0] r_watch_dog_timer, c_watch_dog_timer;

wire idle_rst;
assign idle_rst = idle || r_reset;

assign stall = r_stall;

always @(posedge clk) begin
    if(idle_rst) begin
        r_stall <= 0;
        r_done <= 0;
        r_watch_dog_timer <= 0;
    end
    else begin
        r_stall <= c_stall;
        r_done <= c_done;
        r_watch_dog_timer <= c_watch_dog_timer;
    end
end

always @* begin
    c_stall = r_stall;
    if(start)
        c_stall = 1;
    if(r_done)
        c_stall = 0;
    if(!r_stall)
        c_watch_dog_timer = 0;
    else
        c_watch_dog_timer = r_watch_dog_timer + 1;
    if(r_watch_dog_timer == 32'HFFFFFFFF)
        c_stall = 0;
end

//request read
reg [1:0] r_stg0_state, c_stg0_state;
`define IDLE        'b00
`define INIT        'b01
`define NEXT_READ   'b10
`define DONE        'b11
reg [31:0] r_r0_count, r_r1_count, r_r2_count, r_r3_count;
reg [31:0] c_r0_count, c_r1_count, c_r2_count, c_r3_count;

//wire [31:0] w_r0_last, w_r1_last, w_r2_last, w_r3_last;
wire w_r0_end, w_r1_end, w_r2_end, w_r3_end;
reg [6:0] ae_offset;
/*
assign w_r0_last ={(read_size-1) , 5'b0} + ae_offset;
assign w_r1_last ={2'h1 , 3'b0} + {(read_size-1) , 5'b0} + ae_offset;
assign w_r2_last ={2'h2 , 3'b0} + {(read_size-1) , 5'b0} + ae_offset;
assign w_r3_last ={2'h3 , 3'b0} + {(read_size-1) , 5'b0} + ae_offset;
*/
wire [31:0] w_last_read = {(read_size), 5'b0};
assign w_r0_end = ((r_r0_count + 'h80) >= w_last_read) ? 1'b1 : 1'b0;
assign w_r1_end = ((r_r1_count + 'h80) >= w_last_read) ? 1'b1 : 1'b0;
assign w_r2_end = ((r_r2_count + 'h80) >= w_last_read) ? 1'b1 : 1'b0;
assign w_r3_end = ((r_r3_count + 'h80) >= w_last_read) ? 1'b1 : 1'b0;

reg r_rd_rq_r0, c_rd_rq_r0, r_rd_rq_r1, c_rd_rq_r1, r_rd_rq_r2, c_rd_rq_r2, r_rd_rq_r3, c_rd_rq_r3;

//register outputs
reg r_req_ld_r0, r_req_ld_r1, r_req_ld_r2, r_req_ld_r3;
reg [47:0] r_req_vadr_r0;
reg [47:0] r_req_vadr_r1;
reg [47:0] r_req_vadr_r2;
reg [47:0] r_req_vadr_r3;
always @(posedge clk) begin
    r_req_ld_r0 <= r_rd_rq_r0;
    r_req_ld_r1 <= r_rd_rq_r1;
    r_req_ld_r2 <= r_rd_rq_r2;
    r_req_ld_r3 <= r_rd_rq_r3;

    r_req_vadr_r0 <= r_r0_count + read_base;
    r_req_vadr_r1 <= r_r1_count + read_base;
    r_req_vadr_r2 <= r_r2_count + read_base;
    r_req_vadr_r3 <= r_r3_count + read_base;
end

assign mc_req_ld_r0 = r_req_ld_r0;
assign mc_req_ld_r1 = r_req_ld_r1;
assign mc_req_ld_r2 = r_req_ld_r2;
assign mc_req_ld_r3 = r_req_ld_r3;
assign mc_req_vadr_r0 = r_req_vadr_r0;
assign mc_req_vadr_r1 = r_req_vadr_r1;
assign mc_req_vadr_r2 = r_req_vadr_r2;
assign mc_req_vadr_r3 = r_req_vadr_r3;

always @(posedge clk) begin
    if(idle_rst) begin
        r_stg0_state = `IDLE;
        r_r0_count = 32'h00000000;
        r_r1_count = 32'h00000000;
        r_r2_count = 32'h00000000;
        r_r3_count = 32'h00000000;
        r_rd_rq_r0 = 0;
        r_rd_rq_r1 = 0;
        r_rd_rq_r2 = 0;
        r_rd_rq_r3 = 0;
    end
    else begin
        r_stg0_state = c_stg0_state;
        r_r0_count = c_r0_count;
        r_r1_count = c_r1_count;
        r_r2_count = c_r2_count;
        r_r3_count = c_r3_count;
        r_rd_rq_r0 = c_rd_rq_r0;
        r_rd_rq_r1 = c_rd_rq_r1;
        r_rd_rq_r2 = c_rd_rq_r2;
        r_rd_rq_r3 = c_rd_rq_r3;
    end
end

wire r0_fifo_hfull, r1_fifo_hfull, r2_fifo_hfull, r3_fifo_hfull;

always @* begin
    case(aeId)
        0: ae_offset = 'H00;
        1: ae_offset = 'H20;
        2: ae_offset = 'H40;
        3: ae_offset = 'H60;
    endcase
    c_rd_rq_r0 = 0;
    c_rd_rq_r1 = 0;
    c_rd_rq_r2 = 0;
    c_rd_rq_r3 = 0;
    case(r_stg0_state)
        `IDLE: begin
        c_r0_count = 32'h00000000;
        c_r1_count = 32'h00000000;
        c_r2_count = 32'h00000000;
        c_r3_count = 32'h00000000;
        end
        `INIT: begin
            c_r0_count = 0 + ae_offset;
            c_r1_count ={29'h1 , 3'b0} + ae_offset;
            c_r2_count ={29'h2 , 3'b0} + ae_offset;
            c_r3_count ={29'h3 , 3'b0} + ae_offset;
            c_rd_rq_r0 = 1;
            c_rd_rq_r1 = 1;
            c_rd_rq_r2 = 1;
            c_rd_rq_r3 = 1;
        end
        `NEXT_READ: begin
            //stall or last pointer
            if(mc_rd_rq_stall_r0 || w_r0_end || r0_fifo_hfull) begin
                c_rd_rq_r0 = 0;
                c_r0_count = r_r0_count;
            end
            else begin
                c_r0_count = r_r0_count + 'h80;
                c_rd_rq_r0 = 1;
            end
            if(mc_rd_rq_stall_r1 || w_r1_end || r1_fifo_hfull) begin
                c_rd_rq_r1 = 0;
                c_r1_count = r_r1_count;
            end
            else begin
                c_r1_count = r_r1_count + 'h80;
                c_rd_rq_r1 = 1;
            end
            if(mc_rd_rq_stall_r2 || w_r2_end || r2_fifo_hfull) begin
                c_rd_rq_r2 = 0;
                c_r2_count = r_r2_count;
            end
            else begin
                c_r2_count = r_r2_count + 'h80;
                c_rd_rq_r2 = 1;
            end
            if(mc_rd_rq_stall_r3 || w_r3_end || r3_fifo_hfull) begin
                c_rd_rq_r3 = 0;
                c_r3_count = r_r3_count;
            end
            else begin
                c_r3_count = r_r3_count + 'h80;
                c_rd_rq_r3 = 1;
            end
        end
        `DONE: begin
        c_r0_count = 32'h00000000;
        c_r1_count = 32'h00000000;
        c_r2_count = 32'h00000000;
        c_r3_count = 32'h00000000;
        end
    endcase
end

always @* begin
    c_stg0_state = r_stg0_state;
    case (r_stg0_state)
        `IDLE: if(start) c_stg0_state = `INIT;
        `INIT: c_stg0_state = `NEXT_READ;
        `NEXT_READ: if(w_r0_end && w_r1_end && w_r2_end && w_r3_end) c_stg0_state = `DONE;
        `DONE: c_stg0_state = `DONE;
        default: c_stg0_state = `IDLE;
    endcase
end

//read in data to fifos

wire [199:0] w_stg1_read;
wire [3:0] w_r_fifo_empty;
wire w_r_fifo_ready;
assign w_r_fifo_ready = ~|w_r_fifo_empty;
reg w_stg1_pop;


fifo_64x512_whf r0_fifo (
    .clk(clk),
    .srst(r_reset),
    .wr_en(mc_rsp_push_r0),
    .din(mc_rsp_data_r0),
    .prog_full(mc_rsp_stall_r0),
    .full(),
    .rd_en(w_stg1_pop),
    .dout(w_stg1_read[63:0]),
    .data_count(r0_fifo_hfull),
    .empty(w_r_fifo_empty[0])
);
/*
shep_fifo r0_fifo (
    .clk(clk),
    .srst(r_reset),
    .wr_en(mc_rsp_push_r0),
    .din(mc_rsp_data_r0),
    .prog_full(mc_rsp_stall_r0),
    .full(),
    .rd_en(w_stg1_pop),
    .dout(w_stg1_read[63:0]),
    .empty(w_r_fifo_empty[0])
);
*/
fifo_64x512_whf r1_fifo (
    .clk(clk),
    .srst(r_reset),
    .wr_en(mc_rsp_push_r1),
    .din(mc_rsp_data_r1),
    .prog_full(mc_rsp_stall_r1),
    .full(),
    .rd_en(w_stg1_pop),
    .dout(w_stg1_read[127:64]),
    .data_count(r1_fifo_hfull),
    .empty(w_r_fifo_empty[1])
);

fifo_64x512_whf r2_fifo (
    .clk(clk),
    .srst(r_reset),
    .wr_en(mc_rsp_push_r2),
    .din(mc_rsp_data_r2),
    .prog_full(mc_rsp_stall_r2),
    .full(),
    .rd_en(w_stg1_pop),
    .dout(w_stg1_read[191:128]),
    .data_count(r2_fifo_hfull),
    .empty(w_r_fifo_empty[2])
);

wire [63:8] r3_stub;

fifo_64x512_whf r3_fifo (
    .clk(clk),
    .srst(r_reset),
    .wr_en(mc_rsp_push_r3),
    .din(mc_rsp_data_r3),
    .prog_full(mc_rsp_stall_r3),
    .full(),
    .rd_en(w_stg1_pop),
    .dout({r3_stub, w_stg1_read[199:192]}),
    .data_count(r3_fifo_hfull),
    .empty(w_r_fifo_empty[3])
);

wire stg1_stall;
//small control signal for push and pop
always @*
    w_stg1_pop = w_r_fifo_ready && !stg1_stall; //register control?

always @(posedge clk) begin
    if(w_stg1_pop) begin
        $display("recieved read to AE: %x", w_stg1_read);
    end
end

//TODO:hash0 recieves push
//always @(posedge clk) begin

wire [199:0] stg1_read_out;
wire [31:0] stg1_hash_index;
wire [47:0] stg1_hash_vadr;
wire stg1_hash_stub;
wire stg1_push;


hash stg1_hash(
    .rst(r_reset),
    .clk(clk),
    .stall(stg1_stall),
    .key(w_stg1_read),
    .seed(0),
    .table_size(hash_size),
    .ctr_in({1'b0, w_stg1_pop}),
    .key_out(stg1_read_out),
    .table_index(stg1_hash_index),
    .ctr_out({stg1_hash_stub, stg1_push})
);
wire stg2_pop;
wire stg2_stall;
wire stg1_2_stg2_read_fifo_empty;
wire stg2_intermediate_fifo_empty;
assign stg2_pop = !stg1_2_stg2_read_fifo_empty && !stg2_stall && !stg2_intermediate_fifo_empty;

//read goes to new fifo
//create 200.WIDTH fifo
wire stg2_read_fifo_stall;
wire [199:0] stg2_read;
fifo_200x512 stg1_2_stg2_read_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(stg1_read_out),
    .wr_en(stg1_push),
    .dout(stg2_read),
    .rd_en(stg2_pop),
    .empty(stg1_2_stg2_read_fifo_empty),
    .full(),
    .prog_full(stg2_read_fifo_stall) //TODO: stall stg1
);

assign stg1_stall = stg2_read_fifo_stall || mc_rd_rq_stall_h0;
assign stg1_hash_vadr = hash_base + (stg1_hash_index<<3);
//register outputs
reg r_req_ld_h0;
reg [47:0] r_req_vadr_h0;
always @(posedge clk) begin
    r_req_ld_h0 <= stg1_push;
    r_req_vadr_h0 <= stg1_hash_vadr;
end
assign mc_req_ld_h0 = r_req_ld_h0;
assign mc_req_vadr_h0 = r_req_vadr_h0;

always @(posedge clk) begin
    if(stg1_push)
        $display("h0 request:%X", mc_req_vadr_h0);
    if(stg1_stall)
        $display("stage 1 stall");
end

//TODO: move comments to correct location
//stage1 control deals with stall from h0 mc
//hash0 requests memory from mc
//optional:possible fifo for h0 mc req


wire stg2_offset;
wire [19:0] stg2_ivalue;
wire [42:0] stg2_fifo_stub;
//TODO:assign stg2_pop;
wire stg2_2_stg4_read_fifo_empty;
wire stg2_2_stg4_read_fifo_afull;
assign stg2_stall = stg2_2_stg4_read_fifo_afull || mc_rd_rq_stall_h1;

//fifo in intermediate value
fifo_64x512 stg2_intermediate_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_h0),
    .wr_en(mc_rsp_push_h0),
    .dout({stg2_ivalue, stg2_offset, stg2_fifo_stub}),
    .rd_en(stg2_pop),
    .empty(stg2_intermediate_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_h0)
);
//stage1 control deals with stall for h0 mc, from h1 mc
//give hash block conrol signal (0,1,2)

wire stg2_offset_fifo_push;
wire [1:0] stg2_ctr_out;
wire signed [19:0] stg2_offset_out;
wire [31:0] stg2_pre_table_index;
wire [31:0] stg2_table_index;
assign stg2_offset_fifo_push = stg2_pop && stg2_offset;
//add offset fifo
fifo_20x64 stg2_offset_fifo( //TODO: make fifo as large as pipesize
    .srst(r_reset),
    .clk(clk),
    .din(stg2_ivalue),
    .wr_en(stg2_offset_fifo_push),
    .dout(stg2_offset_out),
    .rd_en(stg2_ctr_out[1]),
    .empty(), //logic prevents over and underflow
    .full(),
    .prog_full() 
);
wire [1:0] stg2_hash_ctr = {stg2_offset_fifo_push, stg2_pop && !stg2_offset};
wire [199:0] stg2_hash_read_out;
//h1 recieves push
wire [31:0] stg2_seed;
assign stg2_seed = stg2_offset ? 32'h0 : {12'h0, stg2_ivalue};
    
hash stg2_hash(
    .rst(r_reset),
    .clk(clk),
    .stall(stg2_stall),
    .key(stg2_read),
    .seed(stg2_seed),
    .table_size(hash_size),
    .ctr_in(stg2_hash_ctr),
    .key_out(stg2_hash_read_out),
    .table_index(stg2_pre_table_index),
    .ctr_out(stg2_ctr_out)
);
wire stg2_push;
assign stg2_push = |stg2_ctr_out;
wire signed [31:0] stg2_offset_out_extend;
assign stg2_offset_out_extend = stg2_offset_out;
assign stg2_table_index = stg2_ctr_out[1] ? stg2_pre_table_index + stg2_offset_out_extend : stg2_pre_table_index;

//register outputs
reg r_req_ld_h1;
reg [47:0] r_req_vadr_h1;
always @(posedge clk) begin
    r_req_ld_h1 <= stg2_push;
    r_req_vadr_h1 <= hash_base + (stg2_table_index<<3);
end
assign mc_req_ld_h1 = r_req_ld_h1;
assign mc_req_vadr_h1 = r_req_vadr_h1;

always @(posedge clk) begin
    if(stg2_push) begin
        $display("h1 request:%X", mc_req_vadr_h1);
        if(stg2_ctr_out[1]) begin
            $display("with offset: %X", stg2_offset_out_extend);
        end
    end
end


//stage3stage3stage3stage3stage3stage3stage3
`define COUNT_WIDTH 11 //TODO: replace elsewhere
wire stg3_stall, stg3_pop;
wire [31:0] stg3_ref_index;
wire [10:0] stg3_read_count;
wire stg3_final_fifo_empty;
wire count_fifo_empty, count_fifo_afull;
wire [(`COUNT_WIDTH-1):0] stg4_read_count;
wire index_fifo_empty, index_fifo_afull;
wire [31:0] stg4_ref_index;

assign stg3_stall = mc_rd_rq_stall_c0 || mc_rd_rq_stall_c1 || mc_rd_rq_stall_c2 || mc_rd_rq_stall_c3 || mc_rd_rq_stall_c4 || index_fifo_afull || count_fifo_afull;
assign stg3_pop = !stg3_stall && !stg3_final_fifo_empty;

//stage4
wire stg4_stall; //, stg4_pop; //TODO: remove stg4_pop
wire stg4_pop_0;
reg stg4_pop_1, stg4_pop_2, stg4_pop_3;
wire [199:0] stg4_read;
//wire stg2_2_stg4_read_fifo_empty; defined earlier
wire [319:0] check_unaligned;
wire [199:0] ref_check;
reg is_match;
wire c0_fifo_empty,  c1_fifo_empty,  c2_fifo_empty,  c3_fifo_empty,  c4_fifo_empty;
assign stg4_stall = mc_wr_rq_stall_res;
assign stg4_pop_0 = !stg4_stall && !c0_fifo_empty && !c1_fifo_empty && !c2_fifo_empty && !c3_fifo_empty && !c4_fifo_empty &&
    !count_fifo_empty && !stg2_2_stg4_read_fifo_empty && !index_fifo_empty;

always @(posedge clk) begin
    stg4_pop_3 <= stg4_pop_2;
    stg4_pop_2 <= stg4_pop_1;
    stg4_pop_1 <= stg4_pop_0;
end

//read goes to fifo
fifo_200x512 stg2_2_stg4_read_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(stg2_hash_read_out),
    .wr_en(stg2_push),
    .dout(stg4_read),
    .rd_en(stg4_pop_1),
    .empty(stg2_2_stg4_read_fifo_empty),
    .full(),
    .prog_full(stg2_2_stg4_read_fifo_afull)
);

//stage3 control deals with stall to h1 mc from check mc
wire [20:0] stg3_final_fifo_stub;
//fifo in genome adr and count
fifo_64x512 stg3_final_fifo( //TODO: make a better name
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_h1),
    .wr_en(mc_rsp_push_h1),
    .dout({stg3_final_fifo_stub, stg3_read_count, stg3_ref_index}),
    .rd_en(stg3_pop),
    .empty(stg3_final_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_h1)
);

//count fifo
fifo_11x512 count_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(stg3_read_count),
    .wr_en(stg3_pop),
    .dout(stg4_read_count),
    .rd_en(stg4_pop_3),
    .empty(count_fifo_empty),
    .full(),
    .prog_full(count_fifo_afull)
);

fifo_32x8192 index_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(stg3_ref_index),
    .wr_en(stg3_pop),
    .dout(stg4_ref_index),
    .rd_en(stg4_pop_0),
    .empty(index_fifo_empty),
    .full(),
    .prog_full(index_fifo_afull)
);

//register checker request ports
reg r_req_ld_c0, r_req_ld_c1, r_req_ld_c2, r_req_ld_c3, r_req_ld_c4;
reg [47:0] r_req_vadr_c4;
reg [47:0] r_req_vadr_c3;
reg [47:0] r_req_vadr_c2;
reg [47:0] r_req_vadr_c1;
reg [47:0] r_req_vadr_c0;
wire [47:0] check_base;
assign check_base = ref_base + {stg3_ref_index[31:5], 3'b0};

always @(posedge clk) begin
    r_req_ld_c0 <= stg3_pop;
    r_req_ld_c1 <= stg3_pop;
    r_req_ld_c2 <= stg3_pop;
    r_req_ld_c3 <= stg3_pop;
    r_req_ld_c4 <= stg3_pop;
    r_req_vadr_c0 <= check_base;
    r_req_vadr_c1 <= check_base + 'h8;
    r_req_vadr_c2 <= check_base + 'h10;
    r_req_vadr_c3 <= check_base + 'h18;
    r_req_vadr_c4 <= check_base + 'h20;
end


assign mc_req_ld_c0 = r_req_ld_c0;
assign mc_req_ld_c1 = r_req_ld_c1;
assign mc_req_ld_c2 = r_req_ld_c2;
assign mc_req_ld_c3 = r_req_ld_c3;
assign mc_req_ld_c4 = r_req_ld_c4;

assign mc_req_vadr_c0 = r_req_vadr_c0;
assign mc_req_vadr_c1 = r_req_vadr_c1;
assign mc_req_vadr_c2 = r_req_vadr_c2;
assign mc_req_vadr_c3 = r_req_vadr_c3;
assign mc_req_vadr_c4 = r_req_vadr_c4;

always @(posedge clk) begin
    if(stg3_pop)
        $display("c request:%X", mc_req_vadr_c0);
end


//TODO:shifter pops checker fifos
fifo_64x512 c0_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_c0),
    .wr_en(mc_rsp_push_c0),
    .dout(check_unaligned[63:0]),
    .rd_en(stg4_pop_0),
    .empty(c0_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_c0)
);

fifo_64x512 c1_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_c1),
    .wr_en(mc_rsp_push_c1),
    .dout(check_unaligned[127:64]),
    .rd_en(stg4_pop_0),
    .empty(c1_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_c1)
);
fifo_64x512 c2_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_c2),
    .wr_en(mc_rsp_push_c2),
    .dout(check_unaligned[191:128]),
    .rd_en(stg4_pop_0),
    .empty(c2_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_c2)
);
fifo_64x512 c3_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_c3),
    .wr_en(mc_rsp_push_c3),
    .dout(check_unaligned[255:192]),
    .rd_en(stg4_pop_0),
    .empty(c3_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_c3)
);
fifo_64x512 c4_fifo(
    .srst(r_reset),
    .clk(clk),
    .din(mc_rsp_data_c4),
    .wr_en(mc_rsp_push_c4),
    .dout(check_unaligned[319:256]),
    .rd_en(stg4_pop_0),
    .empty(c4_fifo_empty),
    .full(),
    .prog_full(mc_rsp_stall_c4)
);

reg [63:0] r_req_data_res;
reg r_req_st_res;
reg [47:0] vadr_res;
reg [47:0] r_req_vadr_res;

assign mc_req_vadr_res = r_req_vadr_res;
assign ref_check = check_unaligned >> {stg4_ref_index[4:0], 1'b0}; //[({stg4_read[4:0], 1'b0} + 199):{stg4_read[4:0], 1'b0}];
//comparator pops shifiter and read3fifo 
//assign is_match = ref_check == stg4_read;
//mux part of stage4 control
assign mc_req_data_res = r_req_data_res;
//stage4 pops comparator sends output to store fifo
assign mc_req_st_res = r_req_st_res;

integer i, j;
reg tmp;
reg [199:0] r_ref_check;
reg [19:0] mid_check;
reg [31:0] stg4_ref_index_0;
reg [31:0] stg4_ref_index_1;
reg [31:0] stg4_ref_index_2;
always @(posedge clk) begin
    stg4_ref_index_0 <= stg4_ref_index;
    stg4_ref_index_1 <= stg4_ref_index_0;
    stg4_ref_index_2 <= stg4_ref_index_1;
end

always @(posedge clk) begin
    //pipe2
    is_match <= &mid_check;

    //pipe1
    for(i = 0; i < 20; i = i + 1) begin
        tmp = 1;
        for(j = 0; j < 10; j = j + 1) begin
            tmp = tmp & (r_ref_check[i * 10 + j] == stg4_read[i * 10 + j]);
        end
        mid_check[i] <= tmp;
    end

    //pipe0
    r_ref_check <= ref_check;
end

always @(posedge clk) begin
    r_req_data_res <= is_match ? {21'H0, stg4_read_count, stg4_ref_index_2} : 0;
    r_req_st_res <= is_match ? stg4_pop_3 : 0;
    r_req_vadr_res <= vadr_res;

    if(idle_rst)
        vadr_res <= 48'h0;
    else
        if(start)
            case(aeId)
                0: vadr_res <= res_base;
                1: vadr_res <= res_base + 'h8;
                2: vadr_res <= res_base + 'h10;
                3: vadr_res <= res_base + 'h18;
            endcase
        else
            if(stg4_pop_3)
                vadr_res <= vadr_res + 'h20;
            else
                vadr_res <= vadr_res;
end

always @(posedge clk) begin
    if(mc_req_st_res)
        $display("res request:%X, %X", mc_req_vadr_res, mc_req_data_res);
end

//stage4 deals with stall to checker mc and from store mc

//add done control signal
//stall c_done a couple cycles
reg r_pre_done_1, r_pre_done_2;

always @(posedge clk) begin
    c_done = r_pre_done_2;
    r_pre_done_2 = r_pre_done_1;
    r_pre_done_1 = vadr_res >= (res_base + (read_size<<3));
end

endmodule
