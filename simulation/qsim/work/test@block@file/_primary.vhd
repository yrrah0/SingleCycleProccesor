library verilog;
use verilog.vl_types.all;
entity testBlockFile is
    port(
        data1read       : out    vl_logic_vector(31 downto 0);
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0)
    );
end testBlockFile;
