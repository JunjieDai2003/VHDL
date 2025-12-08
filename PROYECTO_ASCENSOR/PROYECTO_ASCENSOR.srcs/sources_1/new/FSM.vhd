library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity FSM is
    port(
    clk: in std_logic ;
    rst: in std_logic;
    piso_actual : out std_logic_vector(1 downto 0); -- si tengo q operar seria unsigned
    piso_final: out std_logic_vector(1 downto 0);
    
    
    --salidas de maquina
    motor: out std_logic_vector(1 downto 0);
    puerta: out std_logic;
    
    
    -- inputs de usuario
    planta_1, planta_2, planta_3, planta_4: in std_logic;
    sensor_motor: in std_logic
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
                s_piso_actual <="00";
                s_piso_final <="00";
                
         elsif rising_edge(CLK) then
                current_state <= next_state;
                
                case current_state is
                
                  when REPOSO =>
                    if planta_1 = '1' 
                            then s_piso_final <= "00";
                    elsif planta_2 = '1' 
                            then s_piso_final <= "01";
                    elsif planta_3 = '1' 
                            then s_piso_final <= "10";
                    elsif planta_4 = '1' 
                            then s_piso_final <= "11";
                    end if;
                
                    when SUBIENDO =>
                    if sensor_motor = '1' then
                    s_piso_actual <= s_piso_actual + 1;
                    next_state <= ANALIZANDO;
                    end if;
                    
                    when BAJANDO => 
                    if sensor_motor = '1' then
                    s_piso_actual <= s_piso_actual - 1;
                    next_state <= ANALIZANDO;
                    end if;
                    
                     when ANALIZANDO =>
                       
                       if s_piso_actual = s_piso_final then 
                            next_state <= REPOSO;
                       elsif s_piso_actual > s_piso_final then
                             next_state <= BAJANDO;
                       elsif s_piso_actual < s_piso_final then
                             next_state <= SUBIENDO;
                        end if;
                    
                 end case;      
        end if;
 end process;
 
 
 
    --maquina de estado
    maquina: process(current_state)
     begin
     --asignar valor 
     motor <= "00";
     next_state <= current_state;-- codigo de lab
     
     case current_state is
     -- en reposo, asigno input a piso final
                 when REPOSO=>
                 motor <= "00";
                 if s_piso_final < s_piso_actual then 
                        next_state <= BAJANDO;--se asignara a current en state register
                 elsif s_piso_final > s_piso_actual then 
                        next_state <= SUBIENDO;
                 end if;
                 
                 when SUBIENDO =>
                   motor <= "01";
                                       
                 when  BAJANDO =>
                   motor <= "10";
         end case;
                    
   end process;
   
   piso_actual<= std_logic_vector(s_piso_actual);
   piso_final<= std_logic_vector(s_piso_final);
 end architecture;
    
    