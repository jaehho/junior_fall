vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xpm
vlib questa_lib/msim/dist_mem_gen_v8_0_15
vlib questa_lib/msim/blk_mem_gen_v8_4_8
vlib questa_lib/msim/lib_bmg_v1_0_17
vlib questa_lib/msim/lib_cdc_v1_0_3
vlib questa_lib/msim/axi_traffic_gen_v3_0_18
vlib questa_lib/msim/xil_defaultlib

vmap xpm questa_lib/msim/xpm
vmap dist_mem_gen_v8_0_15 questa_lib/msim/dist_mem_gen_v8_0_15
vmap blk_mem_gen_v8_4_8 questa_lib/msim/blk_mem_gen_v8_4_8
vmap lib_bmg_v1_0_17 questa_lib/msim/lib_bmg_v1_0_17
vmap lib_cdc_v1_0_3 questa_lib/msim/lib_cdc_v1_0_3
vmap axi_traffic_gen_v3_0_18 questa_lib/msim/axi_traffic_gen_v3_0_18
vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv "+incdir+../../../ipstatic/hdl/src/verilog" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_15  -incr -mfcu  "+incdir+../../../ipstatic/hdl/src/verilog" \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work blk_mem_gen_v8_4_8  -incr -mfcu  "+incdir+../../../ipstatic/hdl/src/verilog" \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_17  -93  \
"../../../ipstatic/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_3  -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_traffic_gen_v3_0_18  -93  \
"../../../ipstatic/hdl/axi_traffic_gen_v3_0_rfs.vhd" \

vlog -work axi_traffic_gen_v3_0_18  -incr -mfcu  "+incdir+../../../ipstatic/hdl/src/verilog" \
"../../../ipstatic/hdl/axi_traffic_gen_v3_0_rfs.v" \

vlog -work xil_defaultlib  -incr -mfcu  "+incdir+../../../ipstatic/hdl/src/verilog" \
"../../../../axi_quad_spi_0_ex.gen/sources_1/ip/axi_traffic_gen_3/sim/axi_traffic_gen_3.v" \

vlog -work xil_defaultlib \
"glbl.v"
