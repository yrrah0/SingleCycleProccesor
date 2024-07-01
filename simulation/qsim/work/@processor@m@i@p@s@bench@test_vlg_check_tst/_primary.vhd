library verilog;
use verilog.vl_types.all;
entity ProcessorMIPSBenchTest_vlg_check_tst is
    port(
        BranchAddressO  : in     vl_logic_vector(31 downto 0);
        BranchMuxO      : in     vl_logic_vector(31 downto 0);
        BranchOffsetO   : in     vl_logic_vector(31 downto 0);
        BranchOut       : in     vl_logic;
        InstructionOut  : in     vl_logic_vector(31 downto 0);
        JumpAddressO    : in     vl_logic_vector(31 downto 0);
        JumpO           : in     vl_logic;
        MemWriteOut     : in     vl_logic;
        MuxOut          : in     vl_logic_vector(7 downto 0);
        PC4AddedO       : in     vl_logic_vector(31 downto 0);
        PCin            : in     vl_logic_vector(31 downto 0);
        PCOut           : in     vl_logic_vector(31 downto 0);
        ReadReg1O       : in     vl_logic_vector(4 downto 0);
        ReadReg2O       : in     vl_logic_vector(4 downto 0);
        RegWriteOut     : in     vl_logic;
        WriteRegO       : in     vl_logic_vector(4 downto 0);
        ZeroOut         : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end ProcessorMIPSBenchTest_vlg_check_tst;
