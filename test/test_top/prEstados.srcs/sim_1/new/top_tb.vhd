-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Thu, 27 Nov 2025 10:41:43 GMT
-- Request id : cfwk-fed377c2-69282ae7d0258

library ieee;
use ieee.std_logic_1164.all;

entity tb_fsm is
end tb_fsm;

architecture tb of tb_fsm is

    component fsm
        port (RESET      : in std_logic;
              CLK        : in std_logic;
              PUSHBUTTON : in std_logic;
              LIGHT      : out std_logic_vector (0 to 3));
    end component;

    signal RESET      : std_logic;
    signal CLK        : std_logic;
    signal PUSHBUTTON : std_logic;
    signal LIGHT      : std_logic_vector (0 to 3);

    constant TbPeriod : time := 100 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : fsm
    port map (RESET      => RESET,
              CLK        => CLK,
              PUSHBUTTON => PUSHBUTTON,
              LIGHT      => LIGHT);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that CLK is really your main clock signal
    CLK <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        PUSHBUTTON <= '0';

        -- Reset generation
        -- ***EDIT*** Check that RESET is really your reset signal
        RESET <= '0';
        wait for 100 ns;
        RESET <= '1';
        wait for 100 ns;

        -- ***EDIT*** Add stimuli here
        wait for 10 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_fsm of tb_fsm is
    for tb
    end for;
end cfg_tb_fsm;