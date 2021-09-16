library verilog;
use verilog.vl_types.all;
entity processador is
    generic(
        n               : integer := 16
    );
    port(
        DIN             : in     vl_logic_vector(15 downto 0);
        Resetn          : in     vl_logic;
        Clock           : in     vl_logic;
        Run             : in     vl_logic;
        Done            : out    vl_logic;
        BusWires        : out    vl_logic_vector(15 downto 0);
        DataIN          : in     vl_logic_vector(15 downto 0);
        W               : out    vl_logic;
        ADDR            : out    vl_logic_vector(15 downto 0);
        DOUT            : out    vl_logic_vector(15 downto 0);
        \R7\            : out    vl_logic_vector;
        Tstep_Q         : out    vl_logic_vector(2 downto 0);
        DataFromMemory  : in     vl_logic_vector(15 downto 0);
        R0              : out    vl_logic_vector;
        R1              : out    vl_logic_vector;
        R2              : out    vl_logic_vector;
        R3              : out    vl_logic_vector;
        R4              : out    vl_logic_vector;
        R5              : out    vl_logic_vector;
        R6              : out    vl_logic_vector;
        \R7\            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of n : constant is 1;
end processador;
