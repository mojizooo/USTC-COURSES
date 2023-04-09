// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue May 24 16:53:07 2022
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
  assign spo[23] = \^spo [23];
  assign spo[22] = \<const0> ;
  assign spo[21:20] = \^spo [21:20];
  assign spo[19] = \<const0> ;
  assign spo[18] = \<const0> ;
  assign spo[17] = \<const0> ;
  assign spo[16:15] = \^spo [16:15];
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8368)
`pragma protect data_block
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
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
