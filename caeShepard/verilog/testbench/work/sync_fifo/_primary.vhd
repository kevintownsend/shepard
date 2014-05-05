library verilog;
use verilog.vl_types.all;
entity sync_fifo is
    generic(
        depth           : integer := 256;
        width           : integer := 64
    );
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        push            : in     vl_logic;
        pop             : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        afull           : out    vl_logic;
        rd_data         : out    vl_logic_vector;
        wr_data         : in     vl_logic_vector
    );
end sync_fifo;
