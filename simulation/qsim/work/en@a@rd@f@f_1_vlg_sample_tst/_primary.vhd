library verilog;
use verilog.vl_types.all;
entity enARdFF_1_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        i_d             : in     vl_logic;
        i_en            : in     vl_logic;
        i_resetBar      : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end enARdFF_1_vlg_sample_tst;
