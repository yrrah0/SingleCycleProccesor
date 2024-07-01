library verilog;
use verilog.vl_types.all;
entity instructionPCTest is
    port(
        clk             : in     vl_logic;
        resetbar        : in     vl_logic;
        PC              : out    vl_logic_vector(31 downto 0);
        newPC           : out    vl_logic_vector(31 downto 0)
    );
end instructionPCTest;
