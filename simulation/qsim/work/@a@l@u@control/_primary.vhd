library verilog;
use verilog.vl_types.all;
entity ALUControl is
    port(
        ALUOp           : in     vl_logic_vector(1 downto 0);
        funct           : in     vl_logic_vector(5 downto 0);
        ALUControl      : out    vl_logic_vector(3 downto 0)
    );
end ALUControl;
