LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity decoder is 
port (
        clk          : in  std_logic;
        rst          : in  std_logic;
        mi_piso      : in  std_logic_vector(3 DOWNTO 0);
        destino_piso : in  std_logic_vector(3 DOWNTO 0);
        led          : out std_logic_vector(6 DOWNTO 0);
        an           : out std_logic_vector(7 downto 0)
    );
END ENTITY decoder;

architecture behavioral of decoder is
    
    -- parpadeo de 1 khz
    signal parpadeo       : integer range 0 to 100000 := 0;
    signal select_display : integer range 0 to 7      := 0;
    signal code           : std_logic_vector (3 downto 0);
    
begin

    process(clk, rst)
    begin
        if rst = '0' then
            parpadeo       <= 0;
            select_display <= 0;
        elsif rising_edge (clk) then 
            if parpadeo >= 100000 then 
                parpadeo <= 0;
                -- cada vez que cuenta hasta 100000 cambia de 0 a 7 o 7 a 0
                -- q son los dos dislays extremos
                if select_display = 0 then
                    select_display <= 7;
                else 
                    select_display <= 0;
                end if;
            else
                parpadeo <= parpadeo + 1;
            end if;
        end if;
    end process;

    process(select_display)
    begin
        --solo brillara el 0 o 7 en funcion de display seleccionado
        an <= (others => '1');
        an(select_display) <= '0';
    end process;

    process(select_display, mi_piso, destino_piso)
    begin
    -- mostrar el primer display mi direccion y ultimo display direccion final
        if select_display = 0 then
            code <= mi_piso;
        elsif  select_display = 7 then
            code <= destino_piso;
        end if;
    end process;

    WITH code SELECT
        led <= "0000001" WHEN "0000",
               "1001111" WHEN "0001",
               "0010010" WHEN "0010",
               "0000110" WHEN "0011",
               "1111110" WHEN others;

END ARCHITECTURE behavioral;