library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Timer is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enable : in STD_LOGIC;
        timeout : out STD_LOGIC
    );
end Timer;

architecture Behavioral of Timer is
    --3s = x/100mhz x= 300000000
    signal TRES_SEGUNDOS : unsigned(28 downto 0) := to_unsigned(300000000, 29);
    signal counter : unsigned(28 downto 0) := (others => '0');
begin

    process(clk, rst)
    begin
        if rst = '0' then
            counter <= (others => '0');
            timeout <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then
                if counter < TRES_SEGUNDOS then
                    counter <= counter + 1;
                    timeout <= '0';
                else
                    timeout <= '1';
                end if;
            else
                counter <= (others => '0');
                timeout <= '0';
        end if;
        end if;
    end process;

end Behavioral;