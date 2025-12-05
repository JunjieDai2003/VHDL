library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM is
    port(
    clk: in std_logic ;
    rst: in std_logic;
    --00 01 10 11
    -- no tenfgo aun muy claro si piso es in o out
    --mi piso debe ser out para luego comunicar con display
    --piso final debe ser in, es informacion recipida de flanco
    -- piso final no estoy muy seguro, voy a trabajar con out
    piso_actual : out std_logic_vector(1 downto 0); -- si tengo q operar seria unsigned
    piso_final: out std_logic_vector(1 downto 0);
    motor: out std_logic_vector(1 downto 0);
    puerta: out std_logic
    );
end FSM;

architecture ascensor of fsm is
    -- estados posibles
    type STATES is (REPOSO, SUBIENDO, BAJANDO, ANALIZANDO);
    signal current_state: STATES := REPOSO;
    signal next_state: STATES;
    
    --señal de las salidas
    signal s_piso_actual: unsigned(1 downto 0):="00";
    signal s_piso_final: unsigned(1 downto 0):="00";
  
  begin
  --registros
   state_register: process (rst,clk)
    begin
        if  rst = '0' then
                current_state <= REPOSO;
         elsif rising_edge(CLK) then
                current_state <= next_state;
        end if;
 end process;
 end architecture;
    
    