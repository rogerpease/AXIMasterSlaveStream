//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Apr 28 17:09:00 2021
//Host        : rpeaseryzen running 64-bit Ubuntu 20.04.2 LTS
//Command     : generate_target AXIMasterSlaveStreamIP_v1_0_bfm_1_wrapper.bd
//Design      : AXIMasterSlaveStreamIP_v1_0_bfm_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AXIMasterSlaveStreamIP_v1_0_bfm_1_wrapper
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
  input ACLK;
  input ARESETN;
  output [31:0]M00_AXIS_0_tdata;
  output M00_AXIS_0_tlast;
  input M00_AXIS_0_tready;
  output [3:0]M00_AXIS_0_tstrb;
  output M00_AXIS_0_tvalid;
  input [31:0]S00_AXIS_0_tdata;
  input S00_AXIS_0_tlast;
  output S00_AXIS_0_tready;
  input [3:0]S00_AXIS_0_tstrb;
  input S00_AXIS_0_tvalid;

  wire ACLK;
  wire ARESETN;
  wire [31:0]M00_AXIS_0_tdata;
  wire M00_AXIS_0_tlast;
  wire M00_AXIS_0_tready;
  wire [3:0]M00_AXIS_0_tstrb;
  wire M00_AXIS_0_tvalid;
  wire [31:0]S00_AXIS_0_tdata;
  wire S00_AXIS_0_tlast;
  wire S00_AXIS_0_tready;
  wire [3:0]S00_AXIS_0_tstrb;
  wire S00_AXIS_0_tvalid;

  AXIMasterSlaveStreamIP_v1_0_bfm_1 AXIMasterSlaveStreamIP_v1_0_bfm_1_i
       (.ACLK(ACLK),
        .ARESETN(ARESETN),
        .M00_AXIS_0_tdata(M00_AXIS_0_tdata),
        .M00_AXIS_0_tlast(M00_AXIS_0_tlast),
        .M00_AXIS_0_tready(M00_AXIS_0_tready),
        .M00_AXIS_0_tstrb(M00_AXIS_0_tstrb),
        .M00_AXIS_0_tvalid(M00_AXIS_0_tvalid),
        .S00_AXIS_0_tdata(S00_AXIS_0_tdata),
        .S00_AXIS_0_tlast(S00_AXIS_0_tlast),
        .S00_AXIS_0_tready(S00_AXIS_0_tready),
        .S00_AXIS_0_tstrb(S00_AXIS_0_tstrb),
        .S00_AXIS_0_tvalid(S00_AXIS_0_tvalid));
endmodule
