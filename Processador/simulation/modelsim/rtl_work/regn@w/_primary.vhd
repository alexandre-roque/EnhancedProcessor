library verilog;
use verilog.vl_types.all;
entity regnW is
    port(
        R               : in     vl_logic;
        Clock           : in     vl_logic;
        Q               : out    vl_logic
    );
end regnW;
