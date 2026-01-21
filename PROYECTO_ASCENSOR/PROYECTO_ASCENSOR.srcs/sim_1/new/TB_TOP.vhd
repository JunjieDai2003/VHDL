-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Wed, 21 Jan 2026 16:05:23 GMT
-- Request id : cfwk-fed377c2-6970f943d054c

library ieee;
use ieee.std_logic_1164.all;

entity tb_top is
end tb_top;

architecture tb of tb_top is

    component top
        port (clk     : in std_logic;
              rst     : in std_logic;
              p1      : in std_logic;
              p2      : in std_logic;
              p3      : in std_logic;
              p4      : in std_logic;
              sensor  : in std_logic;
              motor   : out std_logic_vector (1 downto 0);
              puerta  : out std_logic;
              segment : out std_logic_vector (6 downto 0);
              an      : out std_logic_vector (7 downto 0));
    end component;

    signal clk     : std_logic;
    signal rst     : std_logic;
    signal p1      : std_logic;
    signal p2      : std_logic;
    signal p3      : std_logic;
    signal p4      : std_logic;
    signal sensor  : std_logic;
    signal motor   : std_logic_vector (1 downto 0);
    signal puerta  : std_logic;
    signal segment : std_logic_vector (6 downto 0);
    signal an      : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 10 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top
    port map (clk     => clk,
              rst     => rst,
              p1      => p1,
              p2      => p2,
              p3      => p3,
              p4      => p4,
              sensor  => sensor,
              motor   => motor,
              puerta  => puerta,
              segment => segment,
              an      => an);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
       rst <= '0';
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '1';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '1';
        wait for 10 * TbPeriod;
        
         p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '1';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
         p1 <= '0';
        p2 <= '1';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 10 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '1';
        wait for 5 * TbPeriod;
        
        p1 <= '0';
        p2 <= '0';
        p3 <= '0';
        p4 <= '0';
        sensor <= '0';
        wait for 5 * TbPeriod;
        
        rst <= '1';

        -- Reset generation
        -- ***EDIT*** Check that rst is really your reset signal
        rst <= '1';
        wait for 100 ns;
        rst <= '0';
        wait for 100 ns;

        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top of tb_top is
    for tb
    end for;
end cfg_tb_top;