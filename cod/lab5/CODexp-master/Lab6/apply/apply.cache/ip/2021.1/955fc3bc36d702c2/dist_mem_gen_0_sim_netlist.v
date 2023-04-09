// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Sun May 22 12:26:56 2022
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
  wire [19:2]NLW_U0_spo_UNCONNECTED;

  assign spo[31:20] = \^spo [31:20];
  assign spo[19] = \<const0> ;
  assign spo[18:15] = \^spo [18:15];
  assign spo[14] = \<const0> ;
  assign spo[13] = \^spo [13];
  assign spo[12] = \<const0> ;
  assign spo[11] = \<const0> ;
  assign spo[10:7] = \^spo [10:7];
  assign spo[6] = \<const0> ;
  assign spo[5:4] = \^spo [5:4];
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 9328)
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
