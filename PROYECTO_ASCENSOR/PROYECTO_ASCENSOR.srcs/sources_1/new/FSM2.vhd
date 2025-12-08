library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM2 is
    port(
    clk: in std_logic ;
    rst: in std_logic;
    --"REGISTROS"
    piso_actual : out std_logic_vector(1 downto 0);
    piso_final: out std_logic_vector(1 downto 0);
    
    -- SALIDA DE MAQUINA
    motor: out std_logic_vector(1 downto 0);
    puerta: out std_logic;
    
    -- ENTRADA DE USUARIO
    planta_1, planta_2, planta_3, planta_4: in std_logic;
    sensor_motor: in std_logic -- Detector de paso de piso
    );
end FSM2;

architecture ascensor of FSM2 is
    type STATES is (REPOSO, SUBIENDO, BAJANDO, ANALIZANDO);
    signal current_state: STATES := REPOSO;
    signal next_state: STATES;
 ---------------------------------------------------------------------
    signal s_piso_actual: unsigned(1 downto 0):="00";
    signal s_piso_final: unsigned(1 downto 0):="00";
 ---------------------------------------------------------------------
    signal next_s_piso_actual: unsigned(1 downto 0);
    signal next_s_piso_final: unsigned(1 downto 0);
    
begin
    

    state_register: process (rst, clk)
    begin
        if rst = '1' then 
            current_state <= REPOSO;
            s_piso_actual <="00";
            s_piso_final <="00";
        elsif rising_edge(CLK) then
            current_state <= next_state;
            s_piso_actual <= next_s_piso_actual;
            s_piso_final <= next_s_piso_final;
        end if;
    end process;

    nextstate_ascensor: process(current_state, s_piso_actual, s_piso_final, 
                              planta_1, planta_2, planta_3, planta_4, sensor_motor)
    begin

        next_state <= current_state;
        next_s_piso_actual <= s_piso_actual;
        next_s_piso_final <= s_piso_final; 
        
        case current_state is
            when REPOSO =>
                
                if planta_1 = '1' then
                    next_s_piso_final <= "00";
                elsif planta_2 = '1' then
                    next_s_piso_final <= "01";
                elsif planta_3 = '1' then
                    next_s_piso_final <= "10";
                elsif planta_4 = '1' then
                    next_s_piso_final <= "11";
                end if;
                
               
                if next_s_piso_final > s_piso_actual then
                    next_state <= SUBIENDO;
                elsif next_s_piso_final < s_piso_actual then
                    next_state <= BAJANDO;
                end if;

            when SUBIENDO =>
                
                if sensor_motor = '1' then
                    next_s_piso_actual <= s_piso_actual + 1; 
                    next_state <= ANALIZANDO;
                end if;

            when BAJANDO =>
               
                if sensor_motor = '1' then
                    next_s_piso_actual <= s_piso_actual - 1; 
                    next_state <= ANALIZANDO;
                end if;

            when ANALIZANDO =>
               
                if s_piso_actual = s_piso_final then
                -- if s_piso_actual = next_s_piso_final then
                    next_state <= REPOSO; 
                elsif s_piso_actual < s_piso_final then
                    next_state <= SUBIENDO; 
                else 
                    next_state <= BAJANDO; 
                end if;

        end case;
    end process;


    salida: process(current_state)
    begin
        motor <= "00";
        puerta <= '0';  
        
        case current_state is
            when REPOSO =>
                puerta <= '1'; 
                motor <= "00";
            when SUBIENDO =>
                motor <= "01"; 
                puerta <= '0';
            when BAJANDO =>
                motor <= "10"; 
                puerta <= '0';
            when ANALIZANDO =>
                motor <= "00"; 
                puerta <= '0';
        end case;
    end process;
    
    -- Asignación final a los puertos
    piso_actual <= std_logic_vector(s_piso_actual);
    piso_final <= std_logic_vector(s_piso_final);

end architecture;