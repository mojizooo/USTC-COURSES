// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Thu May  5 08:48:11 2022
// Host        : LAPTOP-OKB0SK0I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lenovo/Desktop/void/cod/lab5/CODexp-master/Lab5/CPU5/CPU5.gen/sources_1/ip/instruction_mem/instruction_mem_sim_netlist.v
// Design      : instruction_mem
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "instruction_mem,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module instruction_mem
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
  instruction_mem_dist_mem_gen_v8_0_13 U0
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
WZyAk1LqSOzYvA+vr1jQ1JagkqE2Afde2AGDMJgmU/ItOKH9Hl8ELyZnq/ASPGBv2nId8vTiWrLU
uyLIBDefI00SReOHjW10VnQhEe9eYdoDFXga7SkTouJLrRjuEB4Ts1ibtaDfuFiMd40P7aW2MdVt
lM307B+6FFza26mf+WvUf0vE7oGWmQr9aR0ky5h9NP8jQeRzraPaThTkUV2XU7hT1dZifD2FK5B4
wbU5Pu11q8yRUcRgjXU2wNOsiDwYyp2XCCOBiBFZDVV7tXAhikgyRHhscMuQCK8Xj5YXgXY82KD+
TXN9d5PhIN9TWN4RJtuuQcqW6IG8/WHCkykQGA1DMjOnDUKG9e8aXqpgDKwb2UlXmENj7nxQItSB
NvCkUHQ/i90rUy6v1khy4aMB51tTnaR7nIHZzOaftDrT56uYRnFsj7fgm7/nIAhuM8jMQNXHGSMY
MLtOB4EhT09aU4NsAgCWxb5wZgMzBCzSAWLMIS1PinGN9sypW8dHvJ1Z2RjMe+225K59833sRUR7
WRvptarkHDVT5y8nkt1jkZZNgQGmXXN3mHs9RxyfTVS0H3DG3HKFRuu+IxLVGujbrYAIWM53f7iY
Z9HIJrFELDGl2/akbQw9tzk1iUeC/pg83Q2UB7wzWBUUBEHTp135JIamVFFb87mWuL+80kbfAz5R
e46JpG/sEqAU+rPvOImahtHkGvR4x8D/QYTbbXNAo2occ+LkDphQZUSk7cZ1hj6H3umY4R5EFomV
vL/a5YIMZIMrbYRGPTZtFLS6NAqZZo71FeOZVN55zFPebNBNB1qBURwHig0imk8aF0zb6Ejjb2zy
n4EswEOvdd67V097NwJXhvJSJ6Gj2pRn32FXxEtn/b8j2mTMS8V3LWM0Zkx7I2zwcBRjJ422Htj7
vuOcSFQHz9Ggmx7d+ZFXDqAFc8xhfjqeQ4e45fcizIgKgHXDEIGeCtF/81VllV56ajQc5y5vDqJT
RxTHqAooUSoe+KcogjALCETrY4XneV5tOeMNRSsr50n7qIBnsMbSxDvGnz6xMqQ1XYPw5jG3Et3a
UR0cX7/Hsgdk5Au2JrIpArxMb97lsnOiZLzDPPZbFsjOKmqXV2Zb1pdut4M796bG/RhXzIhlwUQE
agxD0gWydWKtIYHK0Dq8ea8KT7UV+ZT9j1qzeQBxk6/k0tMCVaWLukc5pKdsoear86O7/WmV1ZIR
xcPI4hOUrJ4wkwaa8hgoIvTG1YIFZGZNuoFrbCd3J4YE36eOxuJprc5cuVJZcahgrr22dO54NzGc
g5V0Ng3zOFhbP9G3B9zGg5VPUyS8Tk4ZE+89XtBaqL7sdAmqtbMqUGWWmKt0aGJ8qKjtFFLk8XyT
8Ww20oJ2X8m+ez6l84EyHUchaLiDWKDTNNOBY9V0TTr57AavCJ2eaSOqAW33Y4SNmBoSDOGVbtj9
pP1jzGVYDwBiELu/6Tx1tEvtdAv+oVUdoYTQC3UZDvOGJFk1tOheFB7qUswpW+iQ5LVEtB9+a8/V
BM5RpvmvdsTuCYosYqLcREmCUUAdDV0oKDNuQaERXJ7/CMhaUjRuBedjI4WIxZsDgjs2BMUBelet
Y1Le2Njd2OKcBN4mZrmJbloZVQJsnsKVkEj7D3kehkQMG/n57lVz4MDYFU1x1dhrWxDmMmU0bJRl
4BPmITuLFtU2w9cwfeg20irPWCH7XprHEW2f9bA/i8fUsWmbvOj2PtF8EAbutzOsg0VDXYgyVN0Z
qnyX9+52ATQU57bpAbrMzReKbgfjyQ5Fh+/YdXCxR8Yd0HQMe4bWBBiFpIZ6WsRRbIXPlsr7SrPm
Zyv8jLvA9nSFaYRR5KL+Hhy1HeTgwbRVwrJ8RkLKpZq4k3ECUdyIInn/4whK4Kzel+8jdfixw/bP
Np/AVoCej3o6eHFSJMxLSxS18KTT1FXslyZKUle0774lnWupE69cRzSNuMT8UjsBzF8Aq7gxwBgY
WbtiHndx/NSKLgSHE9re8wa6hBGqI0ELtkRAprdTgSVo3CezdGfm5rTb677hbXgmfSyJqdyZTRkR
YQWyUy1CLCdO99gZXW9w8Z0Tlzvs9ifqkeoSSp7+VE3NmrocTk75jFJms8I7bpgDGPld4iQQbHA2
CD85K6L7b85thbN+1rfzJwXBegL1Z9klDnXaUpq+mj71Dsz0pMgzGEu//BEPPDvarxtl+wgEV6qB
FQlrWSeYxshfEiLzbK9B6rT+MJlB39RoVUfe+D6hMdqsHEQWwxhHovfLIEeRUP3QKKtSJ/wxPwwH
psFnn6Oe6AXutqNS64kxq6cJHPz8X257ooaIOjZU3hAQR3xh6pVev48BATN8OWf1EbcQpOAv+DIS
sNCpWjVZyJu7DJZromllwxfqeMH2dSCB7dKbKjbnEAhcjKZUM5OpZN7nIi6eGNmHobcpALa7/XaD
U5tVt4jhAfrlJgJVjaPfnhWU59/I1AhxxoKtSstrrKgU+ZU73+eEZ5k0iS1n9eieU12QXK+jHhP7
anZLUvcvK3ulHa/1qtd3/4jijy3MdK2mVP8gQqZCQLc0oA6mthJuOGBZ0gPhUSA26y1ly+EQMdN4
qcAgUCKdlrgLQtxE9afDjXBKXVrz1Uq4L7WeRCl8MQUSjOeMZuqkJ8hxyPzyLyJCi5GUIC2MQ6ak
uVxShDCUOzNUgsJAp2pHqulzhA3qg+m5aEIsHYbgovVtCOMQjxxscfPMwW3DNcMP9x4GDmnPNdPl
AtDXUdIei2+zfG2d5WF0h3ck4YX4pyLrHTi9AqsBYAInvh0mCYPbivg5rzml5MpA/4JQ9aTHM82D
flkDzU7VB3GGU9pEYPG4V32CEpsxfuOZGnGbruZ/VTys4pTN9ilY7GKa5a6HDEZv0Nyij4uSw6lw
QBljpf9wCO/DQMdWOr1I3DvSED4xB+1xV3JkzSpvnHfjPLr01zp8GrGWRx/c4fUIqAbU/6D9XzpB
b+0ExrCsaiQbqB3NPwrdvEuZuR+Slhsk939+yuVsHknoCZxroPjR9VkGCnoxcGgT3i3qRjpXvZn5
3NFS9gmZ1Iu1+YwEgeScDW3BzpEbpILDlsDT2ur0bWnXz2HxKxKebLn3mipWf3Zf9DnlzVs6g3ya
CdtmS/XbLTyMfRbWfPbcTniXJsr+tJzKdyzLAJclcFckrzXq1m/NQt9CZBshUKCcwoB8xBE58uuO
udWlsBUBzBu5/8gdZYCx9NMJtUsjyT14iC+VZ0vzWczCrJ9QdIE3FZD7GUevXwYIqzW+fwrqCwZn
A1tGCQHgs3Dio6mtOCCuAwpGi+Pd1URr1rsMNr3//OOsvT1h/vfH+THhMa29rmfP8ybPUlrCt8HU
u7vujkCBLU93gSlRvRBtav9PvgFUgp941RhrG2qQ8803XXVuZlxr2PLxFkm97V0oiAeWrXPYjJF8
YC8ccxFNl/QKVvL/lENmmWuVtmsZAgErd1u7uqx9GRHDarJXxZ3d1l0Rk6h03upFF5PbIQYXagj6
WG7oSK/zPdHDIZy+vc6tDnLQxkCOOjXNbJqAoXMSEJ56fKvZ/X+spF7Lf8/UxSSPsBA9FcoxuagQ
pijvSDYhs6PJd5JGKhEoKCR3fv2h0a3zzQSKPucGHsFd5Ay8dUFpuNW+MrnMQXkUAX2NdRCvJqkK
orGazaqs0A9XQ6rG18+1laxkWoYo0bpxrshCjULhaMY+LPfROxilWHxKTxpwpWSbZUjBWr/TgPTE
wmmpNbdnN7lVc+qqazsHtbgAuAqLjhpG4QXzigtM2xXXh5f3iCIOV4q9FY8A8nAm27TsgoNJ0y/9
QH6YZoPWNPGEyYu6EHHbIJMhkRUkVExQ2Cw6291u3Pwt24IEef4TlhKYRnymxmQbVHRG/We45Tdp
yu5D+qnkn/kDnCuqiRwd8kIMOFGedgvlHnLMr4dQKrpgDcPSioZujKRPNIgEwZLjYKOYZQuu5MG5
qqQ8MB8c9/XlWFNeH/MUZXBmuLB6YqCu1C9hAhDIMj03bCbnBelD2c9+51QFBjsiNwn9yC22V6Gd
4dhnHJ1dYE1OwiGKYROzV+EngWaPq/bDjFRh62FFA/rSFQsSXJBPZwQBNSQGwHRaYUSF0MJk1BQG
V5XNLShOGe9RUIVY2G41H5do7jBir/aYGAM/7QT3q2EAswZVf/4yIFQl5Jq7pNJ4XPXmou/jszxd
MPJ8eq8Yl8Ninmh4Mh9QfMGQxmy9fm7hmlO8bYmPvoo5shIPwmuuWIsczBN2NR+TZK3tOfAA5lCP
wFrlaPTjBYVv9y8Vc2GHAWxX7g9FbBn02oYdfmCiWtqHeUGUEdBKCE7AyrqClpg54I2wWLWzICor
qmG8IFUa+PzTLDndctDY6NKkTQFhSW83QRYksCnO/yCaHqFfUX6c0N2f8huUuh7HN48D99m5Sz0w
g2qJwZDf0aYR8lY5cQBjLLLgFj9CGX6LdC2AaNgoP17j3aVr7hr8OaUM4qOcLbushlflif21VcTQ
rG/4GBPDxlbCqfX9/i55MSbnnl/WXeS8aQpKzmy7+k0XdDtfGuXgsj/VwfegbcNZARvfavqB4qvi
GPAG23Mxt7Ylk2d6ZtJKKpbEaf+eIp8yycK0pnMSU5+lNN8kFw777keZvdXl7HCZAvT+iVBeCvN/
OI0ZudjQjfff1TV6MvRoJJcvfT7uZsMlOsB730miK5b7r2SQT+pgS2al29CEYipf6BNLipWHH6PK
YIPDfgXvLvM2FaAJ8OAa4mr+R/R0bnqK2zXCpMGYXWYGLqr+NgwMzs54Wyrfrduny9u4x5kvkLal
fbtfcqsBBCNsXFHYfLhaxEvjyB572I74GGZzQSC6fs6giTwlhN/SkijGXVrtGw+mTBWBT3UMnfj4
KKikHgd6jNRdbmyby/tWAEQwkTbwcuQ8bXCKMFfijSSOyXQQqSFEhuuVDkmd2sWDaAWVGWFqmh29
EP4OGRoEWpVHUu7qv37zTM1b8JHuDQxbnxkuU/g6j0VVXqO0yGBi4owYecyu3igq4a01Y9tGBgSm
bhDbMfF+0DnHnpNiFRa8U21MoNtJPoK3/Zecsebq7F3ANHqItd3bLMFGTmXJ1d/oe5OC876eVg+i
H6QrBkMhmzdb1oNxNpLCkXqkQPnxAhW9mC7c+1KwFmJx10TjmQBI6wYOZTnVPivR7Y7R0UP/9mI0
B2UXDAI5CTfRtyVUQuG/aamK8iMEC64GK1dI7z6xtpn2jgIiiB9jiZav/HZYumGBjbQmtXg9rG73
aQ3nHU7Mq0gXAhE0kZ3v0oeFiMBHyrjIo1dpsPid0aojAnuhha7+BcmXG35KuB8Ej9ft7xVgehzQ
LZ1XAWPHT7wE4Xv3KenTKDVgH+0LSAibgfGsAPTrwEzFa6g226yVCwBmgByeJR4qlehq+zlupz49
MAONh4wQLmYNt253qW/EKOfcawLfNJovs55LeuoyUzERzVXxzQCa06tC1KXKRshuaaawNGVdLxb7
nCqqsOAhrBzBz8tRbCI27ojkuZzn6cMmGdKbhjWQDps8k18cx8z0MlX7a40iN5wbEqLWvS/nPhRU
+826WutctrnA3/Mu0VqlTmA5HpEx9aeNHJ1BAhlZHp4ZB43kgZOXmzeIluqY/j7wz86M4CcUt6vg
xlck5vgqHE9+UFZucRL2Y9X5zEVQSF1OD7vuioUMItsU5+rYzvVzD0f4BMuAbpA1VhA3Ofy4nVyb
E2tvGi1XgzQOzysPzjGmEFywBGH62N+tZASaYxu0591eLJW8NnAYsvwpfQ0yP6ONi8qlrdnMG3MV
Yh2mwy/e0sVSVDlDWkRq22hQp20fycJl8W8Q5ZrbvVdwAvo4bMMQyGAgC/uDiu7wMxZbhz2bTTyp
Z08NIr7QFksErScopy5FpfG2dJcFwsLQGXQ+hOSNTSQ4zQJ+m/mZQ9VXShLviU8vrDO8KJayM1Lz
ZdN0/NlThkfSVN9i+WFXFTuo5YvlPcvmmZsvhvhnm4dI8wNm6L17+9ntccMOxt0RvFcTbW1tcRFG
/ppnmyPVqmi+NZwDLw0nCBplB/oei1Maj4S59N3maHM+di9c/GDRKznG8PJYXdV0gJzimqFVRmNa
2yTMcYA7aTOPWSoyaw7N3Sm2XBhHg51TPZ99wjhLH3/+orsO0/fp8mNZMX7xdAOQO7y82CiVVNPR
2tJsU8WANzRk7T66YHs1f2EAcfOobin7YBLLjQlfEX01cQvyVXH/vS42p9Eg4dDzHQJY+3OOu7Cb
nxYaWI2P3H7pst4mqT615HEJ8w9sV004UxLS/VqcDnb0qeAcnkwIZVW6i2WHkz/1BVp/F21+/1Z5
gJvXy4B9nLUGbqz5EdkJv9v+Y+E/8ApI2ZdIcAcWEK4gmbkmAhY1QzhJQDY4K9xHm/qkE5DEP8lK
zvXmPjptN3uOkKnMo6ByYlvbakAC1AEJT6318N3GEa42Ef/Z6KeIsNB9SzYaI01FIpwFC6uXxGNr
ZVGaP6B4I05XnCXvbxlL9g0/seNLQsCk7NNvvpdDhY+sPBOaMouR3HLxQpIxTI9p9LQC1cLEskRF
sGRrdQtqqSvw3je3Z+dSkwPV75QUGXHmm7KxYfjPR4k2hUCf9VD9xgeF3TN+sHChUKwCBBbxbXiY
HxOospRNuCJw+AGQcIsewl7d7WKVj8w46pA0zPkRGerPOGKld0arxuhCugaL6oHzkYOxV85mDciC
gx6KycMBXZoySsmeDybXv9mxOfSN/XIpUVIuZmcj2StELlqd+7FAAsjBcwukgFu5AmVGhA45UQQM
ZgN+KFi58OyPVzyaIVouNVQZC2d4xI4kNgRnQcV7WbTLOK2RdPyZdg2Hto42BNVgo4yOx+4hITqO
1qG82TThb9kut1gzfMaFmz26F4IIuTHI9B6QSiR47/4ldTRjKY2aQfdm+hoBP9SeDXjr4wQO2epL
IGw4o1dJ7nirMxmxpcm/NB6efWuXwlH8g5zEKpENtbPIcpIEi8W94RfjHGOwcujE2g45OD9KZb2n
6G5/1jtm2u0TcPqO+z//IhFtv1F9C6qcuSQdd7prsM9fmAjlt/HjVZQZmeEA2dbBFVIXe2HxXl3k
5aDMW3j5LgdRJNQs84HRZy9o1qm+wjchvNIYPHuOzyj9t7Wl77jN8awQBvJ9gQnRj2HzU7E3IT6c
7S354riC65BOwiF0FrojvoUEtVVS31b3wPcvABBmgeyGcUiRhJ6d++70d+nC3e/EtmI7hwMVRZX5
EKQug92ScKzR1gvFh9D41QaD1HnGbiUhQXqUiy98vFQlBehVwtLQFL3p56928hXb9Y8rP3ea5+2P
DKd6WQOEP7NzTs6YEmMJ2BgnZVH6pFozQqDqPGm03W6WuYLtYzmks9QTbOQ54822t1FOn/m37H0B
6ouI4DZOy1keWxeLzdHvTKPATJ4lk2ZcBFeCm8X7Pd/3fBWcwV40AZ4IwFNUxNEGXy5LLnatoz6W
RlOj6TtrQbePEic3CaYa2Wn73y94JSEoDv8n8yFtbcY6dsowuysugvMo9JuONlmg3QUD5iDEliWD
NuaJ/6znSWOsJ+0iSXuRi9KM8W0ll/Z26WWAIkISe/pyfhkEzkgDbLiGSTA/Kbu7qMN45KCUYkPx
FrNcFat/IV3wB7ehuzCWfIY0vAvXs9zV4PbgcAkhdXZGJUDvr+W4f+2Ew4iwFJXUFNiw5nATAxDX
QZ+gAai0IVZSnLiZfeo63+ZjywydcHljxGTkOMksmq5NbR9Amwqzuf7341t7lT6YZR28bZWHLsSb
3/i9V4NRVnqVSh4z5Syu7FLmiFzH8p+FEYZqc7XE+rEjJicegb66E+VEAagMc5pFlHYXnqezGqhz
SyV7ydW36POgvKBfrrV0tj9RjYbktcfw6HssfFeaDkgJUcdnsDbxAvNk99yGtu6DBF+ASkWTDUp8
eVBRyQoaXEjNWwNiSpKjrEQb4g7dn4gRXjVECi9iecyOWhJAdSiiWTGU/M1s79ksxJ2lAf+V2GNY
vR8H+DGJG4K2raXj/MCB/qy6Wpi+gSclak+h4yj6CuWg/Uz638zQQbX39iSNXI78mzx8VGReFECu
T5MfCZInbjJaxHySN+v0ZeMkHGQCON0L1HJN2DCxe7cIpSJf5qNzfUIaOlwq5Bv5xKdi1RQ685u4
gkqBIeFwRS8oCxPYdHS/2ZXMvLikEpAvSYZUrT1CafX7TJEas2EE899daPC9A+7htwVCe3vtOiOL
VW+Lw4fin2+EOEMmt5ng4hZh88b+g0A1JjsbdK7ER09TU8iATMS+JsyxAXesAOHThTPnZMRbR9F7
Q7VUQj94bkXMQuY6gK1zR7iB42xqmWKMzeXkFj/6L+TEDvbk4N/GdiBk+lT36BJFcSoF+yUFHh9H
FFLuedthrwzrwgki1FLZyTl44O1NpA6xnrVgwqEMU011D5N07jRw17ZcXG/TVnuPnBEQ6epR6u1X
+12oW+olIO5wwvUIF/GA+vN/WzrHDuVNlIO7LauEbsVPhjpg4/s3itN5RKD1AiUPbBMbgxna7jVo
vif01trLsnMEJx11Oov3/xxwXfdTkcOeVvVLMIzD6fUFORDj8Qjpu6ZHEiGli+FibCg6td0wkldI
UKsPt/wDCGGGkcZ2/u31xrt2oPetoRDFFZpi4MFKCimo5gzBHMf3RUyCuSlwqyEyLRxDz+lD2vQY
hZCzmhY0heQg+ifzEPzU4nkmiRK35Jl7UWcI9MAwARbwD9sle0A/cbwmIdBj9sDt0W2eEhP0HNNK
8jpdvufsIVLXzKhURQCPpuEZUubyjLKOZDDsBDaz/IN4COlSyPKZJzoFYsJOrTeOnZxpEN7lHIn6
xhAbwUSGWnu56YtLmWlrFLT3LJmhTfKhdlOczll51z5IZMFwMrae8+ileMi4jkQ/2VJboEKEIz6I
xJJ1m8sjyXcDfvwrQ/ti4h3klzpPW8UAmADC79nuMUY7lzPc9Zbz7AfSEZ7QeBy8RfxV7jxaorTx
3IrmFDhizqR8ZR1hhXUCCrjYhKEkb2B1MyiYSf3wux7Coy7RZyALa3GrG7MOcS8W7rFmq724OsMk
n3o1XJrTqm9R8g3gs4dQc2cwBc+Sw34bRhGjMi3I/+TevFgDH1qbiO0xK15TJNIXZxDjqd9ioTrs
48R+W6qzV/dw1LjHO7GD36+LIyBBOrXBek3mRr5BqwY1LfJXBK0+fPQjTDpWPIthwIscQ55SBcJD
OSrET9I7Fr9nwINSV7Obg8/XZqcMYG0thVmqkdVh3tj/x5cyzUH4EGZ1rrsvXKIxccD3dmtGaekB
JkvDS0cvVTjpQofUOmT4okuLHgxNzd3VCFInBWtlB42ZaAS79/hLj6KzsI5OERc7ffjAoDjNQJTS
AFlBD01VrwaV6zqiRxQ/xEFXLAZk2l0L0Il7whXoxH18txtyu6gA48/xJjoXy8TSKH6Qu4TJbE7Y
/i2JOdfbrsQwoHNG3VB6ZIndHfQ3ryh1c+rch2pH4mxUvROqf9jK7IlaEqiKJ8RpFTSWjimWtm00
xRX+PoMbFEKtR4Tm8goxRdEZ/UIa0CWru3SRlvDDqlCofh7XUEiLypiRupplOoWhs+cgxy3paUKB
MXzoRPA6H301MyE0FgDgzDuB+16UVuPtW4CJyAT7VVwXZs3TvjUqgI1hDAzgvXek5CACf8xjU9fg
tot4vtOU21HPYR616yNxQzKkNgoth9pXnCOoSBYeR4MtFyCmQOC9CL2e09wtXoWB0FSf8yh8WliD
+7oS7bTI0VvziVuWWC6fh/blpc9Vk9wivkZiWeIE0ku56AijFyOUnsiLZ5eO1d8g6omAlNzVAXP3
znaVKfuJMcUIvxv5Vdz77S1kfAzxCtBhxU5grOtFp+8COGWITSibsYmAwYmNUyWZu3xK/4f1aAdA
Fqh+uBS2a2PiWHVbHd3eLpmc8pYcZy57r2y+BPCLJKuNw7cUKVvMIUOnXvUuAGTzZRgAuWFsrg3D
72K+5hvXksIwzjObxImvL/50dmUaZ/vZ29g8laQZRCH5z1BPN+V6HIECIGYmuzbhwyAfFRMAebF3
jy2getpoa6bMH9tUa0X0WaL1SyFLFJ2Ui2kMMvmoWO8rz+mtRCi/yOKpwSjYRg755gEhl6yqqQG/
0f0VEOMS2Kx+CY7WXMvPUGXlRR9vyyfifzyDei8U4WdwajrJGdYu8tXB3KQ58dV/b5bTldOoUFzq
9TfHi7LLFWKto5EYWVVSi12XRm16Jz19pMUWV4QhA04HUb7Cnl8Vfj4JOr3C9SQ2YO26l92x4iyr
9g35zARJp6iNXCfQy8IocC1SimUG0sLTAFunKu7I4mFniOg0ihiP7sPcmu2ylHTwLnii+VCrWg8S
nLk5Al60PYMfXimdbxMMQ6X4VuFz23xAW3ZG8UadXWyPJetSW8LIO0abBMGOPtzNR4n/kF110KAw
TsuJOOD1ed/l33fk5BLq+XDQS9az5cfU0+shzO4ZxNSN/qdTSzP4s+ZDGGciEayd2jd9SsoQDz9/
+bdQf3JO9ltrA7Q9pVS+e3uA//UDw2mZ+54YziAsMyBc1OiUUnue4akccLFcGKpE023tCbXZkmqJ
cRc0XE6+4wuw5OJIMdZdZGrznlMYDPh8YRDBN55kR8UoJPw0t2CpzA/4D41SQL0houZ4XEVt6T6g
eIvNYwzdr6h4XODnCsO27D5srpF0IayA8X/NcVulY2puLNUttlTlHFYB8Z9L8lk18fKS3wQKyIDi
MfZAkmnyzoLarHXLLo4/F1YSCWf7HPKZ5IBKqZdlYanRs2cynF99jXLHLkJu2mFpeTrwi3u4ZEuU
PbUIA9ApkfDVxYeKgzT533AevPaR5eKAeYmxd/HYKsbI7rX8umRsOd08ScIOYOHsAAFrIpzXW75X
I4HVQkAwwIubQbytiLI8drFXJTpbfzwFtmGzZpYBU6woYib4mO4xsdHyiwoCPcnR5m4fJKSWyC1+
bCE0LwtSikXt7IuuLp3MHTWdOkdycUb2oHTMkRGpB+iPveiofvaJaHAhP2OutTV7U9bbKPkB78/C
wx5iIvXScuuXEI4cQPTWu6W6RoE+O5LUNl/qsESC32+7BW3/o0Ss54++x43r7eEiFSsB5KKv84Ut
9+sw4x0rxYCraRpz6eE7R6bBxLxvHAnNHgc7yNgcp5V9s2Z9mYB6PxdZVstAsjl7+GkoPPSIB9V6
F1Ehx78bvfye85wqor83cJndUwjWkR3ONeI72nmI9k7TEXVRU/1e4MxQUqB4FO5AZskqCD9rOXIK
KoEv8NHtiXIRZBtR1g77DrMOgOle6ng48a/IY41Bq/ZxSi+Y742tJrIUG9cLmFK85q+M05kjGWJg
RG5fQtLveh7OxSoxt2U8ks5eCvuy5Nl34NdlTFbaasTDWEcxaNDhgu2TVgmnhhfs3rMbGXgRR2ou
tiflNb9WSrS3ii/fTwsSOOVI2DehLFSJtkDmMu1lDxErctIVvW6W927RyIDKl717MNiLinA9b9mN
QqWWnihhSS2EusD4AvJQF0usR6kuAwg9zWTc2Vr+yonpHSaolNQVxgCK0+7rZLAQbACdvcsQrEmR
6iSt9KMMXzRs0ZQA5/Iy0VF4pi5BFMdeeOg0yBuDEfvUFnB41L1U7kIQHVE2iB9iF9ycKtChkZxr
XBxF/M4JkDlUfR3H9q52crdYHAjiUuD/5K8yLVVYwUfhqQ6bPisUDu/BTymfuDr6xllXGulFasr/
n+VMm5ooiiLlZiTTCXT3Xnu6pFr+BQ6KLOXliOjCf1v2jT7ZLS1i+QWOF6Uasnr1jGLD56DQM5lD
TT+Ra5XYu/BZEdMMFILk5KsZ5jW/zh+etQJX+VS7rbBp17BbKEOrGZNllkocrstUQsK8vCP/MS3Q
u2UxlOXLoj3+v/sWzWwfD1oCo8eJ3mzGHxG+2Kyknryl58lOMhGF10LiJQ5u5/fg2snp1qes5U5z
hasIaKNwBcK1kbyO3RwvHAO1uSjbaCo1JFHtg3Mt73sr32R3+UYu3OJ0VG/xkSOuQ5pwKk9VVgjk
NwLgJc/p6PDsVlFfm6GmX6Lq99v/rPicISHB7H+x4u8MknP9MIUvB5oHZK0lo6A7peD9Zl4oXpKA
j1fDfkc5meqx/rHQx1z1gvo4pY60+9+Oh8KfxONFE3AmH64N5i+2t6R1P+bz6/IpPBPAO034StrU
F6DX9BYyBGhPbu2CQo09DtJ4EUpzEj2NfNFOWh18x0/WKrNxpqGfSf3VQgR7g5g0XHp3KjvdMvp8
JHpokTWXezfpJ5bNBOCW4tUi2W1SWuiMyBIUqRfnYzYkGirVOe5CO3cfSf25/Q8UWwYWozH2I1Nj
bzhhzzsVxKIlQZKpwOQHKHN18pO88tjSctw4IGHPaya/0xBqJHoXRpNaWBdE/AJ38fC4d4wbc5lH
8RWdkzWp8yQM7bcawkphcBIwwLMsYoFSA2/nWUfRaCvOdiytupOs/LK9vGzSwjshbWG2CiJfSZXK
AOX2OiXpio0V231QmVFOtf8pVvy2rf+7uUwJ1bJ5vGYkT23/rKrpo1nBsMSPhx2KzYsA9n8Gtv1F
sE32yRWjJpZb8ATiCrRW6onkiqftwfFigmkZwlqhvPEu9EwaC5ROcZE+4izGP2cnEECm923CrjsK
SWxhdJ3Phf7xjikJWGN8rcEWwD+VAWgLB+VW5eJ3/Dhr026ZVsrd5+UHlCkJzCsIJMnThWdXcEra
CppGc/9hPmopUA6j9duKlslCbOa1F5rppynxdrHcgMgZgl6BVrZQlDldnUJEzhkq+CktHsCX/XAW
zonXE7vaDkawWlq2csvAMgUvBbfh2/DG9R0Ubdd4X94rRHj9Fc0V3eHioWig2Fqp6n11Ke34iwZ5
c5BfxB+yozkqMMsZornE5q+RYqB/CRMlqvNb7qN3ADwaU4eYPgMoUYIcsjIsxwpdRDajK2RzWi6B
XsIad7Has/9OAUTRUse5dCUmdoGelqi3eAAwqX6H6hhygX23MHulim07nEHoA5Gk+bH8yJ+9bsn4
UJoQvLvzM7/aiOJHIXdGon/hjuxLDfZ8qcNkX1RVSKvPgQraFYbkaEkvH4iJkV5AVzaBdzTX9cfq
YA6rKJuhgchsox9Eit8dp0LPxx0OUfWwFKJ544ZC6B1w1VoCdR6Lxewhtm+Zu7VUetSYMp30Mkt+
L5o3TVvNpBqj2D9dhNpXFamJfvSoYsogwJHCuao247ABqQtI9LY3OISBNTZ4C4y4BCnmQIFGmHij
bYZxNVo512yR1P5kBYZco2YByKYVJbIW/CZ1sFHWsG8cWIrF191ikc/FBFW7cHzAs4z0HjZoRTzE
uZQsOSjr1o/6USu7XZjbwfomai8moCMohFYIV+yI7yUG0Wt3CbYelR14DBuG1lo1SCJgyJlQFZ5r
odY5ZkVbzB6vPMF+XTt+UjRfYCYwvzrxDafAe10lQvDg7hSvaJXzrlgiaxMG6KrlChZXFw4SHwVE
t61qiTydR5+Dz8VghK+GsQ6Ei/VXlIVrnDwX67hw25KG8kfw6z0Eh6D2h+IX99mEBaq7+WQd99Hr
eD0cFqfd/+Y3jKOIVMA0szPIkYAmsuhho5fM2W6wr8XL+/CbnYTeYTJQeY7hvNXuRvbskjsSEs7k
6BI1PV1V4RgN6h149cGLGTZW9oEO0BC86otgy7WJDOB6LQIC9VjtxWehkV22Go0SVcZhpLgNhLbY
bsnqXn/0jPICNhb9rRiOqRXm1keC9hK5ikSpCgm+kWOTCtHWV+SjQV6f6HLrph0Hsi8C2KfrLjWF
+B9mf3WCcDvozuCWYucDXA5tIq2ZCpte5cKaUnkjQXZe31Izt+bqE9SFL6rxIJI6Qim+hNFK/bKW
1qwRea4PW1c5EU5p/FmRFnryjAufX6U9iu5cr+1/Os8d4BdKOsbt2cmyfwXvbXPqMrD2JQYWHNjb
jU16rJ/ynhPiCb/MPxOjbh39cx1AY459SVHJvJY5dhTX/mm60g89Gh/pF5LEmoRyZeW83twtxk0L
jgb2xpwJdetysLAKlZm8C66vhSFKucpEOuk+E4gEMPaiuAZ9/th1nM4cNmc1DYXRupUnZoMcOLzO
70Z+ecoZ3yk+GXYqenuXmvxfuwYmrOxYHoQzT4rVjry2p5qN27FNaUc3sGJX/+W7oZSzdEHUieFd
60xouSq2uJWLIuBn5p042xHqaWdXUN1yCckG8kokx5OWJYYZJEmyawfI3ghbOctb31ccjeuWWWoW
xeDoXvHCy2bnQoz7C6g5rnahLDcXiK9N3RjVvQVbii3iizNucrj8PpnwbCz2KeEQmGCiAA2a9P/C
9q0VCtOvrTrrk9pR9x7Ilf+3ozRsuLuzwVoCGI0Md4JZHVOP/yfDHy1X4PNjSFs+YpvS4dpj3ORN
u77jyYIkE6O8lJvcHOk1xpQyRJixQij0Lv3zjzRqXqVP+mADeW5cKTCxM4uvnIAt3qi8pWSdA7HJ
u3myXvvj6e587Xx6dEEg9WZxYvL3n/u59jnc1K13+hvBdbWAC2OPgccyELXGhK+cGgVTtcvjQTvd
qIKxXbcyZzyMdi8KDPPNrJIY/yK40PBc9c/oPuD477Ar/fHxCqORjUtJZ+RocF2BRO5ysMLqjGkG
RUFQbSj1ta33kwKgK1JNwQ06D9nyCgzBOu3MmXbhG9l55kQFL4aHwiVWrN1rUUpu7qN2sjWiDHDU
TNuXWLv2gDx+uIpm4qfyv+V+g7Ojw9D/1UGMEcyVV+TBbDimySOM8fHA/0uIsEWnQWaK8LwX2YIl
4urtiU9pMBRbaVDdXyFMgv1jeyYWmTfx99Q9CMe81WGPLrq1Yphj24lU2JUPvIaR8IhWwd/iyNQm
cTsLJ/2uUjqZxvjco7oeAjSv3G7pn+xLtFN0SjW6x3wGIPehWvVTQBp+rxeSHBlRCaBnnymnZu/v
l+FlaXT0OkxyJyh75GhqpQogI2t/eBdDIq59NlQeuH8QekW6ksA8nt4xk69wsIA0IRrHNA5FzYyI
bdcW64SnHBpe1jhBvviDP88ZnFqgL/TJBL/+J7EYKPAOKixpGu/Hk/668m+Oe1clatLYnsnWaW0b
pXeXnW8v77sIPsCYjzennm599U7D4e1Bx/0yFwf1WXkCG+yfz76gSEwkcscHBxrudCOXs3fPUn/y
g7auX/R3eKCv3PMSuvYp3pq4iCqx+mCMoAWEwXh2haHtRDtEcO3jCq5ho5iaSLVkcoHxbmoLTljl
Ii4FpzskOdoaCnDY67lt4TmDwh2vshbtBhO8YTb7W4dWXtWXFJaoM1k6ULdqctvkLGXy7ZYT1l39
YqODydfB6CPQfJLViZNsWBqGR/xhMpV/Rm83xfOKnfAW85Mv8rwLa9le1OrJpgW1x6/hNXdwpWsr
6Dupn76mRN/T+3JCiFonKLJRnm/5KLW5T26oh2hiVSol5DbZFgXwViAD023Lp7SuNFjhEo9Wv+Ad
EaHpmFNjO8pb0CIB6L4Y7CF8hQHLxz8aVY/DnAZ57lTedhKGvW6WkEG6Q+RF+vh0u2m5tgl4R8A9
632pfTv6aHBhiM6slkvrbHJv42xUkBeZXRgx1qeIfJ7ll9+M/KOacghJFI1hfHyZG80kH6ka193t
gTXtESpegB4XwGdB2jgizvOmSPajoDuuYDE/8W5kEBYECx2cxiQ7SmNgKysqIOpp+wX/X7P+Tfwu
aTFjIoOR7cfWjxvwPkSymjPz9AZ/xgMEvSjiKQ/kpYG2+qAOVfSV8l85HUZd3C7Xm/2uTBFW/hXy
6okAZROBdHLkX622GC0l/eMJzJssK1u3X0CLMcsK+VDv94yiA4coReC47P11GLhYZVtMRiZT1qRg
dw0e0RN3iSKVSBnMa1UD7l98ZYnohrmM/byWZWDa5lW8+JiQk3FcJdUfWDz06qQkfqBkF8Cd+0BZ
Z7XfnTpd4HMAUCEuidAke8e91MKgXSBGCa7e/LWp+bRphcFuu/PqIY1gxW5luKNafnBX+jldGTeI
vS51obh6xZXuMofIYZuqY07EAeZkwPCh5yXVF/zFK/v6LV2dFh0Hv05vzScmctVfizs2jtQV4vIZ
MHY/vQeqWJA0WqWfWvO94jNSIhfIVR7kANe/5ZV1y7As+v9RbWst7Wnhm7VdfnoqQJczDoOPjLgU
+NdtK+RQ+zcyveVmUBbNqt4WmFA3es8KQ5kPk8RdLjyh+7HySNcV0u4a26qNgA3Aq0z7mXVLhvD+
a1FqKgZQQfTiDQlW7GqSpvlUigu8s5FMCZQK0bHP+W0Ikii5p6ACN6Aw2oiDkPz3W2i1alRAGaHr
gZqVDiRzN9cDIJa+l7WxpU1pONCzOddvLYYto7cV4kjw15OVu7Sz7meNjHT3U9M/3sc/gixfh+tP
Ue6wW6Ip3tgzT/gAqtk/u1WOsWgs/LWrS9/hPyERAsrIV43jvn//6rk2SMDaQlxE/LGYBoHQ+8Q6
Bol2/788pFbMd4RjRSWHBHZSduHCb6WX/oiDHEoHUvnLR1oXVUocWefQv1wpTYYoRx/Bb2dXkb+Z
fY68mMQLZCxfrU5utLLCRLOETYb3rsR9vrmNyopEAu0BeKjddkie77E/ydCRm4nNosTtaRsulA4R
q/9nPuHSwknrHxWHqkTF5oko7MYyNHBwWXABCc/1g39P9bMoXNsudxjzTwQQgQ384xCxw4u00S+O
+TmD9dTRiMWW7JrPoF2G3NtExVgHdTKQkPQC5RETQPtM4NAomZ67N+h2K5CZOYSRvMU9iDAzDJ+p
Mn5/qWYFeFI62f70t1inNfY2bGIKlunPa5GVYzbGWGxRtSxU3ip35fH874690Puk2Zg38WrwpaSy
Be/MYWIIYbN2YMM0/PDVS7RLN8IiA9+G28kP8j+mT6HyvvhmUiHfD2P1HD9Cqgi4mANcJWcELm6q
gCrbNH7BpBpJsW0vIzn5t1IXFuMitzymceTTkLvlduv9xS10x5yxOv+xtxhFaUDpd46Rzj8qp0ti
219zbdO7mpIwdkbMAytUj+mzCzleOXit2phmCjbq3sUMWIeiLSs9YPnj8Sn8LLrC71JFmwFUyqcp
PCAuLAmGWdca9mEoUfp58HhwSkjc/SOzmkoNy88vP07cK9ZzA0vFGkDQMa5SkBMOZqPDyLZG0v8U
YTyTo9tZxpe2NqYGndMLjS0l/PWtVbUCCpIXL8mRi+ZNxju/tJ43VCJZQUATIdHXF727spA3LmYv
cRqmspSbfLJlnBrwsJOXw3ON8n2CiFiRNQvBXigLW15gbbGOJr7yekw+AilmNNiGp7WspJVAWHzp
i/kou7EUk5deL7K1sMwwNyCAfVzL5ItifP++988uH8RFUw6C4HEQEFIQlS6lmgZelQJSpJAHVxmI
sGo5OF0prSlnzpTCfUAtUPJ/ZsZGQ8cnMjwd8ZysCOmmD0wzx0Xnx1749niJZe9yCTuJsaOQ6WK7
LFnQeDFnhRGEgJ/o8YCuI5jMzPm99M298As5mc08gbVjbjP5FwXZmJX/d25+LQtF5zX3LckfGLsF
wyusdiw9rTjClk/QaCUUXdvD/kaM5ScSM1I2Y0fJMLyb/A6ERJcQjzY7FH8qQ5Q1m0F3/r75JJc/
IKrrrRQstWYwd932xH95ngmoz4aVDQhCbXmBnnzHKQ/j0fJT/jE2yoMhaI+8k5ixVVhTZdPUs1uG
ZmGSK2t3bVjOmGAEGLhlXtT0GHhiXwli6INL+lRPd/o8frF+V4bvxkrhbGrZ8URWUqAofGBq6buE
nWt6tsjF/HBmiO0nP44T/uDCl/F6olYYeaHX6u968uTMgK5T3DiP5yXPlYe35Q0XQdyuUsLMiTUu
pIZDzriKIE/bhHMVjSsQpRbxmIMjt03lZS3lzJa9vmLsOvCuIUkzRjRJid5HmLlK8zvjmRozV9y0
ziUzWoTFkLtgcq9X8NBIiFjRtQLwZdej1hKT3fINDNQib/hMxKC30qesP5p/mQz0xOmYcj8otShY
UTZJ4Ib/jl0AntZMy1+6CtD0DbXDviXr6enfmwr/eOzXeUG2CIDzu7NJffC3m+3fs7mKUx3zriCV
caTv15k8LjAJajGzDJBAAOITByE9a/WR1SL3KdSEU8lBQjgyCKqDG/d+hwj4G/pvHwJ9IzX5vSsf
LH4/0BqXo3EmL3D2TQt03ViiUF4Vrj+MoOgunT91o4YJ2v/9e6zzrVnwQRb0l75qcLubeqrenDtN
XGMtOfJx9RDZZYPpKVrSmD9IDkt1/qoKHJT/GlhFOUAcB2JayFny81TuNNi6ZxvVROYlXxOJ799t
AsOW5x3bRj7F0NGnPIB4FoLj6t0WIXx3d1oq0ydyGvlD0ZxCqaHhM/uH6ucyt5T+8M1bxXcJvXFT
GHPtvqrlshg6wQzbxeEuZ8Z3BcRY//xgoQ8oPm9B1FIzp4bbpQvFK3Qr9SNAgWVZCicHtemJsPy5
gY05VC0GGbJwfFqLwgUinRUOslcuhGIzUJKl4opB+cVZBX4FAzl4hgbga7tCMdpd/qlgqYJ/l4ZD
TNKvN3Jz5Rv0AEu8AvwHlaSilqAya8I3VGiifdj8d2LiLQUMyRqyLJw18+T/gn06q3Vkc6HhElr5
DG61aq9atAHBxOULLhvyGjhdolZRh0yZBQqYke/GDpsZphS1QRaMjmDZ3CEM4Sps21Y66t8DV2n6
TzyUc/wPlT1EAj8mlaBtj9h7TeJxW0Og4THioj/dFCFNW/bLZp+2fClQc3X1tL1sZ55DjNFtZRD2
8VPelMFFaABcaduScdczqdZd/T84etKWT2nE5VlOV7CUFyyH8nAGGmjWaDIV5lpeTchL7noJMA+6
ZmRhz9v6p7yn8nf5LzvSMZ5iipnIIf34fYELZ/n66rPt24pJSZ1s2t1/hc3S//AUuaI/2DjRqJSu
mcoplIbnP+V0SfTUVv8bMxCu97Uoy4VlOBDF/H+1OUDplnwJSNyK9xSSE9y0R7JczNok1uVf2wlc
qoQ7w1ortl5GcvpIsa/VCp09ZhYHM8VbIX5f5TsEbNDO/ZirvjnGmoVjHOM1WCPQuwQaYWIzFyTL
DZQw48mg
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
