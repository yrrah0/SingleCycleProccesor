library verilog;
use verilog.vl_types.all;
entity PCAddTest is
    port(
        adderIn         : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        resetbar        : in     vl_logic;
        PC              : out    vl_logic_vector(31 downto 0);
        newPC           : out    vl_logic_vector(31 downto 0)
    );
end PCAddTest;
