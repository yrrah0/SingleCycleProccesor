library verilog;
use verilog.vl_types.all;
entity ProcessorControl_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        opcode          : in     vl_logic_vector(5 downto 0);
        sampler_tx      : out    vl_logic
    );
end ProcessorControl_vlg_sample_tst;
