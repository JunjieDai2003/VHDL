set_property SRC_FILE_INFO {cfile:{C:/Users/daiju/Desktop/LAB DE SED EXAMEN/prEstados - copia/prEstados - copia/prEstados.srcs/constrs_1/imports/Downloads/Nexys-A7-100T-Master.xdc} rfile:../../../prEstados.srcs/constrs_1/imports/Downloads/Nexys-A7-100T-Master.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {CLK}];
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L22P_T3_A05_D21_14 Sch=led[10]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L16P_T2_CSI_B_14 Sch=led[12]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L22N_T3_A04_D20_14 Sch=led[13]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L20N_T3_A07_D23_14 Sch=led[14]
set_property src_info {type:XDC file:1 line:46 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { LED[0] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=led[15]
set_property src_info {type:XDC file:1 line:75 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports  reset ]; #IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports  pushbutton ]; #IO_L9P_T1_DQS_14 Sch=btnc
