library verilog;
use verilog.vl_types.all;
entity testBlockFile_vlg_check_tst is
    port(
        data1read       : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end testBlockFile_vlg_check_tst;
