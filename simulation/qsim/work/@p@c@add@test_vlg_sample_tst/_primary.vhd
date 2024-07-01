library verilog;
use verilog.vl_types.all;
entity PCAddTest_vlg_sample_tst is
    port(
        adderIn         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        resetbar        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end PCAddTest_vlg_sample_tst;
