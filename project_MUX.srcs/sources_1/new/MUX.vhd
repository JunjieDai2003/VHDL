library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all;
use IEEE.std_logic_textio.all;
library UNISIM;
use UNISIM.VComponents.all;

entity mux_2to1 is 
port (
in1 : in STD_LOGIC; 
in2: in STD_LOGIC; 
s : in STD_LOGIC; 
out_mux : out std_logic
);
end mux_2to1;

 
architecture behavioral of mux_2to1 is
begin 
process (in1 ,in2, s)
begin
if s = '0' then 
out_mux <= in1;
else 
out_mux <= in2;
end if;
end process;
end behavioral;


