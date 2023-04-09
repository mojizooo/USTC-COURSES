// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sun May 22 12:15:00 2022
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
  assign spo[23] = \<const0> ;
  assign spo[22:20] = \^spo [22:20];
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8720)
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
