library verilog;
use verilog.vl_types.all;
entity testBlockFile_vlg_sample_tst is
    port(
        clk             : in     vl_logic;
        data            : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end testBlockFile_vlg_sample_tst;
