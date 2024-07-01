library verilog;
use verilog.vl_types.all;
entity testBlock_vlg_check_tst is
    port(
        Branch          : in     vl_logic;
        BranchAddress   : in     vl_logic_vector(31 downto 0);
        BranchMux       : in     vl_logic_vector(31 downto 0);
        Branchoffset    : in     vl_logic_vector(31 downto 0);
        InstructOut     : in     vl_logic_vector(31 downto 0);
        JumpAddress     : in     vl_logic_vector(31 downto 0);
        MemWrite        : in     vl_logic;
        OutMux          : in     vl_logic_vector(7 downto 0);
        PC4Added        : in     vl_logic_vector(31 downto 0);
        PCinO           : in     vl_logic_vector(31 downto 0);
        PCOutO          : in     vl_logic_vector(31 downto 0);
        ReadReg1        : in     vl_logic_vector(4 downto 0);
        ReadReg2        : in     vl_logic_vector(4 downto 0);
        RegWrite        : in     vl_logic;
        WriteReg        : in     vl_logic_vector(4 downto 0);
        Zero            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end testBlock_vlg_check_tst;
