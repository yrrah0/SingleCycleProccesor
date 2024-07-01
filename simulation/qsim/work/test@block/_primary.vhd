library verilog;
use verilog.vl_types.all;
entity testBlock is
    port(
        RegWrite        : out    vl_logic;
        clk             : in     vl_logic;
        ResetBar        : in     vl_logic;
        ValueIn         : in     vl_logic_vector(2 downto 0);
        MemWrite        : out    vl_logic;
        Zero            : out    vl_logic;
        Branch          : out    vl_logic;
        BranchAddress   : out    vl_logic_vector(31 downto 0);
        BranchMux       : out    vl_logic_vector(31 downto 0);
        Branchoffset    : out    vl_logic_vector(31 downto 0);
        InstructOut     : out    vl_logic_vector(31 downto 0);
        JumpAddress     : out    vl_logic_vector(31 downto 0);
        OutMux          : out    vl_logic_vector(7 downto 0);
        PC4Added        : out    vl_logic_vector(31 downto 0);
        PCinO           : out    vl_logic_vector(31 downto 0);
        PCOutO          : out    vl_logic_vector(31 downto 0);
        ReadReg1        : out    vl_logic_vector(4 downto 0);
        ReadReg2        : out    vl_logic_vector(4 downto 0);
        WriteReg        : out    vl_logic_vector(4 downto 0)
    );
end testBlock;
