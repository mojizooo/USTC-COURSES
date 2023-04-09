// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Tue May 24 17:03:47 2022
// Host        : LAPTOP-OKB0SK0I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lenovo/Desktop/void/cod/lab5/CODexp-master/Lab6/apply/apply.srcs/sources_1/ip/dist_mem_gen_0/dist_mem_gen_0_sim_netlist.v
// Design      : dist_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dist_mem_gen_0,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module dist_mem_gen_0
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
  dist_mem_gen_0_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 8496)
`pragma protect data_block
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
JiKU
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
