library verilog;
use verilog.vl_types.all;
entity testBlockUnit is
    port(
        q               : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        reset           : in     vl_logic
    );
end testBlockUnit;
