library verilog;
use verilog.vl_types.all;
entity TopLevelMIPS_vlg_check_tst is
    port(
        Branch          : in     vl_logic;
        InstructOut     : in     vl_logic_vector(31 downto 0);
        MemWrite        : in     vl_logic;
        OutMux          : in     vl_logic_vector(7 downto 0);
        RegWrite        : in     vl_logic;
        Zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end TopLevelMIPS_vlg_check_tst;
