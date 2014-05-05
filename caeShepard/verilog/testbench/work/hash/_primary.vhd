library verilog;
use verilog.vl_types.all;
entity hash is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        stall           : in     vl_logic;
        key             : in     vl_logic_vector(199 downto 0);
        seed            : in     vl_logic_vector(31 downto 0);
        table_size      : in     vl_logic_vector(31 downto 0);
        ctr_in          : in     vl_logic_vector(1 downto 0);
        key_out         : out    vl_logic_vector(199 downto 0);
        table_index     : out    vl_logic_vector(31 downto 0);
        ctr_out         : out    vl_logic_vector(1 downto 0)
    );
end hash;
