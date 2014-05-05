module hash(
    input rst,
    input clk,
    input stall,
    input [199:0] key,
    input [31:0] seed,
    input [31:0] table_size,
    input [1:0] ctr_in,
    output [199:0] key_out,
    output [31:0] table_index,
    output [1:0] ctr_out
);

`define PIPE_STGS 35
`define L_PIPE_STG 34

reg [1:0] r_ctr_pipe[0:`L_PIPE_STG], c_ctr_pipe[0:`L_PIPE_STG];
reg [199:0] r_key_pipe[0:`L_PIPE_STG], c_key_pipe[0:`L_PIPE_STG];
reg [63:0] r_h0_pipe[0:`L_PIPE_STG], c_h0_pipe[0:`L_PIPE_STG];
reg [63:0] r_h1_pipe[0:`L_PIPE_STG], c_h1_pipe[0:`L_PIPE_STG];
reg [63:0] r_h2_pipe[0:`L_PIPE_STG], c_h2_pipe[0:`L_PIPE_STG];
reg [63:0] r_h3_pipe[0:`L_PIPE_STG], c_h3_pipe[0:`L_PIPE_STG];

reg [199:0] r_key_out;
reg [1:0] r_ctr_out;
reg [31:0] r_table_index_out;

assign key_out = r_key_out;
assign table_index = r_table_index_out;
assign ctr_out = r_ctr_out;

reg [63:0] div_shft [0:7];

always @(posedge clk) begin
end

integer i;
reg [63:0] r_mask, c_mask;
always @(posedge clk)
    r_mask = c_mask;

always @* begin
    c_mask[63:39] = 25'H0;
    for(i = 38; i >= 7; i = i - 1) begin
        c_mask[i] = c_mask[i + 1] | table_size[i - 7];
    end
    c_mask[6:0] = 7'H7F;
end

always @* begin
    for(i = 0; i < 8; i = i + 1) begin
        div_shft[i] = {32'H0, table_size} << (7-i);
    end
end

always @(posedge clk) begin
    if (rst || stall) begin
        r_key_out = 0;
        r_ctr_out = 0;
        r_table_index_out = 0;
    end
    else begin
        r_key_out = r_key_pipe[`L_PIPE_STG];
        r_ctr_out = r_ctr_pipe[`L_PIPE_STG];
        r_table_index_out = r_h0_pipe[`L_PIPE_STG][31:0];
    end

    //combinational block
    if (stall) begin
        for(i = 0; i < `PIPE_STGS; i = i + 1) begin
            c_ctr_pipe[i] = r_ctr_pipe[i];
            c_key_pipe[i] = r_key_pipe[i];
            c_h0_pipe[i] = r_h0_pipe[i];
            c_h1_pipe[i] = r_h1_pipe[i];
            c_h2_pipe[i] = r_h2_pipe[i];
            c_h3_pipe[i] = r_h3_pipe[i];
        end
    end
    else begin
        c_ctr_pipe[0] = ctr_in;
        c_key_pipe[0] = key;
        c_h0_pipe[0] = {32'H0, seed};
        c_h1_pipe[0] = {32'H0, seed};
        c_h2_pipe[0] = 64'HDEADBEEFDEADBEEF;
        c_h3_pipe[0] = 64'HDEADBEEFDEADBEEF;
        for(i = 0; i < `PIPE_STGS - 1; i = i + 1) begin
            c_ctr_pipe[i + 1] = r_ctr_pipe[i];
            c_key_pipe[i + 1] = r_key_pipe[i];
            c_h0_pipe[i + 1] = r_h0_pipe[i];
            c_h1_pipe[i + 1] = r_h1_pipe[i];
            c_h2_pipe[i + 1] = r_h2_pipe[i];
            c_h3_pipe[i + 1] = r_h3_pipe[i];
        end
        //Handles first 16 bytes
        c_h2_pipe[1] = r_h2_pipe[0] + r_key_pipe[0][63:0];
        c_h3_pipe[1] = r_h3_pipe[0] + r_key_pipe[0][127:64];

        //mix
        c_h2_pipe[2] = {r_h2_pipe[1][13:0], r_h2_pipe[1][63:14]} + r_h3_pipe[1];
        c_h0_pipe[2] = r_h0_pipe[1] ^ c_h2_pipe[2];
        c_h3_pipe[3] = {r_h3_pipe[2][11:0], r_h3_pipe[2][63:12]} + r_h0_pipe[2];
        c_h1_pipe[3] = r_h1_pipe[2] ^ c_h3_pipe[3];
        c_h0_pipe[4] = {r_h0_pipe[3][33:0], r_h0_pipe[3][63:34]} + r_h1_pipe[3];
        c_h2_pipe[4] = r_h2_pipe[3] ^ c_h0_pipe[4];
        c_h1_pipe[5] = {r_h1_pipe[4][22:0], r_h1_pipe[4][63:23]} + r_h2_pipe[4];
        c_h3_pipe[5] = r_h3_pipe[4] ^ c_h1_pipe[5];
        c_h2_pipe[6] = {r_h2_pipe[5][9:0], r_h2_pipe[5][63:10]} + r_h3_pipe[5];
        c_h0_pipe[6] = r_h0_pipe[5] ^ c_h2_pipe[6];
        c_h3_pipe[7] = {r_h3_pipe[6][15:0], r_h3_pipe[6][63:16]} + r_h0_pipe[6];
        c_h1_pipe[7] = r_h1_pipe[6] ^ c_h3_pipe[7];
        c_h0_pipe[8] = {r_h0_pipe[7][25:0], r_h0_pipe[7][63:26]} + r_h1_pipe[7];
        c_h2_pipe[8] = r_h2_pipe[7] ^ c_h0_pipe[8];
        c_h1_pipe[9] = {r_h1_pipe[8][26:0], r_h1_pipe[8][63:27]} + r_h2_pipe[8];
        c_h3_pipe[9] = r_h3_pipe[8] ^ c_h1_pipe[9];
        c_h2_pipe[10] = {r_h2_pipe[9][1:0], r_h2_pipe[9][63:2]} + r_h3_pipe[9];
        c_h0_pipe[10] = r_h0_pipe[9] ^ c_h2_pipe[10];
        c_h3_pipe[11] = {r_h3_pipe[10][29:0], r_h3_pipe[10][63:30]} + r_h0_pipe[10];
        c_h1_pipe[11] = r_h1_pipe[10] ^ c_h3_pipe[11];
        c_h0_pipe[12] = {r_h0_pipe[11][58:0], r_h0_pipe[11][63:59]} + r_h1_pipe[11];
        c_h2_pipe[12] = r_h2_pipe[11] ^ c_h0_pipe[12];
        c_h1_pipe[13] = {r_h1_pipe[12][27:0], r_h1_pipe[12][63:28]} + r_h2_pipe[12];
        c_h3_pipe[13] = r_h3_pipe[12] ^ c_h1_pipe[13];

        //Handle the last 9 bytes
        c_h2_pipe[14] = r_h2_pipe[13] + r_key_pipe[13][191:128];
        c_h3_pipe[14] = (64'D25 << 56) + r_key_pipe[13][199:192];
        
        //ending mix
        c_h3_pipe[15] = r_h3_pipe[14] ^ r_h2_pipe[14];
        c_h2_pipe[15] = {r_h2_pipe[14][48:0], r_h2_pipe[14][63:49]};
        c_h3_pipe[15] = c_h3_pipe[15] + c_h2_pipe[15];
        c_h0_pipe[16] = r_h0_pipe[15] ^ r_h3_pipe[15];
        c_h3_pipe[16] = {r_h3_pipe[15][11:0], r_h3_pipe[15][63:12]};
        c_h0_pipe[16] = c_h0_pipe[16] + c_h3_pipe[16];
        c_h1_pipe[17] = r_h1_pipe[16] ^ r_h0_pipe[16];
        c_h0_pipe[17] = {r_h0_pipe[16][37:0], r_h0_pipe[16][63:38]};
        c_h1_pipe[17] = c_h1_pipe[17] + c_h0_pipe[17];
        c_h2_pipe[18] = r_h2_pipe[17] ^ r_h1_pipe[17];
        c_h1_pipe[18] = {r_h1_pipe[17][12:0], r_h1_pipe[17][63:13]};
        c_h2_pipe[18] = c_h2_pipe[18] + c_h1_pipe[18];
        c_h3_pipe[19] = r_h3_pipe[18] ^ r_h2_pipe[18];
        c_h2_pipe[19] = {r_h2_pipe[18][35:0], r_h2_pipe[18][63:36]};
        c_h3_pipe[19] = c_h3_pipe[19] + c_h2_pipe[19];
        c_h0_pipe[20] = r_h0_pipe[19] ^ r_h3_pipe[19];
        c_h3_pipe[20] = {r_h3_pipe[19][54:0], r_h3_pipe[19][63:55]};
        c_h0_pipe[20] = c_h0_pipe[20] + c_h3_pipe[20];
        c_h1_pipe[21] = r_h1_pipe[20] ^ r_h0_pipe[20];
        c_h0_pipe[21] = {r_h0_pipe[20][16:0], r_h0_pipe[20][63:17]};
        c_h1_pipe[21] = c_h1_pipe[21] + c_h0_pipe[21];
        c_h2_pipe[22] = r_h2_pipe[21] ^ r_h1_pipe[21];
        c_h1_pipe[22] = {r_h1_pipe[21][9:0], r_h1_pipe[21][63:10]};
        c_h2_pipe[22] = c_h2_pipe[22] + c_h1_pipe[22];
        c_h3_pipe[23] = r_h3_pipe[22] ^ r_h2_pipe[22];
        c_h2_pipe[23] = {r_h2_pipe[22][31:0], r_h2_pipe[22][63:32]};
        c_h3_pipe[23] = c_h3_pipe[23] + c_h2_pipe[23];
        c_h0_pipe[24] = r_h0_pipe[23] ^ r_h3_pipe[23];
        c_h3_pipe[24] = {r_h3_pipe[23][38:0], r_h3_pipe[23][63:39]};
        c_h0_pipe[24] = c_h0_pipe[24] + c_h3_pipe[24];
        c_h1_pipe[25] = r_h1_pipe[24] ^ r_h0_pipe[24];
        c_h0_pipe[25] = {r_h0_pipe[24][0:0], r_h0_pipe[24][63:1]};
        c_h1_pipe[25] = c_h1_pipe[25] + c_h0_pipe[25];
        
        //handle range
        c_h0_pipe[26] = r_h0_pipe[25] & r_mask;
        for(i = 0; i < 8; i = i + 1)begin
            if(r_h0_pipe[26 + i] >= div_shft[i])
                c_h0_pipe[27 + i] = r_h0_pipe[26 + i] - div_shft[i];
        end 
    end

    //register block
    if (rst) begin
        for(i = 0; i < `PIPE_STGS; i = i + 1) begin
            r_ctr_pipe[i] = 0;
            r_key_pipe[i] = 0;
            r_h0_pipe[i] = 0;
            r_h1_pipe[i] = 0;
            r_h2_pipe[i] = 0;
            r_h3_pipe[i] = 0;
        end
    end
    else begin
        for(i = 0; i < `PIPE_STGS; i = i + 1) begin
            r_ctr_pipe[i] = c_ctr_pipe[i];
            r_key_pipe[i] = c_key_pipe[i];
            r_h0_pipe[i] = c_h0_pipe[i];
            r_h1_pipe[i] = c_h1_pipe[i];
            r_h2_pipe[i] = c_h2_pipe[i];
            r_h3_pipe[i] = c_h3_pipe[i];
        end
    end
end

endmodule
