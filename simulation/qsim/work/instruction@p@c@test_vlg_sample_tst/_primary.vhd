library verilog;
use verilog.vl_types.all;
entity instructionPCTest_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        resetbar        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end instructionPCTest_vlg_sample_tst;
