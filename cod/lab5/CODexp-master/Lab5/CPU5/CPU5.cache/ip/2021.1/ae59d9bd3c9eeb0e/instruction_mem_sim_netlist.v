// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu May  5 08:48:10 2022
// Host        : LAPTOP-OKB0SK0I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ instruction_mem_sim_netlist.v
// Design      : instruction_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instruction_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
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
  wire [21:21]NLW_U0_spo_UNCONNECTED;

  assign spo[31:22] = \^spo [31:22];
  assign spo[21] = \<const0> ;
  assign spo[20:0] = \^spo [20:0];
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
  (* c_mem_init_file = "instruction_mem.mif" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 14256)
`pragma protect data_block
EBmL/rgBPEeoK7WFCh07SVPZsayCAQUS6tBXCb60NH0qKGPjWvWjU78s7N8VL6fhK5n6qMQTwxyD
2UOOQ97W3wpjnug6tOkLlkQCK2+TmX+C13IeQedK9p19TIIlyD//ehjzJs+O3gDLPnB97sa36Agr
e2+5VMlI9/7T/0EetigfMfLwGJDo7Lbg/XUqYlYpEvlgqf77B0r/9GWZhLpFiOXMeDHIx89HplVj
kRVDefiONqNtJ/yY7ZK5FdE3Vvehv+Vm/WLKoI6iG1sql+NwQUsXup3WY4xUifOo+TV0Ig/tcBes
amPS59pcpC+VZt+HeZ3I8z551QRZO6k1mmSad82OiLI75ZUar6okjZvM9gVLkFX1JoSsuzrl/H+I
1+6WqkFPUCXvR+jSGblnU4GgR4oQCw2uT6O70ZXsr45MseY3JY8nQlHd2VjnO2+RA/JKEvlpKcqp
xQ40Btczcb7sRdaBh6VhXlKt+uLPwLdBw3/h1dLakulWGjl00BnIVhI4t2n9ldGKpNq6MHoHVllZ
BUlLx60gAVNBh4trskDJuG4rBlitwWLLSKYsw2pxZKa7E+p12V3XhawAJJk6mZIDdNb3NDsiKe2C
3mS9pV6fURDSE0yBSZtktxfIo1DGL4ikFyxrQM3kwdqoPOhSCd5rGbF/NMoX24/ecvb0rR43LlGT
km2ZUQ3KzmWYjk71fvWPqGv/WWlSaR+PRq9fhHei59weMGAqNOVK9GGpCohj3aWDVgJJlJmExzld
eIKFgqPuIXeWvjcPA+zBzbxCTZBDsOXw/VY1d+5PiXHW2+SUhWdkVLVQLe0U3TqR2vNBtrGutqT5
t+EIqgJ9hN+c3/Cgwkyky/4D3vf6mfH4g9XU1u7r0suS0O0C0DvFToBq8LX6mQQBJPHKvXZVQB5h
phjl0eB+O7IEMwLP/VSCVMk5i5n8mf7ybl4FH9MAQcCZty7YEj915ZBIfW57jukmU76nilqvcIA6
1pKzD/XGwWB9NsZ+cJSVjhB8hMh3AgFp5LiahAwZcnQLWRAd7eFfJWKGZ2kxN6BPORsn9ptzfDzU
LOKyYTSVQGAaUK27lIY84GUmfUD6agOhq/pA93qwrHM1TdrDYxkzaaYFbZDjNvlU0YvMHfSLDIOa
pthS1VsAZs0Hc73duLXIGRa70UAceDWHKyza7m/UyGCslUozGK8GIgAxkMxO4PF+QKvnC/7IkfSE
/AxfPzE8uC3OWWFjw8Zcqu2xVj31ys0fmH6ZRUQ3UhoaPkYg9VuOhWOBYk7ADZ4cxnyDaELlaMng
on1YGUNJ4UH9bBW+ibu/jsP6vwSg7ChD2CCKQktfP8Q7TEhrZaAkIFX2pvEmNDoxqdFw4jdp9DNQ
QJyB3OQCNaQ7+VVb3CUt6h9oIQiAMtP0P6d2Fe+MAWyN/lYrJFo+RKaqcDZsLXG00RSoVRNuUDKs
VH6pYGPW7Bua0StZtRMhlcFfCt7o1QTbTFpfUsejYfML26ZyYE5DV1dLVKFCfDSynFhXm55mxNEg
YuRvWIdke9NcPTCBAVpDr9a9YgmVcol1V7NZ1xmqljajsxj+MyvP7bQnORUCjqr2Vj6mGoDlq1Xh
UQB3dw82r3OkbJgyPcJirgL774lqqHeJpkXVxFbbdVuLF80dFU8peKbpodVT3uQptBCid/g753YU
NDGF6wMWzH9mzLZZEAfmKTar3L0P3wkEJluoKNZHagGWMoOS+F+Ny/LqC6Tth1dqUIf0psdvTOdS
+iBZ13Ny4Ey1RI4pFwcBj1RW6iFC1fhQXjT9wccarOj69h4xOACtu9quNXGB+eAGhkMuPc9AqyIJ
ZBM45yDgmeAGzPOJc4SfK4CcpP5iSmrAFnDhbQfKu6x0VmP544VARGqFh7r3j7+jmHvdEFMUGx0l
Gs53ptGlQo0Ye9VZkApHqhrFLDahlJhYhZ4gs++EjMuLO57LFCF7Z0ftCwodts7wf+ABY8Tq1fit
k26YYBRNLhX5BOFxr+tqA0m7Onfm8bS/6KbygarPYAJXeMJUZB8gqprRKESvqRY+XD/7XI5/eGkg
KS06YBBse3LDirm3WvOYUdC0H9kK7+UUfEmI9vcWDKfKKkSfFKejPgyNLYFWGI+eJhqfUydokEDH
4Jbuu54slrst9kLD76X962LOX1WOe8JE8oz7SzJOvspv9cjCR3UA2txSWesmiY+v7RTDNMcPN13o
CdpwxVRjE5pTppYm0GqlKoYQfpAN8i+fPW19nGJkeO8cKDSX2OtZTRppadoSU5clAFC6NDuNmxVj
OQDYn2ONYOBmdsH0se/omwUBMkkClMO/ddot8BnCbLVYR9MK09DGjJ/6n1e9SYzfB8v7NSyMy3Pa
Un8IOp+BLyoNqQb+s3CJV7J8vWdMP1NB+Zq/SKy4CfpqecAxzUp2XL5DlKakPjuYqzRki4HTzt8r
3WXghCMNQPaeXm44NM/61SQAEqj4LcljW4XDgG+6gCUblBVqd1M8wrU5imi+9L+9v2ACqE244iZn
MFK4+TLVOSj4PrUZKGdXN0mmN3H2eo23CjSX9eo2b/yS8L/AGnt7t7yjNUxToPmsOBppilg2R1+C
fIjh7lKHdO2wK2sbNtkkBzVQFkswbPprzFpDaV7QMXLAs1i18dF72kEWMFMfbN4RpJ7lMVZhOuVM
WXAyNTzRXgEr22kehFcHBL45vTw7mloMMAwvMjAjOeZvFB7b5qCzEYiMSNg+Obww68QMI1+PEzd9
63w4jVcuePx9emLkZF+vgpBgsVroXxb4wQHBGoF5W3s64Qha5CJCadJ71T+ynQdi3o6qT57wfJ3C
RqXsy9ZVPACN6dZMeNB1/mny4balZxK9qT3jaVInNcrMgPiJyL6kswj7YUGeDgwEppQCBuwNcj3f
z4K2Eao7r3VYsxwqYcX87T2HcIMW7JUwnYykeao8HBPKPvViLQX3pW3jJwgQY0YV59LVrNjNPa2s
O+s2vg/Sxq+6CaxaCwstlZbUahw6yYd1QSfHtOZ9xkj3VeX1DNPrgYH8bvxaJhzN090Ko+Pjxg0q
fq6tipASfymRe0NXOyMxCxNHC9yEikJdVkUMAerhgNn/+tgNNahvDGp2ghfZ1FHl+DsJgUKDpwtx
KD8ctl6zJU9JoxKvEIGRwO1RGkwj03UjTI7CTolJ5NCWWo0alLk/feJj/m3VJsKkl0eNOtxoZlnA
ELruZeCE9T3J2C9n3Qsvp8Z6SzpuZisN32JqoEfKHUjmSyxoo4Ou08k1Lc9s+t4qcCds1gXmuX2w
zNaztbRqgy26Oyfl+iQ4Z+kjQrkf49psED00v/X2nGcGMnWmLF8jasrusE6UvDfJXTOeuwYFgQfq
N2aC8BUVkgp6V+jzC95Eok4amXyG7vDhlnoz7viJZhl/m1WnJAuQvyiHSgwr9Y8MKlziuQMo5r32
/0u4fQNGKKjCFUkj67E/+ONxwJglOJQizmYMm5QelZbS/DOlTRIuPmi0GNX5HIMKuQY+Vbgz78Lc
ghRpe3s6LL3wtH9KwDhW3AciZJsAwamMT/qR+zM78zZkIyvYlyHq48lgH2bFujBQ1kbV4IPWEZtC
45dQhoZ6kMzo193yyBlofM1Dql1TyV7haADWZvBclYIyKvOWUAKV14O14x2mmumXsm+1usiOk1W2
XF6JHiSV53mSLziH2/XpF+BOhXuVCDCPOnKxwVNnVHGp7NNISkB/gb9sOp0arqJ1RRXbE2j+f1Tl
3KG5GOI30/Vge1zhiokJLLwAaT8YkwrS7XaQRHviYx8DEdyNjeOlUZbDhixbZesfdxMTjFtHTpYh
VObJxMk3YFgxAgUTzv8edGs2iZPX2Wv1ed9w0shHeBo81FaCZ2w4F2yDrv5xlRIu11NoI92Dc/5o
nj8uJp9HQEiae7N1WWxm4Au79z/gHRC1ssdt5aNg81VlMBNbcQSkV0nGFummhd1OAd4RaIqU8QYI
CsIT+JnmBlSN4IWtkZF24Z+Y7pavH1qO8V5TrByUo45Wow+KBme1Wzb7SmPBId+3Algx0iSxGr+m
up1vNjpfZ/BSIICYWmjEaxQ8FPKPdFqVk6fo0a0OBwhxsADCOWjYoV2SlK8/zW8413d4sEYQmgtz
klxxUm4kLpDv47t9ZXx2NXZY3/6EAeUv+xWCPHF52DBpWI5ctwo3RsXP7yavK60cCrAINVeKac7M
efmJSUMzYvHaHwwfHhqqVrU8g36LN56tR0izfx1P2OGq2lJ5aomCk8+MaYcrnF8LduejOIMy3jiy
l9GFCjePptAJMDMOVH6Id0dprZX3F0u1U/hWkiJHIhmprwjnMKEc9kw4OZSdWEn8qlaIaF9JPWks
vtvzzsWQgF7Nk5Q2jfg6i0WtF/TKKkYkMf9De9FSlooi0nrSO7GtclYgKjmGkPEZKrW41TV5mYi0
O8gQz55ARiYhLug3oj8SHnaU2rFPJbUf/o1FrVa7bzj+HFvA5lYyBDoYMpCtdS0ACTFo/0EWUxWR
CdTPFGK/cXghu/U0onDANMc/TkFisX7EFwr2YjWnq0eNKX7hHa+/edHhHP5gJACniBY6wSvHExQD
z5kLEbzu3AVMVe6laWqmSa6KHs9taXbYrlQI6kVouD/KuQKGU+pquqppx38ZJZOQjDDbo4UePcSD
KY7xtKpc4HhSwquq2KB/oM7uj0QKGOnrF/KNdiOpZLlPiLGZVcHeURTiPlEAxWEsXy/OCDJWvqTz
R0gNQ5YO/eXHkyWpavRxu4+xqotzig4LWxjoamYtcsedLT5lY94b/AXaPWw2HAdqO1rShRzI3czK
5tI/EtCh4ukn2oyYD6V7D35Safboe1oK4a9n5a1szwTejt1KvCMrFC1Jw0KUMOyX6KlPWKgXqsOu
sFsbNIeY/CJHnea3az58FC1XtTZqqZLaG7CIMpAWlOoInfM/tnSWBi4WI6vTqPyyWD/lJalPfXRK
c566aooDBDn39tV87BEopc7Ajko1huV26iD5cggft38LMKTEpy6rnY5fA8mHCbVGbWJH13vdrp8r
tpbjxhc+uojCQzOFe0WqQGw19/CqaOs0vTVsNQWUedGLUmHL5l7w65NdFTLRIhPq6UXI1y7OOXU5
V2757CJxNZ+06IXsK+3zj8kXZMubCWYZayOrTMzDXbx9p1A31fdf+9B3N1xnv5FWvJ1dv8idrpXw
dWLqJJs3PZ8B8tBVZWOqv7iyeDdPq+pzCHUW/h6PWXd7FVjll8HE/p4aA+RB5Uxp8c8WMKy7RDKY
gQ/kRPMV3IV6hLtcY2gHoWWHlPm0GQV5/Jg8zOzDs3DHnVkBhmEKY47UV5ITiakLkfZOMgS6u9Sp
nYwQiuLG7PBklu+/sp6cJif/3gHxOL9EYrA4HlzAOowdHLXS4n8FbjT7yJSm9FfS0YEMwzGxQSan
gvxR23qbu2xMEK0TgfxwZUaWsY97sBqKcujyjYLVy/4GReFxccc3ZhzRGHi3yS7LUUVfagj/Q7t7
WZAvrBlOoXSeJWwn6xjrwpRPIv/rKLnXhCtouqzjiDw4nEWswKCc61zKBdASvAh+kva/f9ICd+E2
Bp9QSvtzoH7386NWjMn7+y8iDpEmNhl3dhqd39O1UNb/sijqpsNej8qrnM4Ybaw54MZw+Ukx8uJ4
lowxbeIzSUUhrXNjnQgFgt1iO2PgWOb3rfK+PYGCHSWDuCgHCdLyjFipikrfyJkzEHzeFbHQzfAI
Sxs/xcDhEm+pL+P1Ax/5dSIEwz4PmhlRYM5SU0/DiZwFiCya2KbLxLCnBP56jB/GNvSgSi2V4A25
yzn3oTNTO0gtlmLAY34fzvKtS1/jrELreWBqQ+/5W7b/OlXdBV78wLFdoGyT5G6/E6jutnEq0L1I
WYh0fzdQklVjqZwjKwQdxT31u+aV1MrAWy3PHQeethlgeYiBnApOel7hs3Sh+nsOPr0pxWiZLO4Z
WB+w32yT4EJlZfFSUmMCSYB6QG40LdT+yotUXASo6dUaEjRiz+lavLNiyej7ijYm7qZfJ9t6tvSS
sEJwxMo6Q/NvT2RonXQV/BNPWJcV5HvZZ9ckWjjO3BQp3p4wm+6NnONP/mjIrZefNmHUHt2EwOpv
5HVxsf57wRAMzhBXu+VTq9jM4QBV7f0we0Vj+7ea1WPCFGxD9eut5B6emZjfDSoOb/6ZrcgBL0tB
W772MUS2qhpJkBDXf65CqsaijQ+G3y1/nOvdZPqrD4riuICapnvglIKf20aOGbkr0DB2/I0x2kIU
6NOTYkJaeWdeDoWHvG0ZEt5fwmgKUXN88pGd0V2Yl3sYZpR3zj4ZTs26IIo6JW55GZ1FofdlsbsW
xb9769wYXhvsZUjlgFqagOI86Kcu+QAVSQQFI3qVb46svklcIPCa7y/scoqoyTUyLcwt3e0hEw4+
0b8FEIbrFEk8Opohrwt3z3A1hVpHJ87IKKIi9i4Vp42JngNxS0WGhb00aUtDwXlzxYRQgRJ2EoIX
b0XdxuqR6DjquQML93kHGt7b/k1/OXTbJQXIxoAz+x/BBtMtoEkbHelhmAdTGUmXqBPnRseOOIBW
2KyOQxboWDHy6iDUbLBXNJrCCoSOrHN3wZIcQHurBfkzni5hu7xOIiLjk24iUQuD4JFODuOc57R8
3tVoGZb5FqOJrh4OmhAMTAIE1vqsxtzgZX3UoUiVTo8e/SzYPy3YkAUKB353YUgXvZwTbRzozfAB
2Y2z9iEnvTUe4Fg3kv2nmDFPbQr6i/B8+F7wn8uQYLe3EzcDMfXC/wwnMf8DEoU5/K7JuLolaNGI
Ys8IjJaiLP8Tw604k/TSqSLzX166v3Ts/Oijwp/uBJq0c3GiELkF/QmGA0zwiOY/Kn1ZI5yhsReT
Wq9/W2GBVFJ2NeqLjUUxs1GM2S6nOkEGnYxEP+ynb590zmqhPsA7ojIqIBqtdj840HCZeu5phEz9
jtGU3QV98MgKxJLYWmZbx1rdeYr72uBl85luAfYGGDmIsqCa7XWfGmobX7ChNTy20LnyTWyzzVfG
677iMm/R0nioadD9f2i/IZQylKISZbtSXzYA4raXrWiCyvdEEIcUjDTNc1WqOLuu2ZqjWUejW/z/
dCFGY0CiluCaLyyE5R0g77YpT8gyEMeaAhW1SzFGBtoSdoQRHkM96KMUvsQUqfDmk8+QaLIxbJIB
AwXYZy/L2frYAk1RFZKO1VFUCvS4QCIyOhFkh7ay+ApbkaGxNS7HllFmY6tqPkk0G+6gnXz3q2AR
JglZIvYEmoa0/uMeOYRDXtNhoMADrj4eWxp2ak1tbVOO+o3VwtpQENpYypmN1RFJgAdYy1T2R/QF
g4oJ8ovHnv4rdwme8tt4PWe09l+yGjb5tR5K4RgNcUwpwZAVlWBzkuKLF8W/uhiDCiT7gnAlpe4C
kKRpyTYvsEoB/qO5iGeYMTfen/O0LZbcAwWFZsU4Y4VzudTaJMXi4W6iAv337H80SEu/OgRcvwTf
gciuOmW3Q36sTms8BZNui4vcCSqVfdU5sP2h434CGJZ694KJq3sKQrWvbwwESWS4wGzanjmPKq00
LCjrUa/G2b9W+JuZqFLtlXAn6gn7/bhOQcweiYxtOaB+yVBAMxg4HrWNSO6IJ0JNCLjXoXi4tw0m
dxiBFYHvG7Lz1kJfOrNaBja/wHFFdopE0ZwQmfq6mCFwrwIh/GBS1ccCSL5H3fqJlT1TRqSnw70x
uVGfcINT72CR2G0j6sxBYLoAqGs7b9DHOrHcW0YjeokA25ZfcNhTUdSKIr3/id+Q0F/03fK4RdYx
LyD3HcR0N2zv8S5D1RC6CPhZHBo3kkjT3gSZOL39lF3gEDQd0VyPTqUyHZuOiCZKjYj1ZkV3vrfU
f0kSTZ92Koif6aSL1FeHztOwPgf6sHm2QMqx5KUELviTOwo2oZlFfV0cMblemawtG62mRheqBWOF
9YXWQZmFjZT3jtP3PExdMi251DOmIKMjixiPo+bxe//pY/VLUj8lAg7RcWKxX3/UUpZ/z3o7GnPP
IL1NcVujC7n64g9Ctj5+GaQ6kv11trnDYo9MYdXAN3h9Ka32TOuqvDoRtyS18O2DglTOmGZlH5z5
L8OePNAKQVC2PavXcZFOsAuoOLxCGOsNm6MTxNTKtRRLYzzUx3woGYqqG6ip5IfChxv+yJMy6qMs
hiTmJJKyOD6p/4C+DzsGoHLeX8ntyPUVUoP4+S6GABe7nL+kT0eBwEkPJwgCOPMwJoUOENXmoEiJ
6ve6NjwbVyacD0bM0Y7g13j0ntAG/5biRijlp/ubBoDgfbIneiTSPfyeTSvg3sU/lOyxYfZhUjBi
aDMAlONXEUj92kUe6pdaj9Dbh1Rmgl1rc9h0jxVQl4JfifWDfaRI7AR9BJ3dfk9Uf1jNLro337U5
RZ+N2mDV3gnbEJiY+Ys2ASTFpW1dKwG/+A6BmGgLEcbOwskSOPeU1UJNF4+lwUWwsyveQMhxrx75
7hhKgq40+VZEWF652eiaQsbwvA8bB8mYh7myJ/MFnQ2uZzw8+ZNZQsLV0sC/tFFDe43B9w5dsjPu
aWgnbSNXzatZOexFKUlEhXibnimx7rj7j9YnuyR/Jrj2JvB6YL6lovZHZAzRMKwGgP+Ev9XBV1LG
cKiUj5yfJm3LBteDYj5shD+zKcS0IXr1LiT49PrCpbVKO58y1rzqjc8EQlnBKjRw5C5+uvNQHccT
MiTEXw1OXp96h4hwehTj1Dwc7xLHkbm08RJqcCqQuOiMYsPwVQCrBJ/U0CSbXSg9SEKeLPs2vlce
ljWp8gKq3/vk1pfQmUo4YK93QW8pBeRPf4A1mRX2+R/gy2l+P3DvHhMJ0XUGmiGR4MOSzN9eXc6j
JVRS87ajohq6B8mWxDOEnLVx5yZDjdSu6LXc4mo/KK3xs5c6KtBRs7k5xRCCMGv3fiTgyULhAycT
EacJv8KduBhsbMt4urc47OCUEZ4UdlwgbpIhASn3R0LmFeU7bPr/eFtpuIdjnC4b60phWQ2dlCgv
27CxaY4ZFl69DmCRm2x1Dqj4MoDjMSifBUg6B/DhTd+6LQlGEUV8gpJYqLUzxW3w/zGl8IIEjyqA
OsDGjK/QtZlUPp+28JUqA/crvmfy9oQw73xQFnoCvtkcIOz3hU0LgFQdjesTkfoL1F+y8zGCRqFD
kha+XFNgxnvEoLoKyTCuULokiG0LsFtzeVCOSkCCc3uqPbV/R2HyVGsfBOGj8vTNSeaZgtW8nr2R
TSNCDS5q3zmC3DHAGBpIWxDWftmKxDU7y8/rwOZpeK9uwFDD5UEiLojVPq/RLIlXXDr63Baa63vO
b4hnEDnOd1jp4fi7Yvm4XTUewk3SO07Qrdn/EYEkpiFA9fdyieQcFBVA2mjzIlkVg6qONOqfcp26
NTikTIm/5j7hGFZIS4ez1XIoEuVwpAGd4hwG0AWsoo6WgN89BXF0Oy1Knc8yns+R8A/S/mtO2OoM
GphRqqF+aw4/zgBIrJPIyG62AipzNKLUmpz2JtcJnC+RnuegihJEH0/kRR3wcIZE8qJbUqGR7kIm
Hkh7PnjU6n4OO+/Uz7ft76/dNgfIyf/PFuEGMbQTHJWEhQJkxDq2gjK34FrWFo7s7nS7GnUAxzev
IJOF+6YivLeYLHbcLRXtwXhs9sVeiNrcHNHFNqTOQYKNQIIIYwoFUkno+MhKkXVC3yOEdcmLE5xu
2IbTF8YXavOk1nJl3frPiySwo9DAissN2HXXKq4ZZPgewg7hSUb6a1qmi86/YYhC2GLBon7yrHm6
Ablo+rJDB4GJ+2Ph/c+BaWv204BpzCbceDOnjlb4/ImTMs5868ySESlN4zSDyTC1cuDV/aJpoea8
2eG6gPKVtdZupixhK/dAeOG9+CpmEV6lRkUh7ybDp3YZgqGIGMs8yTTN5Ynud11QwXxhk1RcnMl4
e23qH8aJQgJjs1d5nhk+EtWTBY3hAs9RN/oHd59iR/Ea/TzHGgFR7nBnCbqp7DuM74QCDExq0mfY
5cV9OpZNlgnf3d7CZmNXMsmW5TOOcpUt8ScGhuFJxL93c/XwFI9WGL+okyrIAxx2qgBcQwU5P8AV
hsdibz632ne4HWJAqACGqEKOpTV1pMmcvOgwhr2AlRuqD12Hqp6Y4XjB9QJUm7pBhCYVx+7wvWet
aHVw4JtzSkqPtnhh1WLX1pAGadWyqR4+Ju7EGsyz1nhOF9aQmjmQD0X36XlrrxikQBjU6bqM/1Xv
x4PXhODet0oEVPb3I4XyRw3A7puyzMEELHbGYI7tUuUXi+5Q6uDY8opHpq4m4w0YiYp216hzGwKT
3eHls8XuaAQPFC7RODCIXj3mlHcWn9WdPNQe8S4O+kzXItosTimJlcCEOYSJB62cFzLEMK1ssTIc
UEMk2gbtDPlxJqkwG+v4+XuyP0Lc/iWnX9QHWvjmhPcmctCynvO+AKjL+wd+QI9K1NsYeSo70pmH
XeQB4dE0Xw6BvxDStDGP4mGz4KVoFtERNGPlW+qxlOwp0A5AR84IPfugjGhXyrdMRGCzaZLjXvER
JDRPc2VlF/Z8+LSmSSK0G/uVk46OQRHXcHTR8a5FK56owTxPF1ZbiwJWRnXjkw1U69O6Pu/yPhTh
lNz/DeN+pkshm+jx+HDGbzud+wF/tzO5Ey2ZoHOvaoQdPnO0wySBI/0ed5ZKiRTGvKEGT24GQ2nc
owL8wAtNAFKNr5EI9Ta9u3L+3z2Z1McAVT4wV6f6jnmlhLpWRlxpfGuAGfm/YdNTkD1UaiP2IhAS
BbRZEZEa3bScAK9+OnD6TWEEbe47BFz2GfHaPtBjt+1z2csUbrYobCtteqoekHi9OKorMialvEcN
xY3b69mim5He27dsz8uYXwJA1LTfVe9KNS0PSRsGu2yDG4HAiboANCWHIKR0qcYM1k5MzAOBzayL
LrNnm/6kUufPSncZ/gKgB4VhizRtdSf1LRDisNfPUERxvywpE0Ddpnxm2yfFZeIDzthOL5VtEHMS
nhdP7HWiILPbsRzCphe82CEmL6FW5WX6tSsEI/eDtjpDtcx8C5jetYW02sYNKOKc4Zg7Jogk6LfF
Cx5GrJh73AeOA7AQsI5PeuvvFckIz780b2kOszlbKCrAdyeVqBlxwI9ebPXlwcrlQOrMHpi3UvOC
aLPq4/ezJEIawjMy05eQl7aWu3RPI9+y1XcI39s/JdiJX9ek3VaYABe8v3FiY+vjx/Qc4IAHXnDc
0y6nVD+nAZ//bAbZ6WPoxeasg1Jlt5uazv7tsVZ+28uDhQ6s7VnLPkrV+e80OzZ8ezoZaYCybGuH
RaQG7dVigCO0bjzzI8fXQTTjiOZL8tEEjGCOBXXpaxzOPXP6jYOxSSwRWmqNT+9k08zUCNS5zpMy
yrO1TENnugGnYnC97fVUcPES0aPBcPUgf3yFaFvGXtiGrWXu/YZXi+Aor83Hm4OHl9oyVxHEMlDx
NdpSGeJRLY3LZMx5KmpCWkeYinjoQR4wzT1vU5FQ95GUUTyTZ19gHBrwZ9JEAqWUG2KhBQXfhrg6
o29VX/OsSVawvfLqQsO+2NYsTYSvDAKpJNpjsssbDaS/x2auMIWvjrZrK+DUZS1KuBOA0PxH12Sy
Jc6oQ75+C16s7dTBeEJbKVpyjFl070gRfp87pjArQzvyPYcICto875+pbs+cs3yCOGMj2Gja+VtQ
z3/XD7TxDZslL9tB3A4oymxUokIu0Ysc8Qn5G9kOS4efZkAygofYhqlx3NXyb96lHxXceycPM5iU
gaLJlwAFA9iEJdMoVNeLqlVz0XsLd0/xOD2qWB/FhzTTNqxSnQrIlR3nGkQBvzqrB0o6+6krkRdx
2E9TDA9gV7WPaqm5jYE4X7GqHNZMdZN8yCbGfqCgXhsOL45bab+T4MuIXi6UbZukMKX7Km5Qlgxu
9tlVW0EpvXycMfyQ2dLjZFiSkpYmbgo6jxoDWdymZE8dvjgCHElWxUXvehTmIUmDR3MH9/+N8jfy
0lfYxFBNSq7R72xV4Dk0cyqkCRShZBZ55f15JmC7KZNbYz93OA/+2CLDGqj66ZvuuCKC0ycz6Ah7
mXiP6xURSLsswGWYv5KKE2a3HMOYA0EwWiTC6PdHv2GltOW4WuDXeOh2+/mowxIY9clwbhKBIdDh
HwuuWdN/TvasGpMchnc/aHGJEnM3OsFNRVw1yXkPNaTUZcKbh3H9d2b+6a+uvEsBV3ncQeqAbAIk
z5O1Sd7Yv2mrVXIZKO5TdF/4DSvr1wA7mR2Z9YOhSX7uxZ47zyXQdBc2f11+nyrftPsgW8QWLIlO
qhcePWqigWR/iOTF5j3QmvG3/+6JaaWy2E5gXdq7BPROP4Hib3RFXwuDWFSFAhWEm/6K2pnnkiF+
Ha/eyW0VSrLpbWcpYvMtp8Qu6618q77pc7IezCAdrd0caTUYaYn4xNBP1rj1saysMTWU2cNN/Ud1
V9EwfhJenuy26bc1/mmPmm0CaDA27rNIIUGKCxBis0zQGESssHo2nl1W6QikM51dctCDM5djNlv6
tHfOdAb5+Wf71ThMFkYdvCg0GZaTlt3R7qDkCqyaWq7D/STufemMSXcgDanQ1kHP6l3izFzmWg34
V/VCPFR9haUIinfNBkbdVh8vgI+awtiNbxYXATI5D4fk6PYtCGie8hz+X83qosLGy27/v7pRfVKF
jiaGR7dBZJXN3M/bl6xmdz4IETUHaVfEX0mOnJYepShNxsG6uhg934DLj6tnX6dFRAySv1F87V0U
QpLXvG8dA3cBi5XINWfD6OUSjPYkr0wJwiL5V/FX/4gdBsTTBeUxDPiTGoLoeB6tdA0dWoPOQ0po
0ymDH14pEU+ttssZWqPISDt7E2ivkEBPZEJzQNPzaWoo9zgv50Bam+oSM/qz+dz+8EwfIx/xr8sq
xFaWMZm3UxVp6Qwvapc73ha4i8YWQE8KcK4w+sESxLMUnQ8JINYurIyPmW5MXCBbs7+08pqXcJTc
IOmboskFrKcohvnuHVHSay9+iH7iTGyjJYKztKnB95fv5uWT20hGv3zxnPn9qE0hUpWhG/cvPYCp
5gLZvZJOPBjAzoXSEzseDiXyYfc7qrWIg6YK3XJTwtX60YrmlhOVXQQWsAakzO2fqaBRitSQRd6F
B9Koc7tq2HtQIE8pi8M8ayBexW+65rQW+lWyWvQTICyExqtKHGCl4r6PwqALKQLk5NiJtAKxpuQl
YwV0mRHgJaRV4wFcatfQLj5OTs6wAc+84+YQn4XYnZKnLnvvZH/4NFyg+Scgf08ekVI253LWI6pM
9UgNRGfdI9dQzK8Qfae09bMev6l3uRVO1j4ggDS8Pb8m92Jx4P8UK7gERxg5CFUG/BJ4DyqIJ+L0
wE3+nyh735zSFAn0ytjWqnGC7EjCUS2RFgRETuYk1tBwsaXmm60krho6BipYG5Z6iJ2JYeL42Uup
WcivRnlss6zdEATEaXRNxfRd7Js5fjGQrvDzq86QeBt1YRLj9g0m6gYdRUDQl5ffEQyEW1Hzt9BB
PHsk50qc3h74hjARnkWFd0do4zf3/705H89rwODZi7cYHCcxaPa6wC/0YmE41k9Ty2iJrNBAdadX
Ad0Ub+3sB+eDl4siB6iFf/vxFwFEerSKdvp294zXEzrOuI2T0mPkFJSczIjJS3ViQTI6Yq7jm+dP
HXYHkioY9duJzn9yVQtLt8eJlHoG0Ij4aIugHxrpzVPkbakHEY9Kc3sRvV3SaWq9iJ4Y6jCZPZvl
apBBOFF/8TkX/lmLPqc8t7M4OIFFEshmwnw3rN9eVi2p7SvJphXVvy7s8NShmBQyoWW9l4x1AUjh
LmsJs9oBQgwXoK5F1A4iC2xcSZeOQAb2d0URwqPXWNpe7sFnAmxAz1nRPhVwm/APjwUv363M4ZQw
yHw9bQgI+RTY1ksSxCucyme498CNrMX+kz/u5VVng0f2qlhncnZa1wNLdFyfsBN67SzzLdSKSGZu
iu+GHQF+vbUASoJRTsZHiaX3tl5Flk01onPc7CNU3urYFITC77tnp8VqXJSZAIVH8JU3YfeLD5j9
Ml6Wnz+hfNiOM/btyYaDy0FBOX7hNwPaWkKeByaoRGUedqAgcZXfw2miYw2vP7/6hob+cy93eZws
HDXUXbD1xNAHatULXEshODQLxpQyhLeu6AeLhA+UT4gyLsjfMT2uSWXDTcNR/UTgb3koDxX8xDrg
W74hMRzI8T3cfdc88+lOue6dghrHFngE0mNowAvXIlyqglBFlZyBfiaC1YooG/8nsXyQy5zfnxu2
hvHLF3L1xQe0KHa2muG1/KMqC3DH2wqbfR7ob/zBXA4axjjukxnQfu35lI5g0dL/xT1lUaT7InsT
Vp0JXuR0q6lamFI6euIM5jPbN9b6dW9exikZPpCieEqqY62oululyDkEEsEHA1i1Mrsr8t/GOwDr
OMtUFdIJme/+g98b/JgnxUBCvVV5vffcps0uek6GUcOkE8OfMFkc3uZfGxT3QVAXyFUrnpNEHUrb
cyDkj3nKSWNw1H3X3DljWA5BK6H1Mt7d7CQHRUauu2ZLsa3Qtd6kAcQVt2sk3UHFN92JHx0CdP7b
WEkrMT6MVFc2IgI173s5EaphSRVaqGypKC16Fk1TNM3qTa1slDuMkwX2k6DcWRqGKILIpPPmyXd3
O7JpAol5ZNplAlarG2FwOaPw0cyje2rjynG2OCK3cU7j2vRNSxz9tZUqhEA9lom0+abp4cT/j4qP
anGxu0693/Ue4eMtzO1X83FmRJS8EBoN7tqLFoSPzqcCi4dJqGGiws0GPBUNPQXQN+TeUmKNu+Sl
F/A/2bl2w3xrfLc+FwqBKH9Ovr9PP5T0pMN5NOe2k5PulIuQZLPMAvFFzpRrDO+rkx4Xn5vpCgB5
/ST3dS6TSbomqWhXqKOn+0K7dh9v3UZA2xIMA63Vy7V2MXP7QXCRr5wI5bY/o8suN5viUsOVNkze
PxyHiHFyKqPr58DUvmCBZtczoCM1iRC3d29BST7YuJGZOAw0wuoz1me+n5wYlAykMwq0hhNWu+4W
kPEUxfbpp3NBUCl+AqyzI/pkDweQSUp4iX/bAWulB9aaywfmXu/s4XZpRR2oJLewG55B4RkXZ6Ex
8RfnOwiwlxZ1MExLV4S3nfAfLKZMxktKJ0DAHpekPqATWhBr3+CoBN+0WQOtmKRdoRD9LVZTzXhn
TB38XL21TTm6rVbH0eVCKqB4H6uHJJyBAvUtreVRV28rdKV9jGh9VJRG6hpvK5CnZONQcfsTcA8k
tceCxE6++Y/DsjQLEm4nTZH+WWdzJSfiPd6qB7q2mWogTwSezWV38+ml7giGEACIaKiRn1vw96xU
hHudmESMOYvHdKcvmwRLk675BmjiaTbbWfbVWmhj+qZmCMNf/aLNaypEwO7Eb4DmlgcueSxtfYZx
XLSwQmWkNby++PqVP9G9TS+OUjr5ZLg6FQu5D/ovKpc5X8Q622YHPsb6fLtiUj44WALji3AXm4TZ
ZDPm9JjQaxUvGWt2aRUFT7xM02Q/0+EAAjU/1UlJWfTKnYXrJNB7M3eOMdJPvkwxQImyFh4jyx75
xBBDddHJP69tWVhXi74JvSkTtvsCPc5SGD6Meu3xDpLA5UFBDvBmIaJgFRer1rdueej2g6BgmqWs
vHhtU/Kgg2Fxrhj26yiMwayVumiZhDsmIrrwqmO+nxD/aXvUECrPvGXt16MC3Co5Y4W2uVVul97s
tU1bzkwudAncL3wwr0/B1vC3uqIBlvR9oKdWpEFvlarE3AdTo9leLFUk7jZeD0KdB31lgT1uZ17T
4igkhGIXOjKyFtI91P/cvSF7gL7mzMH7KdHov5odiSgNSBFkfhgyKipF3YtTiGuffJWWp84IGfBS
Nd1IEOVR60P8leVmwIpG8ZIyH9NC9aWUNxdbzLeo47609mq02yG/oZ9gc3mJmRC8PtM+E6MRm5qh
YyWBXJLhy5d6NF8Y+3M4kU4Ua9bv10tbOFt/QAh+G6HBdf83UvjVZaHOZsFMqNGBIrgN90IvHwa7
Xm65KRk8Ibeh/3bSGBBXc99TWV9l6CKchzyDkwoOXkLARFYJpPPC9TNE7+tcDGY23NidSJLr3e3m
VO3pHr+T6FbCxpymWzhAX9MNegqUa5U6+ZNeHd9mZBN5W3eQ4NMYQN7fC8Q9gAqY0pqFzpYdIE8v
1ZJGA3bqlUCi18rJH7PbsppTq2pxltgP3vn135UtNK/2D6DjONb3yFf7Ld2F4ZW5bmXPY3yitZXx
KTBlNjNrgZ9aEp1Gp3mrhvbpefNQkyRJUzcTNtbD3UzypYVrkdMRvOivYh27WdcU6cZcRPwDxTE6
8IK8osnTma8cLh9j4YeVRqContx4x30dJ2KBGA0Ccr1+Slly8yUWZtdhH8DzawUs+5YWzygoFVHH
7s0DUdykagcV1T9Y/L5PS8TO5bENQr2gfWmVKf2G4t6xEap1j4toT5G0y30CIW+gZFH/Q7QFneQx
dmZVUTUxKdG7Nm/TwvPr959wi6j2Wfg1MdoRpcKMahnATzPAjepkRpQMRs6rcZbE/+lvYmLjhxc3
FeI/J054vLzZ9D+vMpI/yUM8ahleqOcnIjSvcn6DRtdaG7wFWEJvD+MzUURl8TrIrTpFWFKiPvkt
+CY3OxumrxC563ESs7ctd62IFBEDQaBDsAnNNxImGHIRz58YtrmmQGsCDHRhB+lJ/MVKPoDSS1gK
sAb1vcFOLMdRPeveozRf7S3J55ywiXg3+odpg6Qk5qx+ESCf2AFUC70n4KbaxphxXE7nGP3+nqZk
d/tDpIJp2kEgQ3X//TxqMtSBR7Asle7zTHSObiBM94D8wz7KY9LfaaJNHTyoIS+2YuXE4CZr91L3
zZiITpOKkljsgD090vOacu3U2eC+E9VQcvzppHE+IZmnsqlTpW+C0p3dFgeHO0DKL0Ckvu+R/TwE
dNzCCcfoAJcleJ7ldjYFmnUjDBkeumhJHsv94dGW8WhwWXAJaQv6+C0+ZeCOoWdUzIJREOHC4Ptd
DS7QXAzhrauOSHXO0pXRx5VWq4yAneIU6kU9STOXPqYW9wrhyblK6DdcqiFnQIRmBozzEHMa/6Im
ev0axUVJIwOqXEafYmLW3b+99UmiZhit146wjPsAnwhsxRWrTVDcscbjLRk1IITe0iSOCYR6e0R0
J7pB2zhakMhpycQjWJYV8ZvmCB7hRTqNGI8oePWXtcag9uhAVg1ZMBkCgz0qyvG+1FhcfkJtPEHB
M87utreGogtTancUqqWATuPTzfhONccNESxvLRdP9Q6TxLRvxqWpxc2snEAbZgYb3sLgtECemO5n
1lfdc07ZP2DQGBjDon2TWbwuVgKcoWeDkHLn7vT7KJ6OiJH1v3dfoG1KdAo+5C8Eng6JEcDyERIo
GE1wTbsFC960si8N+M92XrmsD2IyAzZ6ets5cwXyDOkp1JPT+t3cTfvcn4i/3365GdaN5hKu+wOg
LhyRM3q5bpI5MUHKTNb7wBfQqjTP1q48UgNZ9rSR1zCIQIbHVh+SK9+HilbEN0+PBc2rXpE89JUw
lkQq5ObTuLnO5935RXCrL6Q7OW1rg2+NZpOuwve9Id4zqEph8is2LS7RmuWeK0kGhs/Hlfy6Diwy
xVanpUnD7CiFvwAdCgi+8n+nKVwD7ByHgZfOZmIATVTQ8UWWilhZogI22vrw8LGSyTxVS/N5XFHU
Tfto7XUU20vTxRt1unuaff8Zvhtw03AQHhbG5JeLehxoclL/1ldtADJi4Sci+hmK/R6Nylls60oO
yWROmyuhbVP/rle++I8EGGP5wyUPT3n11KXfMaO3T0gqCyNfJXXnHYDdBFTGQWqCBIxNb5SGnbTL
qAw1GktTmpxUFjgGgFyr5NhuQqa0aoPI1c5TEXOpC/rkTp9+e45+3Ue2Cj+MLpixQnpGLhjelAPf
wmk+r2zOvQr04FOSWEODNW3QawUTyfrgkQ2aF2e2SHY75qb/qw1E7pDjymVD283kW3dHq4TbO8q4
/oqsGwUUdcV3fsKN8wBkhnuMrNyqDq4fF1Qiol5XQ57Fy60UczEPkaF+Gcp2m1T8jnzVZp/QfMy7
7UlbTr7YAivxfIn9vnNwFJy0XCtnDi724IuIAJ3ZcAA7J46UAYAzh01wTjVHVliWi1+cikRfhRXy
THUD1nKYWupEZRrQgmSnDetVq6d+kAKBBpX4mblX9SFVGmrFjB6QKOlgvzI69b685YJN2aOqUeMM
NiFNwiAVGg6Sr2YybhGg18GHpBAOTyP7HOMPhuVpehuq4FzTcNZAQB3YBQn1SubV/SV5Izu6kYzf
vTpqPFEvBWytHbTL8Tb5gyYEQ/VymO8/8ExQy7vOtXDKiBItDemJWMoIGo3L1nglZ5s+w9z48+nx
ekqZ70eRfd9XuMfXChZsD/uucltzAHpl4OrPMYCTh7AIM0ksIO8EcGL0o7NTpXgQqUyxKew4bUwj
kk3lMvTn+W9IHsCSm/ArPDdbLQDMhpb3iYlHj+0eDDuEBdGy9oEekJabgwdB8D6PD653v5tZ3EsQ
4NuRR9mnvhJCnhF3269QsU5xJi76fJdkb8LYxDWqU7KQo+MXg8U0uOwBnx94RXjQUpZqutAyUzFb
2r0geHuzCUGlcSwK5YIGaWs4N96Ri1GCRpQDJLiu2fe6lm0XOFVetvUGYcUUYPRYP2v6xYU5QLU+
XYE463UCjJ3nDZ/1Q026alKFJlUWKbrwUsBRwV4xGbgZFSsquzVdWOYwcI9zJE+Gq2E/XLpIN+RZ
j1rh2ewfxABzD68nTutDb0KLvMlWFhNWjPNn3VIcs8bUntzRdT0R6urawabZSNs4FUy4t40Ni2PY
5Aw7oBsH71xEF6PJufm/9o4uWaSbFnZiwoRxPUq4f78E1FRURRUY2YGCDCajQ/AT3lzA0oY1EcWz
VMl6RW3ivhhsn5gohTnVkMSFZsCymfm09SySCessx/Uc0EutBA2SrNGvSquN+LjxedA8HKQxEwgR
4hjA5rE75zTWj5dylx2S3IyBNgxTD4v5gSbLeB7p3BTVTp30HlL+96jZEZs3Kmz+h8dbAoo/hv+b
5Os0LdzY
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
