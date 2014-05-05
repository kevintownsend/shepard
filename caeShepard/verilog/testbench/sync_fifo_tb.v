module sync_fifo_tb();

reg clk;
reg reset;
reg push;
reg pop;
wire empty;
wire full;
wire afull;
wire [7:0] rd_data;
reg [7:0] wr_data;

sync_fifo #(.width(8), .depth(8)) fifo(
    .clk(clk),
    .reset(reset),
    .push(push),
    .pop(pop),
    .empty(empty),
    .full(full),
    .afull(afull),
    .rd_data(rd_data),
    .wr_data(wr_data)
    );

initial begin
    clk = 0;
    forever
        #50 clk = !clk;
end

initial begin
    reset = 1;
    #300 reset = 0;
end

endmodule
