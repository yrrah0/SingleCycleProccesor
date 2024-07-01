library verilog;
use verilog.vl_types.all;
entity fullAdder32bit is
    port(
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        C               : in     vl_logic;
        S               : out    vl_logic_vector(31 downto 0);
        Cout            : out    vl_logic
    );
end fullAdder32bit;
