// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2025.1 (win64) Build 6140274 Thu May 22 00:12:29 MDT 2025
// Date        : Mon Dec  1 08:33:17 2025
// Host        : Junjie running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file {C:/Users/daiju/Desktop/LAB DE SED EXAMEN/prEstados -
//               copia/prEstados - copia/prEstados.sim/sim_1/synth/func/xsim/top_func_synth.v}
// Design      : top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module EDGEDTCTR
   (E,
    \sreg_reg[0]_0 ,
    clk_IBUF_BUFG);
  output [0:0]E;
  input \sreg_reg[0]_0 ;
  input clk_IBUF_BUFG;

  wire [0:0]E;
  wire clk_IBUF_BUFG;
  wire [2:0]sreg;
  wire \sreg_reg[0]_0 ;

  LUT3 #(
    .INIT(8'h02)) 
    EDGE
       (.I0(sreg[2]),
        .I1(sreg[0]),
        .I2(sreg[1]),
        .O(E));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(\sreg_reg[0]_0 ),
        .Q(sreg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg[0]),
        .Q(sreg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(sreg[1]),
        .Q(sreg[2]),
        .R(1'b0));
endmodule

module SYNCHRNZR
   (\sreg_reg[0]_0 ,
    clk_IBUF_BUFG,
    pushbutton_IBUF);
  output \sreg_reg[0]_0 ;
  input clk_IBUF_BUFG;
  input pushbutton_IBUF;

  wire clk_IBUF_BUFG;
  wire pushbutton_IBUF;
  wire \sreg_reg[0]_0 ;
  wire \sreg_reg_n_0_[0] ;

  (* srl_name = "\\Inst_SYNCHRNZR/SYNC_OUT_reg_srl2 " *) 
  SRL16E #(
    .INIT(16'h0000)) 
    SYNC_OUT_reg_srl2
       (.A0(1'b1),
        .A1(1'b0),
        .A2(1'b0),
        .A3(1'b0),
        .CE(1'b1),
        .CLK(clk_IBUF_BUFG),
        .D(\sreg_reg_n_0_[0] ),
        .Q(\sreg_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \sreg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(pushbutton_IBUF),
        .Q(\sreg_reg_n_0_[0] ),
        .R(1'b0));
endmodule

module fsm
   (Q,
    E,
    clk_IBUF_BUFG,
    reset_IBUF);
  output [4:0]Q;
  input [0:0]E;
  input clk_IBUF_BUFG;
  input reset_IBUF;

  wire [0:0]E;
  wire \FSM_onehot_current_state[4]_i_1_n_0 ;
  wire [4:0]Q;
  wire clk_IBUF_BUFG;
  wire reset_IBUF;

  LUT1 #(
    .INIT(2'h1)) 
    \FSM_onehot_current_state[4]_i_1 
       (.I0(reset_IBUF),
        .O(\FSM_onehot_current_state[4]_i_1_n_0 ));
  (* FSM_ENCODED_STATES = "s0:00001,s1:00010,s2:00100,s3:01000,s4:10000," *) 
  FDPE #(
    .INIT(1'b1)) 
    \FSM_onehot_current_state_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(Q[4]),
        .PRE(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .Q(Q[0]));
  (* FSM_ENCODED_STATES = "s0:00001,s1:00010,s2:00100,s3:01000,s4:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .CLR(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .D(Q[0]),
        .Q(Q[1]));
  (* FSM_ENCODED_STATES = "s0:00001,s1:00010,s2:00100,s3:01000,s4:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .CLR(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .D(Q[1]),
        .Q(Q[2]));
  (* FSM_ENCODED_STATES = "s0:00001,s1:00010,s2:00100,s3:01000,s4:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .CLR(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .D(Q[2]),
        .Q(Q[3]));
  (* FSM_ENCODED_STATES = "s0:00001,s1:00010,s2:00100,s3:01000,s4:10000," *) 
  FDCE #(
    .INIT(1'b0)) 
    \FSM_onehot_current_state_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .CLR(\FSM_onehot_current_state[4]_i_1_n_0 ),
        .D(Q[3]),
        .Q(Q[4]));
endmodule

(* NotValidForBitStream *)
module top
   (pushbutton,
    clk,
    reset,
    LED);
  input pushbutton;
  input clk;
  input reset;
  output [0:4]LED;

  wire Inst_SYNCHRNZR_n_0;
  wire [0:4]LED;
  wire [0:4]LED_OBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire edg_fsm;
  wire pushbutton;
  wire pushbutton_IBUF;
  wire reset;
  wire reset_IBUF;

  EDGEDTCTR Inst_EDGEDTCTR
       (.E(edg_fsm),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\sreg_reg[0]_0 (Inst_SYNCHRNZR_n_0));
  fsm Inst_FSM
       (.E(edg_fsm),
        .Q({LED_OBUF[4],LED_OBUF[3],LED_OBUF[2],LED_OBUF[1],LED_OBUF[0]}),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .reset_IBUF(reset_IBUF));
  SYNCHRNZR Inst_SYNCHRNZR
       (.clk_IBUF_BUFG(clk_IBUF_BUFG),
        .pushbutton_IBUF(pushbutton_IBUF),
        .\sreg_reg[0]_0 (Inst_SYNCHRNZR_n_0));
  OBUF \LED_OBUF[0]_inst 
       (.I(LED_OBUF[0]),
        .O(LED[0]));
  OBUF \LED_OBUF[1]_inst 
       (.I(LED_OBUF[1]),
        .O(LED[1]));
  OBUF \LED_OBUF[2]_inst 
       (.I(LED_OBUF[2]),
        .O(LED[2]));
  OBUF \LED_OBUF[3]_inst 
       (.I(LED_OBUF[3]),
        .O(LED[3]));
  OBUF \LED_OBUF[4]_inst 
       (.I(LED_OBUF[4]),
        .O(LED[4]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF pushbutton_IBUF_inst
       (.I(pushbutton),
        .O(pushbutton_IBUF));
  IBUF reset_IBUF_inst
       (.I(reset),
        .O(reset_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
