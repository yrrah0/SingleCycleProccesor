library verilog;
use verilog.vl_types.all;
entity ProcessorMIPSBenchTest is
    port(
        ValueSelect     : in     vl_logic_vector(2 downto 0);
        GClock          : in     vl_logic;
        GResetBar       : in     vl_logic;
        MuxOut          : out    vl_logic_vector(7 downto 0);
        InstructionOut  : out    vl_logic_vector(31 downto 0);
        BranchOut       : out    vl_logic;
        ZeroOut         : out    vl_logic;
        MemWriteOut     : out    vl_logic;
        RegWriteOut     : out    vl_logic;
        JumpO           : out    vl_logic;
        PCOut           : out    vl_logic_vector(31 downto 0);
        PCin            : out    vl_logic_vector(31 downto 0);
        PC4AddedO       : out    vl_logic_vector(31 downto 0);
        BranchAddressO  : out    vl_logic_vector(31 downto 0);
        JumpAddressO    : out    vl_logic_vector(31 downto 0);
        BranchOffsetO   : out    vl_logic_vector(31 downto 0);
        BranchMuxO      : out    vl_logic_vector(31 downto 0);
        ReadReg1O       : out    vl_logic_vector(4 downto 0);
        ReadReg2O       : out    vl_logic_vector(4 downto 0);
        WriteRegO       : out    vl_logic_vector(4 downto 0)
    );
end ProcessorMIPSBenchTest;
