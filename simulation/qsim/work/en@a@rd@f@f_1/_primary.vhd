library verilog;
use verilog.vl_types.all;
entity enARdFF_1 is
    port(
        i_d             : in     vl_logic;
        i_en            : in     vl_logic;
        clk             : in     vl_logic;
        i_resetBar      : in     vl_logic;
        o_q             : out    vl_logic
    );
end enARdFF_1;
