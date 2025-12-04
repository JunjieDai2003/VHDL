
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.textio.all;
use IEEE.std_logic_textio.all;
library UNISIM;
use UNISIM.VComponents.all;

entity tb_mux_2to1 is 
end tb_mux_2to1;

architecture tb of tb_mux_2to1 is

component mux_2to1
port ( in1 : in std_logic; 
       in2 : in std_logic; 
       s : in std_logic; 
       out_mux : out std_logic);
end component;

signal  in1 : std_logic;
signal in2 : std_logic;
signal s : std_logic; 
signal out_mux : std_logic;

constant TbPeriod : time :=1000ns;
signal TbClock: std_logic := '0';
signal TbSimEnded : std_logic := '0';

begin dut : mux_2to1
port map (in1 =>in1,
          in2 =>in2,
          s =>s,
          out_mux => out_mux);
          
TbClock <= not tbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

stiuli : process
begin 
in1 <= '1';
in2 <='0';
s <='0';

in1 <= '0' after 50 ns;
in2 <= '1' after 50 ns;
s <= '1' after 100 ns;
wait for 100 * TbPeriod; 
in1 <='1';
in2 <='0';
s <='1' after 100ms;
wait for 100* TbPeriod;

TbSimEnded <= '1';
wait;
end process; 

end tb;
