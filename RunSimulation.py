#!/usr/bin/env python3 

#
# NOTE: This script is my own, but most of the verilog code is from auto-generated from an AXI Peripheral TB which I adapted to my needs. 
# NOTE: Normally I'd do this with a makefile but this is more for notes/education purposes so drawing out the steps makes more sense. 
#
# Quick script to capture how to compile verilog for simulation on the command line with Vivado. 
# In a "Real" simulation environment I would make this into an object and allow for multiple configurations, snapshots, do directory searches
#  for testcases, run jobs in parallel on servers, etc.. 
#
#


import os 
import subprocess
import json

simexists = os.path.isdir("simulation") 
if not simexists:
  os.mkdir("simulation") 

os.environ["LD_LIBRARY_PATH"]= "/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o:/tools/Xilinx/Vivado/2020.2/lib/lnx64.o:/tools/Xilinx/.xinstall/Vivado_2020.2/lib/lnx64.o/SuSE/"

VIVADO_BIN = "/tools/Xilinx/Vivado/2020.2/bin/"


rootDirectory=os.getcwd()+"/" 
runDirectory =os.getcwd()+"/simulation" 
os.system("rm -rf "+runDirectory+"/xsim.dir") 

snapshot="default"

#
# Make sure to use 
#    "-L uva -L axi_vip_v1_1_8 -L xilinx_vip" for all the axi libraries and 
#    --sv for systemverilog
#





def Run(commandString):
  os.chdir(runDirectory)
  print("Running: "," ".join(commandString))
  result = subprocess.Popen(commandString)
  text = result.communicate()[0]
  return_code = result.returncode  
  print("Returning ",return_code)
  if (return_code != 0):
    exit(1)
   


command = [VIVADO_BIN + "xvlog", "-work","xil_defaultlib", 
       "--include",rootDirectory+"/Verilog/include","--include","/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include",
       rootDirectory+"Verilog/module/AXIMasterSlaveStreamIP_v1_0_M00_AXIS.v",
       rootDirectory+"Verilog/module/AXIMasterSlaveStreamIP_v1_0_S00_AXIS.v",
       rootDirectory+"Verilog/module/AXIMasterSlaveStreamIP_v1_0_S00_AXI.v",
       rootDirectory+"Verilog/module/AXIMasterSlaveStreamIP_v1_0.v",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_bfm_1_wrapper.v",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_bfm_1_AXIMasterSlaveStreamIP_0_0.v",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_bfm_1.v",
       rootDirectory+"Verilog/tb/glbl.v"]

Run(command) 



command = [VIVADO_BIN + "xvlog","--sv","-work","xil_defaultlib","-L","uva","-L","axi_vip_v1_1_8","-L","xilinx_vip",
      "--include", rootDirectory+"/Verilog/include", "--include", "/tools/Xilinx/Vivado/2020.2/data/xilinx_vip/include",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_bfm_1_master_0_0_pkg.sv",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_tb.sv",
       rootDirectory+"Verilog/tb/AXIMasterSlaveStreamIP_v1_0_bfm_1_master_0_0.sv"]
Run(command) 

command = [VIVADO_BIN + "xelab", "-wto","fa0545d4865e4787811138bb88188e54","--incr","--debug","typical","--relax",
           "--mt","8",
           "-L","xil_defaultlib","-L","axi_infrastructure_v1_1_0","-L","axi_vip_v1_1_8","-L","uvm","-L","xilinx_vip","-L","unisims_ver",
           "-L","unimacro_ver","-L","secureip","-L","xpm",
           "--snapshot",snapshot,"xil_defaultlib.AXIMasterSlaveStreamIP_v1_0_tb","xil_defaultlib.glbl",
           "-log","elaborate.log" ]

Run(command) 


os.chdir(rootDirectory+"simulation/") 
command = [VIVADO_BIN + "xsim", snapshot,"--tclbatch",rootDirectory+"/scripts/simulation."+snapshot+".tcl"] 
Run(command) 
os.chdir(rootDirectory) 

