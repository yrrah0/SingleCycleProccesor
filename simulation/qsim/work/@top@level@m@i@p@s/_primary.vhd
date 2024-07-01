library verilog;
use verilog.vl_types.all;
entity TopLevelMIPS is
    port(
        RegWrite        : out    vl_logic;
        clk             : in     vl_logic;
        ResetBar        : in     vl_logic;
        ValueIn         : in     vl_logic_vector(2 downto 0);
        MemWrite        : out    vl_logic;
        Zero            : out    vl_logic;
        Branch          : out    vl_logic;
        InstructOut     : out    vl_logic_vector(31 downto 0);
        OutMux          : out    vl_logic_vector(7 downto 0)
    );
end TopLevelMIPS;
