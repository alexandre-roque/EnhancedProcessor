library verilog;
use verilog.vl_types.all;
entity TLB is
    port(
        enderecoVirtual : in     vl_logic_vector(15 downto 0);
        Clock           : in     vl_logic;
        DIN             : out    vl_logic_vector(15 downto 0);
        Data            : out    vl_logic_vector(15 downto 0)
    );
end TLB;
