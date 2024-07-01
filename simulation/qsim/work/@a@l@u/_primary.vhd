library verilog;
use verilog.vl_types.all;
entity ALU is
    port(
        i_a             : in     vl_logic_vector(7 downto 0);
        i_b             : in     vl_logic_vector(7 downto 0);
        i_ControlSig    : in     vl_logic_vector(3 downto 0);
        o_zero          : out    vl_logic;
        o_ALUResult     : out    vl_logic_vector(7 downto 0)
    );
end ALU;
