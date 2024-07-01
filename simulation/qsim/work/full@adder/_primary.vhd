library verilog;
use verilog.vl_types.all;
entity fullAdder is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        S               : out    vl_logic;
        Cout            : out    vl_logic
    );
end fullAdder;
