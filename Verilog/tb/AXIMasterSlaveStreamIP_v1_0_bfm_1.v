//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Apr 28 17:09:04 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target AXIMasterSlaveStreamIP_v1_0_bfm_1.bd
//Design      : AXIMasterSlaveStreamIP_v1_0_bfm_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "AXIMasterSlaveStreamIP_v1_0_bfm_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=AXIMasterSlaveStreamIP_v1_0_bfm_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=2,numReposBlks=2,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "AXIMasterSlaveStreamIP_v1_0_bfm_1.hwdef" *) 
module AXIMasterSlaveStreamIP_v1_0_bfm_1
   (ACLK,
    ARESETN,
    M00_AXIS_0_tdata,
    M00_AXIS_0_tlast,
    M00_AXIS_0_tready,
    M00_AXIS_0_tstrb,
    M00_AXIS_0_tvalid,
    S00_AXIS_0_tdata,
    S00_AXIS_0_tlast,
    S00_AXIS_0_tready,
    S00_AXIS_0_tstrb,
    S00_AXIS_0_tvalid);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ACLK, ASSOCIATED_BUSIF S00_AXIS_0:M00_AXIS_0, ASSOCIATED_RESET ARESETN, CLK_DOMAIN AXIMasterSlaveStreamIP_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.000" *) input ACLK;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input ARESETN;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M00_AXIS_0, CLK_DOMAIN AXIMasterSlaveStreamIP_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [31:0]M00_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS_0 TLAST" *) output M00_AXIS_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS_0 TREADY" *) input M00_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS_0 TSTRB" *) output [3:0]M00_AXIS_0_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M00_AXIS_0 TVALID" *) output M00_AXIS_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXIS_0, CLK_DOMAIN AXIMasterSlaveStreamIP_v1_0_bfm_1_ACLK, FREQ_HZ 100000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 1, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [31:0]S00_AXIS_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS_0 TLAST" *) input S00_AXIS_0_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS_0 TREADY" *) output S00_AXIS_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS_0 TSTRB" *) input [3:0]S00_AXIS_0_tstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S00_AXIS_0 TVALID" *) input S00_AXIS_0_tvalid;

  wire [31:0]AXIMasterSlaveStreamIP_0_M00_AXIS_TDATA;
  wire AXIMasterSlaveStreamIP_0_M00_AXIS_TLAST;
  wire AXIMasterSlaveStreamIP_0_M00_AXIS_TREADY;
  wire [3:0]AXIMasterSlaveStreamIP_0_M00_AXIS_TSTRB;
  wire AXIMasterSlaveStreamIP_0_M00_AXIS_TVALID;
  wire [31:0]S00_AXIS_0_1_TDATA;
  wire S00_AXIS_0_1_TLAST;
  wire S00_AXIS_0_1_TREADY;
  wire [3:0]S00_AXIS_0_1_TSTRB;
  wire S00_AXIS_0_1_TVALID;
  wire aclk_net;
  wire aresetn_net;
  wire [31:0]master_0_M_AXI_ARADDR;
  wire [2:0]master_0_M_AXI_ARPROT;
  wire master_0_M_AXI_ARREADY;
  wire master_0_M_AXI_ARVALID;
  wire [31:0]master_0_M_AXI_AWADDR;
  wire [2:0]master_0_M_AXI_AWPROT;
  wire master_0_M_AXI_AWREADY;
  wire master_0_M_AXI_AWVALID;
  wire master_0_M_AXI_BREADY;
  wire [1:0]master_0_M_AXI_BRESP;
  wire master_0_M_AXI_BVALID;
  wire [31:0]master_0_M_AXI_RDATA;
  wire master_0_M_AXI_RREADY;
  wire [1:0]master_0_M_AXI_RRESP;
  wire master_0_M_AXI_RVALID;
  wire [31:0]master_0_M_AXI_WDATA;
  wire master_0_M_AXI_WREADY;
  wire [3:0]master_0_M_AXI_WSTRB;
  wire master_0_M_AXI_WVALID;

  assign AXIMasterSlaveStreamIP_0_M00_AXIS_TREADY = M00_AXIS_0_tready;
  assign M00_AXIS_0_tdata[31:0] = AXIMasterSlaveStreamIP_0_M00_AXIS_TDATA;
  assign M00_AXIS_0_tlast = AXIMasterSlaveStreamIP_0_M00_AXIS_TLAST;
  assign M00_AXIS_0_tstrb[3:0] = AXIMasterSlaveStreamIP_0_M00_AXIS_TSTRB;
  assign M00_AXIS_0_tvalid = AXIMasterSlaveStreamIP_0_M00_AXIS_TVALID;
  assign S00_AXIS_0_1_TDATA = S00_AXIS_0_tdata[31:0];
  assign S00_AXIS_0_1_TLAST = S00_AXIS_0_tlast;
  assign S00_AXIS_0_1_TSTRB = S00_AXIS_0_tstrb[3:0];
  assign S00_AXIS_0_1_TVALID = S00_AXIS_0_tvalid;
  assign S00_AXIS_0_tready = S00_AXIS_0_1_TREADY;
  assign aclk_net = ACLK;
  assign aresetn_net = ARESETN;
  AXIMasterSlaveStreamIP_v1_0_bfm_1_AXIMasterSlaveStreamIP_0_0 AXIMasterSlaveStreamIP_0
       (.m00_axis_aclk(aclk_net),
        .m00_axis_aresetn(aresetn_net),
        .m00_axis_tdata(AXIMasterSlaveStreamIP_0_M00_AXIS_TDATA),
        .m00_axis_tlast(AXIMasterSlaveStreamIP_0_M00_AXIS_TLAST),
        .m00_axis_tready(AXIMasterSlaveStreamIP_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(AXIMasterSlaveStreamIP_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(AXIMasterSlaveStreamIP_0_M00_AXIS_TVALID),
        .s00_axi_aclk(aclk_net),
        .s00_axi_araddr(master_0_M_AXI_ARADDR[4:0]),
        .s00_axi_aresetn(aresetn_net),
        .s00_axi_arprot(master_0_M_AXI_ARPROT),
        .s00_axi_arready(master_0_M_AXI_ARREADY),
        .s00_axi_arvalid(master_0_M_AXI_ARVALID),
        .s00_axi_awaddr(master_0_M_AXI_AWADDR[4:0]),
        .s00_axi_awprot(master_0_M_AXI_AWPROT),
        .s00_axi_awready(master_0_M_AXI_AWREADY),
        .s00_axi_awvalid(master_0_M_AXI_AWVALID),
        .s00_axi_bready(master_0_M_AXI_BREADY),
        .s00_axi_bresp(master_0_M_AXI_BRESP),
        .s00_axi_bvalid(master_0_M_AXI_BVALID),
        .s00_axi_rdata(master_0_M_AXI_RDATA),
        .s00_axi_rready(master_0_M_AXI_RREADY),
        .s00_axi_rresp(master_0_M_AXI_RRESP),
        .s00_axi_rvalid(master_0_M_AXI_RVALID),
        .s00_axi_wdata(master_0_M_AXI_WDATA),
        .s00_axi_wready(master_0_M_AXI_WREADY),
        .s00_axi_wstrb(master_0_M_AXI_WSTRB),
        .s00_axi_wvalid(master_0_M_AXI_WVALID),
        .s00_axis_aclk(aclk_net),
        .s00_axis_aresetn(aresetn_net),
        .s00_axis_tdata(S00_AXIS_0_1_TDATA),
        .s00_axis_tlast(S00_AXIS_0_1_TLAST),
        .s00_axis_tready(S00_AXIS_0_1_TREADY),
        .s00_axis_tstrb(S00_AXIS_0_1_TSTRB),
        .s00_axis_tvalid(S00_AXIS_0_1_TVALID));
  AXIMasterSlaveStreamIP_v1_0_bfm_1_master_0_0 master_0
       (.aclk(aclk_net),
        .aresetn(aresetn_net),
        .m_axi_araddr(master_0_M_AXI_ARADDR),
        .m_axi_arprot(master_0_M_AXI_ARPROT),
        .m_axi_arready(master_0_M_AXI_ARREADY),
        .m_axi_arvalid(master_0_M_AXI_ARVALID),
        .m_axi_awaddr(master_0_M_AXI_AWADDR),
        .m_axi_awprot(master_0_M_AXI_AWPROT),
        .m_axi_awready(master_0_M_AXI_AWREADY),
        .m_axi_awvalid(master_0_M_AXI_AWVALID),
        .m_axi_bready(master_0_M_AXI_BREADY),
        .m_axi_bresp(master_0_M_AXI_BRESP),
        .m_axi_bvalid(master_0_M_AXI_BVALID),
        .m_axi_rdata(master_0_M_AXI_RDATA),
        .m_axi_rready(master_0_M_AXI_RREADY),
        .m_axi_rresp(master_0_M_AXI_RRESP),
        .m_axi_rvalid(master_0_M_AXI_RVALID),
        .m_axi_wdata(master_0_M_AXI_WDATA),
        .m_axi_wready(master_0_M_AXI_WREADY),
        .m_axi_wstrb(master_0_M_AXI_WSTRB),
        .m_axi_wvalid(master_0_M_AXI_WVALID));
endmodule
