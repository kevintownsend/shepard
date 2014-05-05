module hashTb;
reg rst;
reg clk;
reg stall;
reg [199:0] key;
reg [31:0] seed;
reg [31:0] table_size;
reg [1:0] ctr_in;
wire [199:0] key_out;
wire [31:0] table_index;
wire [1:0] ctr_out;

hash dut(
    .rst(rst),
    .clk(clk),
    .stall(stall),
    .key(key),
    .seed(seed),
    .table_size(table_size),
    .ctr_in(ctr_in),
    .key_out(key_out),
    .table_index(table_index),
    .ctr_out(ctr_out)
);

wire [1:0] ctr_tv [3:0];
wire [199:0] key_tv [3:0];
wire [31:0] seed_tv [3:0];
wire [31:0] table_index_tv [3:0];

assign ctr_tv[0] = 2'b0;
assign ctr_tv[1] = 2'b1;
assign key_tv[0] = 200'H14E21F5976ED08A2D4B7A959595A58754E99D50D50D50D50D5;
assign key_tv[1] = 200'H0;

assign table_index_tv[0] = 32'H2EA4;

initial begin
    stall = 0;
    seed = 0;
    table_size = 32'H4C62;
    //ctr_in = 0;
    //key = key_tv[0];
end

initial begin
    rst = 1;
    #100 rst = 0;
end

initial begin
    clk = 0;
    forever
        #20 clk = ~clk;
end

reg begun;
reg start;
always @(posedge clk) begin
    ctr_in = 0;
    key = 0;
    if(table_index == table_index_tv[0])
        $display("match");
    if(rst) begin
        start = 0;
        begun = 0;
    end
    else
        begin
            if(!begun) begin
                start = 1;
                begun = 1;
            end
            else
                if(start) begin
                    start = 0;
                    begun = 1;
                    ctr_in = 3;
                    key = key_tv[0];
                end
        end
end

endmodule
