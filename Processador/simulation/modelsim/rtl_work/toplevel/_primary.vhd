library verilog;
use verilog.vl_types.all;
entity toplevel is
    port(
        Resetn          : in     vl_logic;
        Clock           : in     vl_logic;
        Run             : in     vl_logic;
        R0              : out    vl_logic_vector(15 downto 0);
        R1              : out    vl_logic_vector(15 downto 0);
        R2              : out    vl_logic_vector(15 downto 0);
        R3              : out    vl_logic_vector(15 downto 0);
        R4              : out    vl_logic_vector(15 downto 0);
        R5              : out    vl_logic_vector(15 downto 0);
        R6              : out    vl_logic_vector(15 downto 0);
        R7              : out    vl_logic_vector(15 downto 0);
        Tstep_Q         : out    vl_logic_vector(2 downto 0)
    );
end toplevel;
