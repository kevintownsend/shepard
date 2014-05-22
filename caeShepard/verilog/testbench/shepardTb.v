module test_shepard;

initial $display("testing shepard");
//TODO: replace mc_rsp_push with mc_rsp_push
//create reg for input to dut
//create wire for output from dut
reg rst, clk, idle, start;
wire stall;
reg [1:0] aeId;

wire mc_req_ld_r0;
wire [47:0] mc_req_vadr_r0;
reg mc_rd_rq_stall_r0;
reg mc_rsp_push_r0;
wire mc_rsp_stall_r0;
reg [63:0] mc_rsp_data_r0;
wire mc_req_ld_r1;
wire [47:0] mc_req_vadr_r1;
reg mc_rd_rq_stall_r1;
reg mc_rsp_push_r1;
wire mc_rsp_stall_r1;
reg [63:0] mc_rsp_data_r1;
wire mc_req_ld_r2;
wire [47:0] mc_req_vadr_r2;
reg mc_rd_rq_stall_r2;
reg mc_rsp_push_r2;
wire mc_rsp_stall_r2;
reg [63:0] mc_rsp_data_r2;
wire mc_req_ld_r3;
wire [47:0] mc_req_vadr_r3;
reg mc_rd_rq_stall_r3;
reg mc_rsp_push_r3;
wire mc_rsp_stall_r3;
reg [63:0] mc_rsp_data_r3;
wire mc_req_ld_r4;
wire [47:0] mc_req_vadr_r4;
reg mc_rd_rq_stall_r4;
reg mc_rsp_push_r4;
wire mc_rsp_stall_r4;
reg [63:0] mc_rsp_data_r4;
wire mc_req_ld_h0;
wire [47:0] mc_req_vadr_h0;
reg mc_rd_rq_stall_h0;
reg mc_rsp_push_h0;
wire mc_rsp_stall_h0;
reg [63:0] mc_rsp_data_h0;
wire mc_req_ld_h1;
wire [47:0] mc_req_vadr_h1;
reg mc_rd_rq_stall_h1;
reg mc_rsp_push_h1;
wire mc_rsp_stall_h1;
reg [63:0] mc_rsp_data_h1;
wire mc_req_ld_h2;
wire [47:0] mc_req_vadr_h2;
reg mc_rd_rq_stall_h2;
reg mc_rsp_push_h2;
wire mc_rsp_stall_h2;
reg [63:0] mc_rsp_data_h2;
wire mc_req_ld_h3;
wire [47:0] mc_req_vadr_h3;
reg mc_rd_rq_stall_h3;
reg mc_rsp_push_h3;
wire mc_rsp_stall_h3;
reg [63:0] mc_rsp_data_h3;
wire mc_req_ld_h4;
wire [47:0] mc_req_vadr_h4;
reg mc_rd_rq_stall_h4;
reg mc_rsp_push_h4;
wire mc_rsp_stall_h4;
reg [63:0] mc_rsp_data_h4;
wire mc_req_ld_c0;
wire [47:0] mc_req_vadr_c0;
reg mc_rd_rq_stall_c0;
reg mc_rsp_push_c0;
wire mc_rsp_stall_c0;
reg [63:0] mc_rsp_data_c0;
wire mc_req_ld_c1;
wire [47:0] mc_req_vadr_c1;
reg mc_rd_rq_stall_c1;
reg mc_rsp_push_c1;
wire mc_rsp_stall_c1;
reg [63:0] mc_rsp_data_c1;
wire mc_req_ld_c2;
wire [47:0] mc_req_vadr_c2;
reg mc_rd_rq_stall_c2;
reg mc_rsp_push_c2;
wire mc_rsp_stall_c2;
reg [63:0] mc_rsp_data_c2;
wire mc_req_ld_c3;
wire [47:0] mc_req_vadr_c3;
reg mc_rd_rq_stall_c3;
reg mc_rsp_push_c3;
wire mc_rsp_stall_c3;
reg [63:0] mc_rsp_data_c3;
wire mc_req_ld_c4;
wire [47:0] mc_req_vadr_c4;
reg mc_rd_rq_stall_c4;
reg mc_rsp_push_c4;
wire mc_rsp_stall_c4;
reg [63:0] mc_rsp_data_c4;

wire mc_req_st_res;
wire [47:0] mc_req_vadr_res;
wire [63:0] mc_req_data_res;
reg mc_wr_rq_stall_res;


reg [47:0] hash_base;
reg [31:0] hash_size;
reg [47:0] ref_base;
reg [47:0] read_base;
reg [31:0] read_size;
reg [47:0] res_base;

shepard dut(
    .rst(rst),
    .clk(clk),
    .idle(idle),
    .start(start),
    .stall(stall),
    .aeId(aeId),

    .mc_req_ld_r0(mc_req_ld_r0),
    .mc_req_vadr_r0(mc_req_vadr_r0),
    .mc_rd_rq_stall_r0(mc_rd_rq_stall_r0),
    .mc_rsp_push_r0(mc_rsp_push_r0),
    .mc_rsp_stall_r0(mc_rsp_stall_r0),
    .mc_rsp_data_r0(mc_rsp_data_r0),
    .mc_req_ld_r1(mc_req_ld_r1),
    .mc_req_vadr_r1(mc_req_vadr_r1),
    .mc_rd_rq_stall_r1(mc_rd_rq_stall_r1),
    .mc_rsp_push_r1(mc_rsp_push_r1),
    .mc_rsp_stall_r1(mc_rsp_stall_r1),
    .mc_rsp_data_r1(mc_rsp_data_r1),
    .mc_req_ld_r2(mc_req_ld_r2),
    .mc_req_vadr_r2(mc_req_vadr_r2),
    .mc_rd_rq_stall_r2(mc_rd_rq_stall_r2),
    .mc_rsp_push_r2(mc_rsp_push_r2),
    .mc_rsp_stall_r2(mc_rsp_stall_r2),
    .mc_rsp_data_r2(mc_rsp_data_r2),
    .mc_req_ld_r3(mc_req_ld_r3),
    .mc_req_vadr_r3(mc_req_vadr_r3),
    .mc_rd_rq_stall_r3(mc_rd_rq_stall_r3),
    .mc_rsp_push_r3(mc_rsp_push_r3),
    .mc_rsp_stall_r3(mc_rsp_stall_r3),
    .mc_rsp_data_r3(mc_rsp_data_r3),
    .mc_req_ld_h0(mc_req_ld_h0),
    .mc_req_vadr_h0(mc_req_vadr_h0),
    .mc_rd_rq_stall_h0(mc_rd_rq_stall_h0),
    .mc_rsp_push_h0(mc_rsp_push_h0),
    .mc_rsp_stall_h0(mc_rsp_stall_h0),
    .mc_rsp_data_h0(mc_rsp_data_h0),
    .mc_req_ld_h1(mc_req_ld_h1),
    .mc_req_vadr_h1(mc_req_vadr_h1),
    .mc_rd_rq_stall_h1(mc_rd_rq_stall_h1),
    .mc_rsp_push_h1(mc_rsp_push_h1),
    .mc_rsp_stall_h1(mc_rsp_stall_h1),
    .mc_rsp_data_h1(mc_rsp_data_h1),
    .mc_req_ld_c0(mc_req_ld_c0),
    .mc_req_vadr_c0(mc_req_vadr_c0),
    .mc_rd_rq_stall_c0(mc_rd_rq_stall_c0),
    .mc_rsp_push_c0(mc_rsp_push_c0),
    .mc_rsp_stall_c0(mc_rsp_stall_c0),
    .mc_rsp_data_c0(mc_rsp_data_c0),
    .mc_req_ld_c1(mc_req_ld_c1),
    .mc_req_vadr_c1(mc_req_vadr_c1),
    .mc_rd_rq_stall_c1(mc_rd_rq_stall_c1),
    .mc_rsp_push_c1(mc_rsp_push_c1),
    .mc_rsp_stall_c1(mc_rsp_stall_c1),
    .mc_rsp_data_c1(mc_rsp_data_c1),
    .mc_req_ld_c2(mc_req_ld_c2),
    .mc_req_vadr_c2(mc_req_vadr_c2),
    .mc_rd_rq_stall_c2(mc_rd_rq_stall_c2),
    .mc_rsp_push_c2(mc_rsp_push_c2),
    .mc_rsp_stall_c2(mc_rsp_stall_c2),
    .mc_rsp_data_c2(mc_rsp_data_c2),
    .mc_req_ld_c3(mc_req_ld_c3),
    .mc_req_vadr_c3(mc_req_vadr_c3),
    .mc_rd_rq_stall_c3(mc_rd_rq_stall_c3),
    .mc_rsp_push_c3(mc_rsp_push_c3),
    .mc_rsp_stall_c3(mc_rsp_stall_c3),
    .mc_rsp_data_c3(mc_rsp_data_c3),
    .mc_req_ld_c4(mc_req_ld_c4),
    .mc_req_vadr_c4(mc_req_vadr_c4),
    .mc_rd_rq_stall_c4(mc_rd_rq_stall_c4),
    .mc_rsp_push_c4(mc_rsp_push_c4),
    .mc_rsp_stall_c4(mc_rsp_stall_c4),
    .mc_rsp_data_c4(mc_rsp_data_c4),

    .mc_req_st_res(mc_req_st_res),
    .mc_req_vadr_res(mc_req_vadr_res),
    .mc_req_data_res(mc_req_data_res),
    .mc_wr_rq_stall_res(mc_wr_rq_stall_res),

    .hash_base(hash_base),
    .hash_size(hash_size),
    .ref_base(ref_base),
    .read_base(read_base),
    .read_size(read_size),
    .res_base(res_base)
);
//TODO: create test vectors
//TODO: create interaction between dut and test vectors

wire [255:0] reads_tv [3:0];
assign reads_tv[0] = 256'H0000000000000014E21F5976ED08A2D4B7A959595A58754E99D50D50D50D50D5;
assign reads_tv[1] = 256'h000000000042FFFF;
assign reads_tv[2] = 256'h0000000042FFFFFF;
assign reads_tv[3] = 256'h00000042FFFFFFFF;
wire [47:0] h0_adr_tv [3:0];
assign h0_adr_tv[0] = 48'H2EA4<<3;

wire [63:0] h0_return_tv [3:0];
assign h0_return_tv[0] = 64'H00003000000036F0;

wire [47:0] h1_adr_tv [3:0];
assign h1_adr_tv[0] = 48'H106F<<3;

wire [63:0] h1_return_tv [3:0];
assign h1_return_tv[0] = 64'H0002480000000000;

wire [47:0] c_adr_tv [4:0][3:0];
assign c_adr_tv[0][0] = 48'H0;
assign c_adr_tv[1][0] = 48'H8;
assign c_adr_tv[2][0] = 48'H10;
assign c_adr_tv[3][0] = 48'H18;
assign c_adr_tv[4][0] = 48'H20;

wire [319:0] c_return_tv [3:0];
assign c_return_tv[0] = 320'HDBB7A9776E99D59761904A21BB702514E21F5976ED08A2D4B7A959595A58754E99D50D50D50D50D5;

wire [63:0] res_data_tv [3:0];
assign res_data_tv[0] = 64'H0;

wire [47:0] res_vadr_tv [3:0];
assign res_vadr_tv[0] = 48'H0;

initial 
    begin
        rst = 0;
        #30 rst = 1;
        #20 rst = 0;
    end

initial
    begin
        clk = 0;
        forever #10 clk = !clk;
    end

always @(posedge clk)
    idle = 0;
reg r_begun;
reg [7:0] read_count;
//TODO:test r
//TODO:test h0
//TODO:test h1
//TODO:test c
//TODO:test res
always @(posedge clk) begin
    mc_rsp_push_r0 = 0;
    mc_rsp_push_r1 = 0;
    mc_rsp_push_r2 = 0;
    mc_rsp_push_r3 = 0;
    mc_rsp_push_h0 = 0;
    mc_rsp_push_h1 = 0;
    mc_rsp_push_c0 = 0;
    mc_rsp_push_c1 = 0;
    mc_rsp_push_c2 = 0;
    mc_rsp_push_c3 = 0;
    mc_rsp_push_c4 = 0;
    mc_rsp_data_r0 = 0;
    mc_rsp_data_r1 = 0;
    mc_rsp_data_r2 = 0;
    mc_rsp_data_r3 = 0;
    mc_rsp_data_h0 = 0;
    mc_rsp_data_h1 = 0;
    mc_rsp_data_c0 = 0;
    mc_rsp_data_c1 = 0;
    mc_rsp_data_c2 = 0;
    mc_rsp_data_c3 = 0;
    mc_rsp_data_c4 = 0;

    if(rst) begin
        r_begun = 0;
        start = 0;
        read_count = 0;
    end
    else begin
        if(r_begun == 0) begin
            start = 1;
            r_begun = 1;
            read_count = 0;
        end
        else begin
            start = 0;
            if(mc_req_ld_r0) begin
                mc_rsp_push_r0 = 1;
                mc_rsp_push_r1 = 1;
                mc_rsp_push_r2 = 1;
                mc_rsp_push_r3 = 1;
                mc_rsp_data_r0 = reads_tv[read_count][63:0];
                mc_rsp_data_r1 = reads_tv[read_count][127:64];
                mc_rsp_data_r2 = reads_tv[read_count][191:128];
                mc_rsp_data_r3 = reads_tv[read_count][255:192];
                read_count = read_count + 1;
            end
            if(mc_req_ld_h0) begin
                if(mc_req_vadr_h0 == h0_adr_tv[0])
                    $display("h0_adr correct");
                else
                    $display("h0_adr incorrect");
                mc_rsp_push_h0 = 1;
                mc_rsp_data_h0 = h0_return_tv[0];
            end
            if(mc_req_ld_h1) begin
                if(mc_req_vadr_h1 == h1_adr_tv[0])
                    $display("h1_adr correct");
                else
                    $display("h1_adr incorrect");
                mc_rsp_push_h1 = 1;
                mc_rsp_data_h1 = h1_return_tv[0];
            end
            if(mc_req_ld_c0) begin
                mc_rsp_push_c0 = 1;
                mc_rsp_push_c1 = 1;
                mc_rsp_push_c2 = 1;
                mc_rsp_push_c3 = 1;
                mc_rsp_push_c4 = 1;
                mc_rsp_data_c0 = c_return_tv[0][63:0];
                mc_rsp_data_c1 = c_return_tv[0][127:64];
                mc_rsp_data_c2 = c_return_tv[0][191:128];
                mc_rsp_data_c3 = c_return_tv[0][255:192];
                mc_rsp_data_c4 = c_return_tv[0][319:256];
                
            end
        end
    end
end
        
//look at stall

initial begin
    aeId = 0;
    hash_base = 0;
    hash_size = 32'H4C62;
    ref_base = 0;
    read_base = 0;
    read_size = 1;
    mc_rd_rq_stall_r0 = 0;
    mc_rd_rq_stall_r1 = 0;
    mc_rd_rq_stall_r2 = 0;
    mc_rd_rq_stall_r3 = 0;
    mc_rd_rq_stall_h0 = 0;
    mc_rd_rq_stall_h1 = 0;
    mc_rd_rq_stall_c0 = 0;
    mc_rd_rq_stall_c1 = 0;
    mc_rd_rq_stall_c2 = 0;
    mc_rd_rq_stall_c3 = 0;
    mc_rd_rq_stall_c4 = 0;
    mc_wr_rq_stall_res = 0;
end

endmodule
