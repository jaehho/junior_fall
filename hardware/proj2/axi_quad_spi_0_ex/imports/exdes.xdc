# file: axi_emc_exdes.xdc
# 
# (c) Copyright 2008 - 2023 Advanced Micro Devices, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of Advanced Micro Devices, Inc. and is protected under U.S. and
# international copyright and other intellectual property
# laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
# 
#----------------------------------------------------------------
#create_clock -name clk_p -period 5.0 [get_ports clk_p]

# Following are the IO pins for KC705 board

#set_property LOC AD11 [ get_ports clk_n]
#set_property IOSTANDARD DIFF_SSTL15 [ get_ports clk_n]
#set_property LOC AD12 [ get_ports clk_p]
#set_property IOSTANDARD DIFF_SSTL15 [ get_ports clk_p]
#
#set_property LOC AB7 [ get_ports reset]
#set_property IOSTANDARD LVCMOS15 [ get_ports reset]
#
#
#set_property LOC F16 [ get_ports atg_done]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_done]
#
#set_property LOC E18 [ get_ports atg_status[0]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[0]]
#set_property LOC G19 [ get_ports atg_status[1]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[1]]
#set_property LOC E19 [ get_ports atg_status[2]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[2]]
#set_property LOC E20 [ get_ports atg_status[3]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[3]]
#set_property LOC E21 [ get_ports atg_status[4]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[4]]
#set_property LOC E23 [ get_ports atg_status[5]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[5]]
#set_property LOC E24 [ get_ports atg_status[6]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[6]]
#set_property LOC E25 [ get_ports atg_status[7]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[7]]
#set_property LOC E26 [ get_ports atg_status[8]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[8]]
#set_property LOC E28 [ get_ports atg_status[9]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[9]]
#set_property LOC E29 [ get_ports atg_status[10]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[10]]
#set_property LOC E30 [ get_ports atg_status[11]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[11]]
#set_property LOC F11 [ get_ports atg_status[12]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[12]]
#set_property LOC F12 [ get_ports atg_status[13]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[13]]
#set_property LOC F13 [ get_ports atg_status[14]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[14]]
#set_property LOC F15 [ get_ports atg_status[15]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[15]]
#set_property LOC F17 [ get_ports atg_status[16]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[16]]
#set_property LOC F18 [ get_ports atg_status[17]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[17]]
#set_property LOC F20 [ get_ports atg_status[18]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[18]]
#set_property LOC F21 [ get_ports atg_status[19]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[19]]
#set_property LOC F22 [ get_ports atg_status[20]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[20]]
#set_property LOC F23 [ get_ports atg_status[21]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[21]]
#set_property LOC F25 [ get_ports atg_status[22]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[22]]
#set_property LOC F26 [ get_ports atg_status[23]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[23]]
#set_property LOC F27 [ get_ports atg_status[24]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[24]]
#set_property LOC F28 [ get_ports atg_status[25]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[25]]
#set_property LOC F30 [ get_ports atg_status[26]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[26]]
#set_property LOC G13 [ get_ports atg_status[27]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[27]]
#set_property LOC G12 [ get_ports atg_status[28]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[28]]
#set_property LOC G14 [ get_ports atg_status[29]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[29]]
#set_property LOC G15 [ get_ports atg_status[30]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[30]]
#set_property LOC G17 [ get_ports atg_status[31]]
#set_property IOSTANDARD LVCMOS25 [ get_ports atg_status[31]]
