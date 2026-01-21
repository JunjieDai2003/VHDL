library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Timer is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC; -- Reset activo en BAJO ('0')
        enable : in STD_LOGIC;
        timeout : out STD_LOGIC
    );
end Timer;

architecture Behavioral of Timer is
    -- 1ms @ 100MHz = 100,000 ciclos. Requiere 17 bits (2^17 = 131,072)
    constant LIMITE_1MS : unsigned(16 downto 0) := to_unsigned(50000, 17);
    signal counter : unsigned(16 downto 0) := (others => '0');
begin

    process(clk, rst)
    begin
        if rst = '0' then
            counter <= (others => '0');
            timeout <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then
                if counter < LIMITE_1MS - 1 then
                    counter <= counter + 1;
                    timeout <= '0';
                else
                    timeout <= '1'; -- Se activa al llegar a 1ms
                    -- Para que sea cíclico, podrías poner: counter <= (others => '0');
                end if;
            else
                counter <= (others => '0');
                timeout <= '0';
            end if;
        end if;
    end process;

end Behavioral;