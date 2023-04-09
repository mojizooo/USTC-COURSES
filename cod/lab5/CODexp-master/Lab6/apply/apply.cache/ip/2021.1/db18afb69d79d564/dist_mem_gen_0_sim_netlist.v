// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue May 24 17:03:47 2022
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8512)
`pragma protect data_block
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
lYHSaO1VJWQbqaZYyfnQY07epw==
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
