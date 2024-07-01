library verilog;
use verilog.vl_types.all;
entity instructionPCTest_vlg_check_tst is
    port(
        newPC           : in     vl_logic_vector(31 downto 0);
        PC              : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end instructionPCTest_vlg_check_tst;
