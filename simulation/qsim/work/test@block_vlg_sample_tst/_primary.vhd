library verilog;
use verilog.vl_types.all;
entity testBlock_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        ResetBar        : in     vl_logic;
        ValueIn         : in     vl_logic_vector(2 downto 0);
        sampler_tx      : out    vl_logic
    );
end testBlock_vlg_sample_tst;
