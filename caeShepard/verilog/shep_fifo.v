module shep_fifo(reset, clk, wr_data, push, rd_data, pop, empty, full, afull);
parameter width = 64;
parameter depth = 256;
parameter dbit = 8;
input reset;
input clk;
input [(width-1):0] wr_data;
input push;
output [(width-1):0]rd_data;
input pop;
output empty;
output full;
output afull;

reg [(dbit - 1):0] rd_ptr, wr_ptr;
reg [(width - 1):0] fifo [(depth-1):0];
assign rd_data = fifo[rd_ptr];

assign empty = (rd_ptr == wr_ptr);
assign full = (rd_ptr == (wr_ptr + 'h1));
reg r_afull;
always @(posedge clk)
    r_afull <= (((rd_ptr - wr_ptr - 1) < 'h7));
assign afull = r_afull;

always @(posedge clk) begin
    if(reset) begin
        wr_ptr <= 'h0;
        rd_ptr <= 'h0;
    end
    else begin
        if(push) begin
            fifo[wr_ptr] <= wr_data;
            wr_ptr <= wr_ptr + 1;
        end
        if(pop) begin
            rd_ptr <= rd_ptr + 1;
        end
    end
end

endmodule
