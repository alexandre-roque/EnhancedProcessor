library verilog;
use verilog.vl_types.all;
entity ULA is
    port(
        Dado1           : in     vl_logic_vector(15 downto 0);
        Dado2           : in     vl_logic_vector(15 downto 0);
        ULAOp           : in     vl_logic_vector(3 downto 0);
        Result          : out    vl_logic_vector(15 downto 0)
    );
end ULA;
