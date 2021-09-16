library verilog;
use verilog.vl_types.all;
entity regnIR is
    port(
        R               : in     vl_logic_vector(9 downto 0);
        Rin             : in     vl_logic;
        Clock           : in     vl_logic;
        Q               : out    vl_logic_vector(9 downto 0)
    );
end regnIR;
