library verilog;
use verilog.vl_types.all;
entity shep_fifo is
    generic(
        WIDTH           : integer := 64;
        DEPTH           : integer := 256;
        DBIT            : integer := 8
    );
    port(
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        wr_data         : in     vl_logic_vector;
        push            : in     vl_logic;
        rd_data         : out    vl_logic_vector;
        pop             : in     vl_logic;
        empty           : out    vl_logic;
        full            : out    vl_logic;
        afull           : out    vl_logic
    );
end shep_fifo;
