// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.1 (win64) Build 3247384 Thu Jun 10 19:36:33 MDT 2021
// Date        : Mon May 23 19:58:06 2022
// Host        : LAPTOP-OKB0SK0I running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/lenovo/Desktop/void/cod/lab5/CODexp-master/Lab6/apply/apply.srcs/sources_1/ip/fifo_generator_0/fifo_generator_0_sim_netlist.v
// Design      : fifo_generator_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "fifo_generator_0,fifo_generator_v13_2_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "fifo_generator_v13_2_5,Vivado 2021.1" *) 
(* NotValidForBitStream *)
module fifo_generator_0
   (clk,
    rst,
    din,
    wr_en,
    rd_en,
    dout,
    full,
    empty,
    wr_rst_busy,
    rd_rst_busy);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 core_clk CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME core_clk, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0" *) input clk;
  input rst;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_DATA" *) input [31:0]din;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE WR_EN" *) input wr_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_EN" *) input rd_en;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ RD_DATA" *) output [31:0]dout;
  (* x_interface_info = "xilinx.com:interface:fifo_write:1.0 FIFO_WRITE FULL" *) output full;
  (* x_interface_info = "xilinx.com:interface:fifo_read:1.0 FIFO_READ EMPTY" *) output empty;
  output wr_rst_busy;
  output rd_rst_busy;

  wire clk;
  wire [31:0]din;
  wire [31:0]dout;
  wire empty;
  wire full;
  wire rd_en;
  wire rd_rst_busy;
  wire rst;
  wire wr_en;
  wire wr_rst_busy;
  wire NLW_U0_almost_empty_UNCONNECTED;
  wire NLW_U0_almost_full_UNCONNECTED;
  wire NLW_U0_axi_ar_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_overflow_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_ar_prog_full_UNCONNECTED;
  wire NLW_U0_axi_ar_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_ar_underflow_UNCONNECTED;
  wire NLW_U0_axi_aw_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_overflow_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_aw_prog_full_UNCONNECTED;
  wire NLW_U0_axi_aw_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_aw_underflow_UNCONNECTED;
  wire NLW_U0_axi_b_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_overflow_UNCONNECTED;
  wire NLW_U0_axi_b_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_b_prog_full_UNCONNECTED;
  wire NLW_U0_axi_b_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_b_underflow_UNCONNECTED;
  wire NLW_U0_axi_r_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_overflow_UNCONNECTED;
  wire NLW_U0_axi_r_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_r_prog_full_UNCONNECTED;
  wire NLW_U0_axi_r_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_r_underflow_UNCONNECTED;
  wire NLW_U0_axi_w_dbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_overflow_UNCONNECTED;
  wire NLW_U0_axi_w_prog_empty_UNCONNECTED;
  wire NLW_U0_axi_w_prog_full_UNCONNECTED;
  wire NLW_U0_axi_w_sbiterr_UNCONNECTED;
  wire NLW_U0_axi_w_underflow_UNCONNECTED;
  wire NLW_U0_axis_dbiterr_UNCONNECTED;
  wire NLW_U0_axis_overflow_UNCONNECTED;
  wire NLW_U0_axis_prog_empty_UNCONNECTED;
  wire NLW_U0_axis_prog_full_UNCONNECTED;
  wire NLW_U0_axis_sbiterr_UNCONNECTED;
  wire NLW_U0_axis_underflow_UNCONNECTED;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_m_axi_arvalid_UNCONNECTED;
  wire NLW_U0_m_axi_awvalid_UNCONNECTED;
  wire NLW_U0_m_axi_bready_UNCONNECTED;
  wire NLW_U0_m_axi_rready_UNCONNECTED;
  wire NLW_U0_m_axi_wlast_UNCONNECTED;
  wire NLW_U0_m_axi_wvalid_UNCONNECTED;
  wire NLW_U0_m_axis_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_tvalid_UNCONNECTED;
  wire NLW_U0_overflow_UNCONNECTED;
  wire NLW_U0_prog_empty_UNCONNECTED;
  wire NLW_U0_prog_full_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_s_axis_tready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire NLW_U0_underflow_UNCONNECTED;
  wire NLW_U0_valid_UNCONNECTED;
  wire NLW_U0_wr_ack_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_ar_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_aw_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_rd_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_axi_b_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_r_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axi_w_wr_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_rd_data_count_UNCONNECTED;
  wire [10:0]NLW_U0_axis_wr_data_count_UNCONNECTED;
  wire [4:0]NLW_U0_data_count_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_araddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_arburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_arlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_arlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_arregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_arsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_aruser_UNCONNECTED;
  wire [31:0]NLW_U0_m_axi_awaddr_UNCONNECTED;
  wire [1:0]NLW_U0_m_axi_awburst_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awcache_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_awlen_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awlock_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awprot_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awqos_UNCONNECTED;
  wire [3:0]NLW_U0_m_axi_awregion_UNCONNECTED;
  wire [2:0]NLW_U0_m_axi_awsize_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_awuser_UNCONNECTED;
  wire [63:0]NLW_U0_m_axi_wdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wid_UNCONNECTED;
  wire [7:0]NLW_U0_m_axi_wstrb_UNCONNECTED;
  wire [0:0]NLW_U0_m_axi_wuser_UNCONNECTED;
  wire [7:0]NLW_U0_m_axis_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tid_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tkeep_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_tstrb_UNCONNECTED;
  wire [3:0]NLW_U0_m_axis_tuser_UNCONNECTED;
  wire [4:0]NLW_U0_rd_data_count_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_buser_UNCONNECTED;
  wire [63:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_ruser_UNCONNECTED;
  wire [4:0]NLW_U0_wr_data_count_UNCONNECTED;

  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "8" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "1" *) 
  (* C_AXIS_TSTRB_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "4" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "1" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "1" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "1" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "5" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "32" *) 
  (* C_DIN_WIDTH_AXIS = "1" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "1" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "32" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_FULL_FLAGS_RST_VAL = "0" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "0" *) 
  (* C_HAS_AXIS_TLAST = "0" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "1" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "1" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "0" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "1" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "1" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "1kx18" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "1kx36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "30" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "1023" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "29" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "5" *) 
  (* C_RD_DEPTH = "32" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "5" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "5" *) 
  (* C_WR_DEPTH = "32" *) 
  (* C_WR_DEPTH_AXIS = "1024" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "5" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "10" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  (* is_du_within_envelope = "true" *) 
  fifo_generator_0_fifo_generator_v13_2_5 U0
       (.almost_empty(NLW_U0_almost_empty_UNCONNECTED),
        .almost_full(NLW_U0_almost_full_UNCONNECTED),
        .axi_ar_data_count(NLW_U0_axi_ar_data_count_UNCONNECTED[4:0]),
        .axi_ar_dbiterr(NLW_U0_axi_ar_dbiterr_UNCONNECTED),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(NLW_U0_axi_ar_overflow_UNCONNECTED),
        .axi_ar_prog_empty(NLW_U0_axi_ar_prog_empty_UNCONNECTED),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(NLW_U0_axi_ar_prog_full_UNCONNECTED),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(NLW_U0_axi_ar_rd_data_count_UNCONNECTED[4:0]),
        .axi_ar_sbiterr(NLW_U0_axi_ar_sbiterr_UNCONNECTED),
        .axi_ar_underflow(NLW_U0_axi_ar_underflow_UNCONNECTED),
        .axi_ar_wr_data_count(NLW_U0_axi_ar_wr_data_count_UNCONNECTED[4:0]),
        .axi_aw_data_count(NLW_U0_axi_aw_data_count_UNCONNECTED[4:0]),
        .axi_aw_dbiterr(NLW_U0_axi_aw_dbiterr_UNCONNECTED),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(NLW_U0_axi_aw_overflow_UNCONNECTED),
        .axi_aw_prog_empty(NLW_U0_axi_aw_prog_empty_UNCONNECTED),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(NLW_U0_axi_aw_prog_full_UNCONNECTED),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(NLW_U0_axi_aw_rd_data_count_UNCONNECTED[4:0]),
        .axi_aw_sbiterr(NLW_U0_axi_aw_sbiterr_UNCONNECTED),
        .axi_aw_underflow(NLW_U0_axi_aw_underflow_UNCONNECTED),
        .axi_aw_wr_data_count(NLW_U0_axi_aw_wr_data_count_UNCONNECTED[4:0]),
        .axi_b_data_count(NLW_U0_axi_b_data_count_UNCONNECTED[4:0]),
        .axi_b_dbiterr(NLW_U0_axi_b_dbiterr_UNCONNECTED),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(NLW_U0_axi_b_overflow_UNCONNECTED),
        .axi_b_prog_empty(NLW_U0_axi_b_prog_empty_UNCONNECTED),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(NLW_U0_axi_b_prog_full_UNCONNECTED),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(NLW_U0_axi_b_rd_data_count_UNCONNECTED[4:0]),
        .axi_b_sbiterr(NLW_U0_axi_b_sbiterr_UNCONNECTED),
        .axi_b_underflow(NLW_U0_axi_b_underflow_UNCONNECTED),
        .axi_b_wr_data_count(NLW_U0_axi_b_wr_data_count_UNCONNECTED[4:0]),
        .axi_r_data_count(NLW_U0_axi_r_data_count_UNCONNECTED[10:0]),
        .axi_r_dbiterr(NLW_U0_axi_r_dbiterr_UNCONNECTED),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(NLW_U0_axi_r_overflow_UNCONNECTED),
        .axi_r_prog_empty(NLW_U0_axi_r_prog_empty_UNCONNECTED),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(NLW_U0_axi_r_prog_full_UNCONNECTED),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(NLW_U0_axi_r_rd_data_count_UNCONNECTED[10:0]),
        .axi_r_sbiterr(NLW_U0_axi_r_sbiterr_UNCONNECTED),
        .axi_r_underflow(NLW_U0_axi_r_underflow_UNCONNECTED),
        .axi_r_wr_data_count(NLW_U0_axi_r_wr_data_count_UNCONNECTED[10:0]),
        .axi_w_data_count(NLW_U0_axi_w_data_count_UNCONNECTED[10:0]),
        .axi_w_dbiterr(NLW_U0_axi_w_dbiterr_UNCONNECTED),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(NLW_U0_axi_w_overflow_UNCONNECTED),
        .axi_w_prog_empty(NLW_U0_axi_w_prog_empty_UNCONNECTED),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(NLW_U0_axi_w_prog_full_UNCONNECTED),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(NLW_U0_axi_w_rd_data_count_UNCONNECTED[10:0]),
        .axi_w_sbiterr(NLW_U0_axi_w_sbiterr_UNCONNECTED),
        .axi_w_underflow(NLW_U0_axi_w_underflow_UNCONNECTED),
        .axi_w_wr_data_count(NLW_U0_axi_w_wr_data_count_UNCONNECTED[10:0]),
        .axis_data_count(NLW_U0_axis_data_count_UNCONNECTED[10:0]),
        .axis_dbiterr(NLW_U0_axis_dbiterr_UNCONNECTED),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(NLW_U0_axis_overflow_UNCONNECTED),
        .axis_prog_empty(NLW_U0_axis_prog_empty_UNCONNECTED),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(NLW_U0_axis_prog_full_UNCONNECTED),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(NLW_U0_axis_rd_data_count_UNCONNECTED[10:0]),
        .axis_sbiterr(NLW_U0_axis_sbiterr_UNCONNECTED),
        .axis_underflow(NLW_U0_axis_underflow_UNCONNECTED),
        .axis_wr_data_count(NLW_U0_axis_wr_data_count_UNCONNECTED[10:0]),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(clk),
        .data_count(NLW_U0_data_count_UNCONNECTED[4:0]),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(1'b0),
        .m_aclk_en(1'b0),
        .m_axi_araddr(NLW_U0_m_axi_araddr_UNCONNECTED[31:0]),
        .m_axi_arburst(NLW_U0_m_axi_arburst_UNCONNECTED[1:0]),
        .m_axi_arcache(NLW_U0_m_axi_arcache_UNCONNECTED[3:0]),
        .m_axi_arid(NLW_U0_m_axi_arid_UNCONNECTED[0]),
        .m_axi_arlen(NLW_U0_m_axi_arlen_UNCONNECTED[7:0]),
        .m_axi_arlock(NLW_U0_m_axi_arlock_UNCONNECTED[0]),
        .m_axi_arprot(NLW_U0_m_axi_arprot_UNCONNECTED[2:0]),
        .m_axi_arqos(NLW_U0_m_axi_arqos_UNCONNECTED[3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(NLW_U0_m_axi_arregion_UNCONNECTED[3:0]),
        .m_axi_arsize(NLW_U0_m_axi_arsize_UNCONNECTED[2:0]),
        .m_axi_aruser(NLW_U0_m_axi_aruser_UNCONNECTED[0]),
        .m_axi_arvalid(NLW_U0_m_axi_arvalid_UNCONNECTED),
        .m_axi_awaddr(NLW_U0_m_axi_awaddr_UNCONNECTED[31:0]),
        .m_axi_awburst(NLW_U0_m_axi_awburst_UNCONNECTED[1:0]),
        .m_axi_awcache(NLW_U0_m_axi_awcache_UNCONNECTED[3:0]),
        .m_axi_awid(NLW_U0_m_axi_awid_UNCONNECTED[0]),
        .m_axi_awlen(NLW_U0_m_axi_awlen_UNCONNECTED[7:0]),
        .m_axi_awlock(NLW_U0_m_axi_awlock_UNCONNECTED[0]),
        .m_axi_awprot(NLW_U0_m_axi_awprot_UNCONNECTED[2:0]),
        .m_axi_awqos(NLW_U0_m_axi_awqos_UNCONNECTED[3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(NLW_U0_m_axi_awregion_UNCONNECTED[3:0]),
        .m_axi_awsize(NLW_U0_m_axi_awsize_UNCONNECTED[2:0]),
        .m_axi_awuser(NLW_U0_m_axi_awuser_UNCONNECTED[0]),
        .m_axi_awvalid(NLW_U0_m_axi_awvalid_UNCONNECTED),
        .m_axi_bid(1'b0),
        .m_axi_bready(NLW_U0_m_axi_bready_UNCONNECTED),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid(1'b0),
        .m_axi_rlast(1'b0),
        .m_axi_rready(NLW_U0_m_axi_rready_UNCONNECTED),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(NLW_U0_m_axi_wdata_UNCONNECTED[63:0]),
        .m_axi_wid(NLW_U0_m_axi_wid_UNCONNECTED[0]),
        .m_axi_wlast(NLW_U0_m_axi_wlast_UNCONNECTED),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(NLW_U0_m_axi_wstrb_UNCONNECTED[7:0]),
        .m_axi_wuser(NLW_U0_m_axi_wuser_UNCONNECTED[0]),
        .m_axi_wvalid(NLW_U0_m_axi_wvalid_UNCONNECTED),
        .m_axis_tdata(NLW_U0_m_axis_tdata_UNCONNECTED[7:0]),
        .m_axis_tdest(NLW_U0_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_U0_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(NLW_U0_m_axis_tkeep_UNCONNECTED[0]),
        .m_axis_tlast(NLW_U0_m_axis_tlast_UNCONNECTED),
        .m_axis_tready(1'b0),
        .m_axis_tstrb(NLW_U0_m_axis_tstrb_UNCONNECTED[0]),
        .m_axis_tuser(NLW_U0_m_axis_tuser_UNCONNECTED[3:0]),
        .m_axis_tvalid(NLW_U0_m_axis_tvalid_UNCONNECTED),
        .overflow(NLW_U0_overflow_UNCONNECTED),
        .prog_empty(NLW_U0_prog_empty_UNCONNECTED),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(NLW_U0_prog_full_UNCONNECTED),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(NLW_U0_rd_data_count_UNCONNECTED[4:0]),
        .rd_en(rd_en),
        .rd_rst(1'b0),
        .rd_rst_busy(rd_rst_busy),
        .rst(rst),
        .s_aclk(1'b0),
        .s_aclk_en(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid(1'b0),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock(1'b0),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid(1'b0),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock(1'b0),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_buser(NLW_U0_s_axi_buser_UNCONNECTED[0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[63:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_ruser(NLW_U0_s_axi_ruser_UNCONNECTED[0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(1'b0),
        .s_axis_tlast(1'b0),
        .s_axis_tready(NLW_U0_s_axis_tready_UNCONNECTED),
        .s_axis_tstrb(1'b0),
        .s_axis_tuser({1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(NLW_U0_underflow_UNCONNECTED),
        .valid(NLW_U0_valid_UNCONNECTED),
        .wr_ack(NLW_U0_wr_ack_UNCONNECTED),
        .wr_clk(1'b0),
        .wr_data_count(NLW_U0_wr_data_count_UNCONNECTED[4:0]),
        .wr_en(wr_en),
        .wr_rst(1'b0),
        .wr_rst_busy(wr_rst_busy));
endmodule

(* DEF_VAL = "1'b1" *) (* DEST_SYNC_FF = "5" *) (* INIT = "1" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_generator_0_xpm_cdc_sync_rst
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [4:0]syncstages_ff;

  assign dest_rst = syncstages_ff[4];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[3] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[2]),
        .Q(syncstages_ff[3]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b1)) 
    \syncstages_ff_reg[4] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[3]),
        .Q(syncstages_ff[4]),
        .R(1'b0));
endmodule

(* DEF_VAL = "1'b0" *) (* DEST_SYNC_FF = "3" *) (* INIT = "0" *) 
(* INIT_SYNC_FF = "0" *) (* ORIG_REF_NAME = "xpm_cdc_sync_rst" *) (* SIM_ASSERT_CHK = "0" *) 
(* VERSION = "0" *) (* XPM_MODULE = "TRUE" *) (* is_du_within_envelope = "true" *) 
(* keep_hierarchy = "true" *) (* xpm_cdc = "SYNC_RST" *) 
module fifo_generator_0_xpm_cdc_sync_rst__parameterized1
   (src_rst,
    dest_clk,
    dest_rst);
  input src_rst;
  input dest_clk;
  output dest_rst;

  wire dest_clk;
  wire src_rst;
  (* RTL_KEEP = "true" *) (* async_reg = "true" *) (* xpm_cdc = "SYNC_RST" *) wire [2:0]syncstages_ff;

  assign dest_rst = syncstages_ff[2];
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[0] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(src_rst),
        .Q(syncstages_ff[0]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[1] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[0]),
        .Q(syncstages_ff[1]),
        .R(1'b0));
  (* ASYNC_REG *) 
  (* KEEP = "true" *) 
  (* XPM_CDC = "SYNC_RST" *) 
  FDRE #(
    .INIT(1'b0)) 
    \syncstages_ff_reg[2] 
       (.C(dest_clk),
        .CE(1'b1),
        .D(syncstages_ff[1]),
        .Q(syncstages_ff[2]),
        .R(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2021.1"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
sbNGmomEbP78s1hfxgX3P1Jo01EKJk0i0C7iGpF+Yibr9EK0s4mcIifHDN/ag4jpPwW3bPllMHvn
U8AEY3mO8hCXVVoilrcRuCaEna/98GycCzy4G7FnYMfowsJb5k9ifRdE2jnurzeTLFbupUSpDF0H
Rl3Ci3DTGeExAZZ9UQE=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zZZZoIprBFYfDWmCCcduELBM7HU98/+rvP9g8+y1mYyD3r3HEDm4ZwehwZvPoYWqoGXYoFqWZh3h
utt0abIfUW9/oF2vJ9hXn7nArtcm/Eui18rPYqp3aj/AItPNVXojk9zp7uFZLPTqcyig5v3Jtenl
qPnLi1Z84ZCW7NIRw6Y0bgmw6z26E8VPbYrZHs+0YW8Sztjo6CdIrQeEL5WBDolA0aHoKHWRZyFs
l5eRDmBAolj2uF07t/3eY3J7cYJmEDaoZ0TR1qcz25VFNu0OlcrEJ19IT+QdAxTah4jqJtknGZrT
6lUMwDZ7dBQwF1EuaE6p90gGNERhGAsbHLdvaw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
KUbz0Iu2faeWqD6HFeuGLtSOAlqZmpKCCJfzym8tkcWUUNgNMn2mYvx6PTM7j4tyig8JdUG3uZYs
NfPgAsNXQtTI7b19u9CkMks9jR+oEzX1rW7QtTvSj/nHZLg2smoFwuB5Ieb7/B8IIs1NTUrIz6Rc
itLQVG+L+GMziamsrx4=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
G7XYdRx9VGclyxTEtwMG+rjJHV8bfBxEGdkcN82UL3koN3Dt0M5AWkzEvHcskt1W0hTOjyYgmvYj
/p70w1nz96tlg226+e4UubpRmBH9QXBBX6UmqIwSiHj9H+XI1yNfTIdlwBKGQvfzwCAMwBwrrrGL
/804k5Ux3RhWRvwezZB4+sj9DFm4akREVXmNpfeqjI2X02LU/MxWMUbKxvjJnD9YxikAAO6ccTd6
8DKv76V76MEFVyXc7E2FeQDToW3lqkRTa6MTpIXbYSekRihQC+qPVuhPUneA4kepvQDfgFYE8/Ir
gu5gK+s/qNfuXhJUAqyLjslrUcY4+XD9ckpSvQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YXkYRXpUPv/tETnwnThdQ46UaPmI23lN9vrxHQjIOhq3WNJCuz7TYZK9hyzSdo6k0U6QE9ihQy2L
rYZg68RGbrK8bzlcnQ41r18LZb4GYlAn9PH7IrF1B+aHm3578doOZHf8wzUE2s+d1aHQIn6VIZjL
14pCTAjErJfMO13fgX6h8sgxb4GFC3eIORmkrq2J/fB9HALyh/qdGiLi7DejMfmdsssbOcPQTZUh
6Belf7fHTkIEr9B44rFZgMyrMVx4N9p0XpXD3JPe7Xeg6a3jxdqxHATaMuLdIa4s+ZiAz1TRx0EO
FFihCnLLb7weBBITQyTIncRL817BrF/ZXZD8Yw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_01", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
g7FbNw1ywd4TBNHq8OmK/4zoKI/t7vKmyT8R8SeiyUtKywhn0/7DZ/lV0Lf4IhY8X5MYsKtOQ5l6
DIl3fxtOhxpi8NHn9Nw3Nfb8NnS38Zuy6DSpwOL0f/GSmUSf2/YdB5Ben6xibQT0Oy//oBl5/1kR
pV5fWjj8WRgI6cnmfyj3g1MxepxPu1A/UHxlm1/i9yUHHi114N/hEQ0iujjrn6GxfZSiJUVF+r6c
rnxD//eOAl/YaxhdU/KhUkfsMn+MxtA5m6hTYYE0bnze8rpmEU5UGYKyY0p8KUs+MgsdTe+m/7gV
HSf6puBqQmEa1qksRfl742aL9B9y169or7Jp9Q==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kd1A2zIphLxXB0RyfHIqLkHXfWl0n38vROERuDghYrhK0ItcWGEP0XBrri6k1VZCSPYwiSu//pM6
83BfcPKbk09/A+ksvDIa3xS8Tg7DJK2AS+0pdnzBSjVWh+QD+glA3Hjk6LG9OMbjXyqD3hnMKacA
VRMwxKktV+KT5NXj5a7fMxXjo9exc0xM+woUJiSYs8onoUSwfBeH5/xhUy+iu+w0/OOydQE2LXZ0
1y+RObiz5C22dD4GGCfuvUCGAthYpUf633ZxRYN45mmAn5PxPsH4o+l2GhH/50Gu/VPVoAWDhgXQ
e93oPri++HinkK2uvDhDl4PI9HtRkq11Ky3uXQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
gDrrFgXHVyBo+Cn0bYn+SOSOCXPg7besukY6l0JmA/nu4gap105Wxbg11c7TJZ9ctHVLc5DXAxr+
EIvFpAIepoZBREtMjTlaIdNJ8k1nUpwAv2jaQeseq1TudTjugV1jtOYYk0RKd88z/6SJ8t9urDW0
yKqsfEWU3PwGcUGHOWtTn2hfAceNznmEIFWLmFmzSQJ1hQNdsIQn3jHnfMVYu8cAz5xvPVQWYyJW
pMHXhNYk6GyAjIshh991slb1g01K1ilR2tKD1EmxH5WGrX9BEUqBjHQo6uluC/d3mvcEQ5nJ1v+P
hIlj4qzUQT1wXjpk6d/BvNx7LyWmj5iq35dzNm+cdhfGwaFGG//vgmB6D/dFfs2BYSjHsa6VlpVM
7e2OgoFenuG9p1SVPI6gAs2MuFtnDKfxW7jS3RGhvsquS3tg1iFCDH/OU7E5aWfY7twF3yyN6G10
l72RZw62DfNoCdyUMG9sA8nc4qf6dEhyrr5S6XxpJhoBDJvkeq0TCUQZ

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XR7vRF1m+9DS2Pv4r/O4uHwmvtXkChnKbsJCYczn1dvkZbcZSbBm/2UH78dXUaNorOh9XAuCvSjb
ER73y7e0anAfaIf1tJ9Y9pIb8EuNxGS/Pqdvg36cWarwGac9tsscdv/HWfb5Z+qWEk0/uFcLI7pH
CZO7fF2/ONQjA0NtUFBjW4idlx8WrySIuJgDs4jyGkMhbHR3U/ghF1YhMhwgwsbbcptfC1XLrIqQ
OecZnZu8E2hyc5eK/ccYdKcHnXoL55z1p5amI6Fuvz0wKTz2QQ/mwXodfGjEC1ZRWwTn7zCFM91M
qrA1Is49i6pSa7/VICjgn8ULMT1oKGfJLPm7hg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 83920)
`pragma protect data_block
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
MuvCZJlQUuAsUNfondnW4w==
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
