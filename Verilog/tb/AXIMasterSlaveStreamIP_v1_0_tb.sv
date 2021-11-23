
`timescale 1ns / 1ps
`include "AXIMasterSlaveStreamIP_v1_0_tb_include.svh"

import axi_vip_pkg::*;
import AXIMasterSlaveStreamIP_v1_0_bfm_1_master_0_0_pkg::*;

module AXIMasterSlaveStreamIP_v1_0_tb();


xil_axi_uint                            error_cnt = 0;
xil_axi_uint                            comparison_cnt = 0;
axi_transaction                         wr_transaction;   
axi_transaction                         rd_transaction;   
axi_monitor_transaction                 mst_monitor_transaction;  
axi_monitor_transaction                 master_moniter_transaction_queue[$];  
xil_axi_uint                            master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 mst_scb_transaction;  
axi_monitor_transaction                 passthrough_monitor_transaction;  
axi_monitor_transaction                 passthrough_master_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_master_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_mst_scb_transaction;  
axi_monitor_transaction                 passthrough_slave_moniter_transaction_queue[$];  
xil_axi_uint                            passthrough_slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 passthrough_slv_scb_transaction;  
axi_monitor_transaction                 slv_monitor_transaction;  
axi_monitor_transaction                 slave_moniter_transaction_queue[$];  
xil_axi_uint                            slave_moniter_transaction_queue_size =0;  
axi_monitor_transaction                 slv_scb_transaction;  
xil_axi_uint                           mst_agent_verbosity = 0;  
xil_axi_uint                           slv_agent_verbosity = 0;  
xil_axi_uint                           passthrough_agent_verbosity = 0;  
bit                                     clock;
bit                                     reset;
integer result_slave;  
bit [31:0] S00_AXI_test_data[3:0]; 
 localparam LC_AXI_BURST_LENGTH = 8; 
 localparam LC_AXI_DATA_WIDTH = 32; 
task automatic COMPARE_DATA; 
  input [(LC_AXI_BURST_LENGTH * LC_AXI_DATA_WIDTH)-1:0]expected; 
  input [(LC_AXI_BURST_LENGTH * LC_AXI_DATA_WIDTH)-1:0]actual; 
  begin 
    if (expected === 'hx || actual === 'hx) begin 
      $display("TESTBENCH ERROR! COMPARE_DATA cannot be performed with an expected or actual vector that is all 'x'!"); 
 result_slave = 0;    $stop; 
  end 
  if (actual != expected) begin 
    $display("TESTBENCH ERROR! Data expected is not equal to actual.",     " expected = 0x%h",expected,     " actual   = 0x%h",actual); 
    result_slave = 0; 
    $stop; 
  end 
  else  
    begin 
     $display("TESTBENCH Passed! Data expected is equal to actual.", 
              " expected = 0x%h",expected,               " actual   = 0x%h",actual); 
    end 
  end 
endtask 
integer                                 i; 
integer                                 j;  
xil_axi_uint                            trans_cnt_before_switch = 48;  
xil_axi_uint                            passthrough_cmd_switch_cnt = 0;  
event                                   passthrough_mastermode_start_event;  
event                                   passthrough_mastermode_end_event;  
event                                   passthrough_slavemode_end_event;  
xil_axi_uint                            mtestID;  
xil_axi_ulong                           mtestADDR;  
xil_axi_len_t                           mtestBurstLength;  
xil_axi_size_t                          mtestDataSize;   
xil_axi_burst_t                         mtestBurstType;   
xil_axi_lock_t                          mtestLOCK;  
xil_axi_cache_t                         mtestCacheType = 0;  
xil_axi_prot_t                          mtestProtectionType = 3'b000;  
xil_axi_region_t                        mtestRegion = 4'b000;  
xil_axi_qos_t                           mtestQOS = 4'b000;  
xil_axi_data_beat                       dbeat;  
xil_axi_data_beat [255:0]               mtestWUSER;   
xil_axi_data_beat                       mtestAWUSER = 'h0;  
xil_axi_data_beat                       mtestARUSER = 0;  
xil_axi_data_beat [255:0]               mtestRUSER;      
xil_axi_uint                            mtestBUSER = 0;  
xil_axi_resp_t                          mtestBresp;  
xil_axi_resp_t[255:0]                   mtestRresp;  
bit [63:0]                              mtestWDataL; 
bit [63:0]                              mtestRDataL; 
axi_transaction                         pss_wr_transaction;   
axi_transaction                         pss_rd_transaction;   
axi_transaction                         reactive_transaction;   
axi_transaction                         rd_payload_transaction;  
axi_transaction                         wr_rand;  
axi_transaction                         rd_rand;  
axi_transaction                         wr_reactive;  
axi_transaction                         rd_reactive;  
axi_transaction                         wr_reactive2;   
axi_transaction                         rd_reactive2;  
axi_ready_gen                           bready_gen;  
axi_ready_gen                           rready_gen;  
axi_ready_gen                           awready_gen;  
axi_ready_gen                           wready_gen;  
axi_ready_gen                           arready_gen;  
axi_ready_gen                           bready_gen2;  
axi_ready_gen                           rready_gen2;  
axi_ready_gen                           awready_gen2;  
axi_ready_gen                           wready_gen2;  
axi_ready_gen                           arready_gen2;  
xil_axi_payload_byte                    data_mem[xil_axi_ulong];  
AXIMasterSlaveStreamIP_v1_0_bfm_1_master_0_0_mst_t          mst_agent_0;

  `BD_WRAPPER DUT(
      .ARESETN(reset), 
      .ACLK(clock) 
    ); 

 



  
initial begin
   mst_agent_0 = new("master vip agent",DUT.`BD_INST_NAME.master_0.inst.IF);//ms  
   mst_agent_0.vif_proxy.set_dummy_drive_type(XIL_AXI_VIF_DRIVE_NONE); 
   mst_agent_0.set_agent_tag("Master VIP"); 
   mst_agent_0.set_verbosity(mst_agent_verbosity); 
   mst_agent_0.start_master(); 
   $timeformat (-12, 1, " ps", 1);
  end


    // 
    // Write Stream Modules Generated code begin     // 
  // Written by AXIMasterStreamTestbenchDriver.py masterStream DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.m00_axis
  reg [7:0]  masterStream_receivedDataCount;
  reg [31:0] masterStream_dataCaptured [0:7];
  reg masterStream_captureNextCycle;
  reg masterStream_tready;
  
  
  assign  DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.m00_axis_tready = masterStream_tready; 
  task masterStream_ReceiveReset();
  begin   
    masterStream_receivedDataCount = 0;
    masterStream_tready = 0; 
    masterStream_captureNextCycle = 0; 
  end
  endtask


  
  
  task masterStream_ReceiveDataFromMaster(); 
  begin   
    masterStream_ReceiveReset();
    while (masterStream_receivedDataCount < 8) begin
      @(posedge clock);
      masterStream_tready = 1;
       $display("Receiving data from master");
      if (masterStream_captureNextCycle) begin 
          masterStream_dataCaptured[masterStream_receivedDataCount] = DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.m00_axis_tdata;
          masterStream_receivedDataCount = masterStream_receivedDataCount + 1;
      end
      if ( DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.m00_axis_tvalid == 1) begin 
       $display("Capture Cycle!"); 
        masterStream_captureNextCycle = 1;
      end  else  begin 
       $display("Not a capture cycle!"); 
        masterStream_captureNextCycle = 0;
      end
    end
    masterStream_tready = 0;
       $display("Received Data Count = 8. Exiting!"); 
  end
  endtask
  // Written by AXIMasterStreamTestbenchDriver.py slaveStream DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis
  // Write data to a slave interface once ready is ready.
  reg [7:0] slaveStream_dataCount;
  reg slaveStream_tvalid;
  reg slaveStream_tlast;
  reg [31:0] slaveStream_tdata;
  reg  [3:0] slaveStream_tstrb;
  assign  DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis_tvalid   = slaveStream_tvalid;
  assign  DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis_tlast    = slaveStream_tlast;
  assign  DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis_tdata    = slaveStream_tdata;
  assign  DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis_tstrb    = slaveStream_tstrb;
  
  task slaveStream_ResetBFM();    begin
      slaveStream_dataCount = 0;
      slaveStream_tdata     = 0;
      slaveStream_tvalid    = 0;
      slaveStream_tlast     = 0;
      slaveStream_tstrb     = 0;
    end
  endtask

  task slaveStream_DriveDataToSlave;
    input reg[7:0] baseDataValue;
  begin
           $display("slaveStream_DriveDataToSlave Called"); 
    slaveStream_ResetBFM();    while (slaveStream_dataCount < 8) begin
      slaveStream_tvalid = 1;
      slaveStream_tdata = {8'(baseDataValue+slaveStream_dataCount),  
                           8'(baseDataValue+slaveStream_dataCount),  
                           8'(baseDataValue+slaveStream_dataCount),  
                           8'(baseDataValue+slaveStream_dataCount)}; 
      @(posedge clock);
      if ( DUT.`BD_INST_NAME.AXIMasterSlaveStreamIP_0.s00_axis_tready == 1) begin
           $display("slaveStream_DriveDataToSlave TREADY High-- pushing data");          slaveStream_dataCount = slaveStream_dataCount + 1;
         slaveStream_tstrb = 'hF;
         if (slaveStream_dataCount == 7) begin 
            slaveStream_tlast = 1;
             $display("slaveStream_DriveDataToSlave LAST signal set");
          end
          else
            slaveStream_tlast = 0;
        end
      end 
           $display("slaveStream DriveDataToSlave exiting"); 
      slaveStream_tvalid = 0;
   end 
   endtask 


  initial begin
    masterStream_ReceiveReset();
    slaveStream_ResetBFM();
  end


  // 
  // Write Stream Modules Generated code end
  // 




  initial begin
    reset <= 1'b0;
    #200ns;
    reset <= 1'b1;
    repeat (5) @(negedge clock); 
  end
  always #5 clock <= ~clock;
  initial begin

      #400;
      S_AXI_TEST ( );

      #1ns;
      $finish;
  end
  
  
task automatic S_AXI_TEST;  
begin   
#1; 
   $display("Sequential write transfers example similar to  AXI BFM WRITE_BURST method starts"); 
   mtestID = 0; 
   mtestADDR = 64'h00000000; 
   mtestBurstLength = 0; 
   mtestDataSize = xil_axi_size_t'(xil_clog2(32/8)); 
   mtestBurstType = XIL_AXI_BURST_TYPE_INCR;  
   mtestLOCK = XIL_AXI_ALOCK_NOLOCK;  
   mtestCacheType = 0;  
   mtestProtectionType = 0;  
   mtestRegion = 0; 
   mtestQOS = 0; 
   result_slave = 1; 

    #500; 
    // Toggle master to transmit. 

    mst_agent_0.AXI4LITE_WRITE_BURST('h4,mtestProtectionType,32'h0000FF00,mtestRresp);
    mst_agent_0.AXI4LITE_WRITE_BURST('h0,mtestProtectionType,32'd1,    mtestRresp);   
    // Receive the data from the master. 
    masterStream_ReceiveDataFromMaster();
   

    for (i = 0; i < 8; i++)
    begin
      COMPARE_DATA(32'h0000FF00+i,masterStream_dataCaptured[i]);   
    end
    $display("Receive Slave Burst data.");
    
     
    slaveStream_DriveDataToSlave(8'h00);

    $display("Verify we received slave stream data"); 
    for (i = 0; i < 8; i++)
    begin
      $display("Checking Stream receive Register ",i); 
      mst_agent_0.AXI4LITE_WRITE_BURST('h8,mtestProtectionType,i,mtestRresp);
      #10;
      mst_agent_0.AXI4LITE_READ_BURST('h0C,mtestProtectionType,mtestRDataL,mtestRresp);
      COMPARE_DATA((i<<24) + (i<<16) + (i<<8) + i,mtestRDataL);
    end

    mst_agent_0.AXI4LITE_WRITE_BURST('h0,mtestProtectionType,32'd2,    mtestRresp); 
    mst_agent_0.AXI4LITE_WRITE_BURST('h0,mtestProtectionType,32'd0,    mtestRresp); 
    // Now reinitialize Master. 
    mst_agent_0.AXI4LITE_WRITE_BURST('h4,mtestProtectionType,32'h0000CD00,mtestRresp);
    mst_agent_0.AXI4LITE_WRITE_BURST('h0,mtestProtectionType,32'd1,    mtestRresp);   
    // Receive the data from the master. 
    masterStream_ReceiveDataFromMaster();
   

    for (i = 0; i < 8; i++)
    begin
      COMPARE_DATA(32'h0000CD00+i,masterStream_dataCaptured[i]);   
    end
    
    
    $display("Receive Slave Burst data.");
    
    slaveStream_DriveDataToSlave(8'hA0);

    $display("Verify we received slave stream data"); 
    for (i = 0; i < 8; i++)
    begin
      $display("Checking Stream receive Register ",i); 
      mst_agent_0.AXI4LITE_WRITE_BURST('h8,mtestProtectionType,i,mtestRresp);
      #10;
      mst_agent_0.AXI4LITE_READ_BURST('h0C,mtestProtectionType,mtestRDataL,mtestRresp);
      COMPARE_DATA(32'hA0A0A0A0+(i<<24) + (i<<16) + (i<<8) + i,mtestRDataL);
    end    
    

   $finish();   
   
  
end
endtask  

endmodule
