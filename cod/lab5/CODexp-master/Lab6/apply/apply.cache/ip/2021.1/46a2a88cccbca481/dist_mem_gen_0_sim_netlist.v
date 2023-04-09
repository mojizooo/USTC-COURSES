// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Mon May 23 11:47:29 2022
// Host        : LAPTOP-OKB0SK0I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ dist_mem_gen_0_sim_netlist.v
// Design      : dist_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dist_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [7:0]a;
  output [31:0]spo;

  wire \<const0> ;
  wire [7:0]a;
  wire [31:0]\^spo ;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;
  wire [24:2]NLW_U0_spo_UNCONNECTED;

  assign spo[31:25] = \^spo [31:25];
  assign spo[24] = \<const0> ;
  assign spo[23:20] = \^spo [23:20];
  assign spo[19] = \<const0> ;
  assign spo[18] = \<const0> ;
  assign spo[17:15] = \^spo [17:15];
  assign spo[14] = \<const0> ;
  assign spo[13] = \<const0> ;
  assign spo[12:4] = \^spo [12:4];
  assign spo[3] = \<const0> ;
  assign spo[2] = \<const0> ;
  assign spo[1:0] = \^spo [1:0];
  GND GND
       (.G(\<const0> ));
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "8" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "256" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "dist_mem_gen_0.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo(\^spo ),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
JqLVJNxQZkLohSEqQ9ITFybNm9QPcaTh8kyc7h4uGNwD1GaEe9dZHqj61sUilGTlF+FUk7afNjXe
+9yQ4e75SyWC3Z6F0o0CdI6t84E2VRqNvne6PMLMbSrRPmTgt8cbodbZa3saUKncQltVwK/zTxXc
dXyeIJwoVnylCRZ8MPU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
RMR60V/K16S3hDpcgdlFzH6vzNttFBxzcEIP9k8l6xLxOXzEGeRk2beZg3IkkpX9ywpiLolj/ijd
pAlaBccK0sBT48q6qTKLouly7vRT3U8EOwOAJBZoDUnL/NwrlIomkg8Pj/4x8iecc9IFkdcLg53k
dreGnJ/4ti8Qi6sHP5Vsy0qpJoYpWsOBc2cmgH9vayWn6WlV7QL8YjnFQ6bQnWuyarN2QQK+bLzc
JrPAdTBzH05U9MiHwKRG1GlZxJA5fxQttnLA39Nwggz6r5qeYai4Vo+J8h0NQDa/GYHeYKSYsF9p
VKrYe14mz3CSYvF3+NMCtnCz+VeW7lF95iKCXA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
k6iMAgjYok8KaQLMY/TME6/aSCYTKFMZWtHwbD2VKIKOoM9woUSioI0NuiYfkPizuiBJEl8Af3NJ
M5VmpW3SVM0lwPjVSCSNmHMIfc2krrmg962M4XaG4w+tnp7hwZbdNZ8ahj6pOLDYSTGKwdGQanuk
rIQbC+15rT9WEK2XGDQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lHyAdhaPyzMCy12MalQZTt5ud3be/nityQmJ518pNrYUzgCs2nz/J1pZZgf+RWFgX9JUwWOgttjl
3vfihnzL/+pRWaWe8tlTToa5xX6V/jpw3hAcktXx9YKYreiOr2qpeTLkbp0k6MDPx0OZ6zF6OnXU
mj71WlXFOMXCx/95ZDxCuphivrOiA+pFZwGv2NIFmX/Oh4q8NTSFzJYzF3L9rWrI08UUEu9QuuxY
Iqlhuw+fXq//x9+jC7JNcedTSCXVkefBvZdJcbH0kbNA5ChG445apiF/OiKhKxTUjVKp7Rkm62fE
cFEo6KH1Cp+QaVxNQ55dcOTpVSSDpQGvshrQzw==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
D53lVPGhmka10zY9LQFvI7i1UPoiOm2NaQ+1PpDUs4OCbAMqPLHQSHIZ3EMPWpwgdfAtW9t+9lxl
o33XZq60DBUJ4ZKPRvcfbZCHmpPyjm3Rs8+ACxnIH7G37stehOSCzSXeqM9ORqajk0MjoE3bDLx9
FtW+eEPY1KauFU6KHAWAdaZPPnc5QfgBkK0c27Y7CfkJ049Sjv4lFwtiVOmSkCvdDDisv3/WAcSs
c5Zo+cJIWzw/prfWYTGIB0goZNZRXZpB/aULwQ5itLufopA2f9cHo50fqlIvQX4YoYlfQTXpj3Lj
Qd+7/1UmFCqQLsnOUXy9D/tgspVDu7POGbmsiA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bN8g8/EQJ5JNLmcuNioMXeo6xxPhQlbGMqXyUcnPTkqRMGYI+G4Ejpt9cT2XLx48MsTE+bzhGByG
1H1pqr4NO588pcozvxJ5bo7FJRCIhLP1e3pwipkX+z6IlClWyStmkrlQmh4o/jTM/s88Fv0m7FSH
jNd3hhAeYNPIdw9Btn4UcBuZre9QZnCZ+Qb3nW7FuuEd1RxTmP0y9EFC185+bRy+SMigW3FTt75l
qdmakEvm3BkGv3IiztGz6MLRqvBdHQYtaZ17Jeh1xGZ//F4QzRytN/lcdqSrZA6MOo1ObtGE9SFJ
SDo82E2CZlkQZfPVe6EC4/a7V7wIwES5EDHHnw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ewjro/5A8FySdAgSJfHQFGxdnPvtSB6vt25wsSfZkZlB9FCU7IhXRDEGCyqtZv1GE8Vi5CjQkNFt
lkkrCSRYIU5yoD/IUiSUo3oerXD+F7eyfUTsdMH8pyAOmszG4J/U4h2F0oGz4IGjnQhlKadatt3U
Pet1uDdo6p7Uz7fluWoE453v5O5Ag7QL3l2r7pK9QbtKW2b2ZgHI0FP1PfpuAESmBITtaB68uLNI
9IqIpc/l+MM956Gz3Ei4nFXbBqRkNnOoEIr1KKujTAkLJl3zAW45fRxt/SNdspyyOfwqw8HQ4aKl
7gQZLNfO7M9S9RaTP7tfDlNXrjIs40/SiH7VMA==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
BU7byHg11K8bY2oU9sv2hTEzfbBQxIL/wbPRcw3zRiIVklygkCLwToVotzcIxQi5+AgzzF89UJr5
6GTSf74dEO/L+7MiiVhop835AvOvvIFH3e15os3Ed8MZ/CykLdSs8kOVPSgygUECxKL/9FDmPOPu
fo2rClbqDh81jw/cX48EVuss3UxP/PNd7DI06TMx7v4Cwbv+pkvbuSJ9JUQBcJB2a2vbXuFSdPnT
ejL1XTVXeTbl2M6D7N0iqk4rwD1DAC1ao/d+axn50hvVPzigrvjqcQX/U1IENh7yF/bcNB1NT4d2
IdXJlmV2SEYwQNjb9ZTuSLUlehhVKrT3vH5zFJC80glrrjZK2l4tx9ZECJLmYjz00oxWf1dNVI0i
SuSyr3w6cWekzZQOv6vsFN+CRqWOkos5IUF5EaLFMFmcV5BtlgtZ9rm6OCo3zn726oQF5zZNaTBv
qrb5vLe4ELSA4fL4YBwiVDxVDpGpLzJNu+m6WS/V5oWJs1UQV1sRHSGu

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
dAIafnl1hEJ76Z8bYZlZKSAU+OyCQ2PwlK+IUKj9QNvxJJYU8c0z5dZmxP4ePLBS+vp0Lekmf+JK
ZmwpMP0AH+BW93Y8Y+QNBeNdszz6mwXF1zf7ZAzf+51PzoZEli3SBCs9JMOdSCtnTg1W+j4FkEYs
NWN3ZK6tfrYSbplsV4lsmoYu2c81xW2Ns3lV8YRQCE8VSADdb1pe8pEztQYXzBmAfCVgwFNJ1kXV
pEtDN1MRi07FvYZeUJ/cX+ebYB0p5w0vxVO4vSr0XOHKMcQkxb/64oEoe4AhHQNWURWYKDxNNzm+
jElAKl1fJL20OmItj+GmJlETFK09uAgqwtZ5HQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8464)
`pragma protect data_block
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
SdMnh1gSEedfJYquV5OdNPXiDu35QpvFhiaKPQ==
`pragma protect end_protected
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
