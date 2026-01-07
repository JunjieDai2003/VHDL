library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM is
    port(
        clk: in std_logic ;
        rst: in std_logic;
        --salida para indicar mi posiciion y mi destino
        piso_actual : out std_logic_vector(3 downto 0);
        piso_final  : out std_logic_vector(3 downto 0);
        -- saida para ver si el motor sube o baja
        motor  : out std_logic_vector(1 downto 0);-- salida led y para temporizador
        --salida para ver si la puerta esta abierta o no
        puerta : out std_logic;
        --seleccionado por el usuario
        -- planta_1, planta_2, planta_3, planta_4: in std_logic;
        planta_1, planta_2, planta_3, planta_4: in std_logic;
        --similar fin de carrera
        sensor_motor: in std_logic;
        -- temporizador
        timeout_in : in std_logic
    );
end FSM;

architecture ascensor of FSM is

    type STATES is (REPOSO, SUBIENDO, BAJANDO, ANALIZANDO);
    signal current_state: STATES := REPOSO;
    signal next_state   : STATES;

    signal s_piso_actual      : unsigned(3 downto 0) := (others => '0');
    signal s_piso_final       : unsigned(3 downto 0) := (others => '0');
    --
    signal next_s_piso_actual : unsigned(3 downto 0);
    signal next_s_piso_final  : unsigned(3 downto 0);

begin

    state_register: process (rst, clk)
    begin
        if rst = '0' then 
            --resetep, teniendo en cuenta que se resetea con 0
            current_state   <= REPOSO;
            s_piso_actual   <= (others => '0');
            s_piso_final    <= (others => '0');
        elsif rising_edge(clk) then
             -- asignacion de señal
            current_state   <= next_state;
            s_piso_actual   <= next_s_piso_actual;
            s_piso_final    <= next_s_piso_final;
        end if;
    end process;

    nextstate_ascensor: process(current_state, s_piso_actual, s_piso_final,
                                planta_1, planta_2, planta_3, planta_4, sensor_motor, timeout_in)
        --variable para cambiar su valor dentro de process y hacer comparacion en reposo                        
        variable objetivo : unsigned(3 downto 0);
    begin
        -- asignacion de señal
        next_state           <= current_state;
        next_s_piso_actual   <= s_piso_actual;
        next_s_piso_final    <= s_piso_final;

        case current_state is
            when REPOSO =>
                
                objetivo := s_piso_final; 

                if planta_1 = '1' then
                   objetivo := "0000"; 
                elsif planta_2 = '1' then
                   objetivo := "0001"; 
                elsif planta_3 = '1' then
                  objetivo := "0010";
                elsif planta_4 = '1' then
                   objetivo := "0011"; 
                end if;
                
               --cargo el valor para "llevarlo fuera"
                next_s_piso_final <= objetivo; 

                -- comparo
                -- por eso use variable, para que el objetivo se actualice
                -- y no sea de anterior
                if objetivo  > s_piso_actual then
                    next_state <= SUBIENDO; 
                elsif objetivo  < s_piso_actual then
                    next_state <= BAJANDO; 
                elsif objetivo  = s_piso_actual then
                     next_state <= REPOSO; 
                end if;
            --sube hasta sensor fin de carrera o llega los 3 segundos
            when SUBIENDO =>
                if sensor_motor = '1' or timeout_in = '1' then
                    next_s_piso_actual <= s_piso_actual + 1;
                    next_state <= ANALIZANDO;
                end if;

            when BAJANDO =>
                if sensor_motor = '1' or timeout_in = '1' then
                    next_s_piso_actual <= s_piso_actual - 1;
                    next_state <= ANALIZANDO;
                end if;

            when ANALIZANDO =>
                
                if s_piso_actual = s_piso_final then 
                    next_state <= REPOSO; 
                elsif s_piso_actual < s_piso_final then 
                    next_state <= SUBIENDO;
                else
                    next_state <= BAJANDO; 
                end if;
        end case;
    end process;
    --gestionar las salidas en funcion de estado actual
    salida: process(current_state)
    begin
        motor  <= "00";
        puerta <= '0';
        case current_state is
            when REPOSO =>
                puerta <= '1';
                motor  <= "00";
            when SUBIENDO =>
                motor  <= "01";
                puerta <= '0';
            when BAJANDO =>
                motor  <= "10";
                puerta <= '0';
            when ANALIZANDO =>
                motor  <= "00";
                puerta <= '0';
        end case;
    end process;
    --asignacion de salida
    piso_actual <= std_logic_vector(s_piso_actual);
    piso_final  <= std_logic_vector(s_piso_final);

end architecture;
