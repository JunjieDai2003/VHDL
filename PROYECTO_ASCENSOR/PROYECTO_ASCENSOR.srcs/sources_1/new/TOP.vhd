library IEEE;
use IEEE.std_LOGIC_1164.ALL;

entity top is

PORT(
 clk : IN std_logic;
 rst : IN std_logic;
p1,p2,p3,p4: in std_logic;
sensor: in std_logic;
motor: out std_logic_vector(1 downto 0);
puerta: out std_logic;
--digctrl : OUT std_logic_vector(3 DOWNTO 0);--numero
segment : OUT std_logic_vector(6 DOWNTO 0) -- display
);
end top;

architecture structural of top is
signal syn_edg1, syn_edg2,syn_edg3 ,syn_edg4,syn_edg_motor: STD_LOGIC;
SIGNAL edg_fsm1,edg_fsm2,edg_fsm3,edg_fsm4,edg_fsm_motor: std_logic;
signal piso_actual_s : std_logic_vector(3 downto 0);
signal piso_final_s  : std_logic_vector(3 downto 0);
--signal code_in : std_logic_vector(3 downto 0);

COMPONENT decoder
PORT (
code : IN std_logic_vector(3 DOWNTO 0);
led : OUT std_logic_vector(6 DOWNTO 0)
);
end component;

COMPONENT FSM is 
port(
clk: in std_logic ;
    rst: in std_logic;
    --"REGISTROS"
    piso_actual : out std_logic_vector(3 downto 0);
    piso_final: out std_logic_vector(3 downto 0);
    
    -- SALIDA DE MAQUINA
    motor: out std_logic_vector(1 downto 0);
    puerta: out std_logic;
    
    -- ENTRADA DE USUARIO
    planta_1, planta_2, planta_3, planta_4: in std_logic;
    sensor_motor: in std_logic -- Detector de paso de piso
);
END COMPONENT;


COMPONENT SYNCHRNZR is
PORT(
CLK : IN std_logic;
ASYNC_IN : IN std_logic;
SYNC_OUT : OUT std_logic
);
END COMPONENT;

COMPONENT EDGEDTCTR is
PORT ( 
CLK : IN std_logic;
SYNC_IN : IN std_logic;
EDGE : OUT std_logic
);

END COMPONENT;

begin 

Inst_FSM: FSM PORT MAP (
rst => rst,
CLK => clk,
planta_1 => edg_fsm1,
planta_2 => edg_fsm2,
planta_3 => edg_fsm3,
planta_4 => edg_fsm4,
sensor_motor => edg_fsm_motor,
--salidas
puerta => puerta,
piso_actual => piso_actual_s,
piso_final =>piso_final_s,
motor => motor
);

Inst_decoder : decoder PORT MAP ( 
code => piso_actual_s,
led => segment
);
Inst_SYNCHRNZR_MOTOR : SYNCHRNZR PORT MAP ( 
CLK => clk,
ASYNC_IN => sensor,
SYNC_OUT => syn_edg_motor
);
Inst_SYNCHRNZR1 : SYNCHRNZR PORT MAP ( 
CLK => clk,
ASYNC_IN => P1,
SYNC_OUT => syn_edg1
);
Inst_SYNCHRNZR2 : SYNCHRNZR PORT MAP ( 
CLK => clk,
ASYNC_IN => P2,
SYNC_OUT => syn_edg2
);
Inst_SYNCHRNZR3 : SYNCHRNZR PORT MAP ( 
CLK => clk,
ASYNC_IN => P3,
SYNC_OUT => syn_edg3
);
Inst_SYNCHRNZR4 : SYNCHRNZR PORT MAP ( 
CLK => clk,
ASYNC_IN => P4,
SYNC_OUT => syn_edg4
);

Inst_EDGEDTCTR_MOTOR : EDGEDTCTR PORT MAP ( 
CLK => clk,
SYNC_IN => syn_edg_motor,
EDGE => edg_fsm_motor
);

Inst_EDGEDTCTR1 : EDGEDTCTR PORT MAP ( 
CLK => clk,
SYNC_IN => syn_edg1,
EDGE => edg_fsm1
);
Inst_EDGEDTCTR2 : EDGEDTCTR PORT MAP ( 
CLK => clk,
SYNC_IN => syn_edg2,
EDGE => edg_fsm2
);
Inst_EDGEDTCTR3 : EDGEDTCTR PORT MAP ( 
CLK => clk,
SYNC_IN => syn_edg3,
EDGE => edg_fsm3
);
Inst_EDGEDTCTR4 : EDGEDTCTR PORT MAP ( 
CLK => clk,
SYNC_IN => syn_edg4,
EDGE => edg_fsm4
);


end structural;