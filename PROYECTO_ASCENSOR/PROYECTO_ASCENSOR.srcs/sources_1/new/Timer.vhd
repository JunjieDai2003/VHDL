library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Timer is
    Port ( 
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enable : in STD_LOGIC;
        tiempo_limite : out STD_LOGIC
    );
end Timer;

architecture Behavioral of Timer is
    
    constant TRES_SEGUNDOS :integer :=300000000;
    signal contador : integer range 0 to 300000000;
begin

    process(clk, rst)
    begin
        if rst = '0' then
            contador <= 0;
            tiempo_limite <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then
                if contador < TRES_SEGUNDOS then
                    contador <= contador + 1; -- puede hacer esto pq precess clk
                    tiempo_limite <= '0';
                else
                    tiempo_limite <= '1';
                end if;
            else
                contador <= 0;
                tiempo_limite <= '0';
        end if;
        end if;
    end process;

end Behavioral;