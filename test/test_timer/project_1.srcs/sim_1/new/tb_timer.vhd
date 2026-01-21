library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Timer is
end tb_Timer;

architecture tb of tb_Timer is
    
    component Timer
        port (clk     : in std_logic;
              rst     : in std_logic;
              enable  : in std_logic;
              timeout : out std_logic);
    end component;

    
    signal clk     : std_logic := '0';
    signal rst     : std_logic := '0';
    signal enable  : std_logic := '0';
    signal timeout : std_logic;

    
    constant TbPeriod : time := 10 ns; 
    signal TbSimEnded : std_logic := '0';

begin
    dut : Timer
    port map (clk     => clk,
              rst     => rst,
              enable  => enable,
              timeout => timeout);
    clk_process : process
    begin
        while TbSimEnded /= '1' loop
            clk <= '0';
            wait for TbPeriod/2;
            clk <= '1';
            wait for TbPeriod/2;
        end loop;
        wait;
    end process;
    stimuli : process
    begin
        
        rst <= '0';
        enable <= '0';
        wait for 100 ns;
        rst <= '1';
        wait for 100 ns;
        enable <= '1';
        wait for 0.6 ms; 
        rst <= '0';
        enable <= '0';
        wait for 1 ms;
        TbSimEnded <= '1';
        report "Simulacion finalizada con exito";
        wait;
    end process;

end tb;

-- Configuración para el simulador
configuration cfg_tb_Timer of tb_Timer is
    for tb
    end for;
end cfg_tb_Timer;