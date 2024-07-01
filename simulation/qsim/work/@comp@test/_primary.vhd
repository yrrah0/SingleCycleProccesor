library verilog;
use verilog.vl_types.all;
entity CompTest is
    port(
        q               : out    vl_logic_vector(31 downto 0);
        sel             : in     vl_logic;
        Ain             : in     vl_logic_vector(31 downto 0);
        Bin             : in     vl_logic_vector(31 downto 0)
    );
end CompTest;
