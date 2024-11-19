transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib activehdl/xpm
vlib activehdl/dist_mem_gen_v8_0_15
vlib activehdl/blk_mem_gen_v8_4_8
vlib activehdl/lib_bmg_v1_0_17
vlib activehdl/lib_cdc_v1_0_3
vlib activehdl/axi_traffic_gen_v3_0_18
vlib activehdl/xil_defaultlib

vmap xpm activehdl/xpm
vmap dist_mem_gen_v8_0_15 activehdl/dist_mem_gen_v8_0_15
vmap blk_mem_gen_v8_4_8 activehdl/blk_mem_gen_v8_4_8
vmap lib_bmg_v1_0_17 activehdl/lib_bmg_v1_0_17
vmap lib_cdc_v1_0_3 activehdl/lib_cdc_v1_0_3
vmap axi_traffic_gen_v3_0_18 activehdl/axi_traffic_gen_v3_0_18
vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xpm  -sv2k12 "+incdir+../../../ipstatic/hdl/src/verilog" -l xpm -l dist_mem_gen_v8_0_15 -l blk_mem_gen_v8_4_8 -l lib_bmg_v1_0_17 -l lib_cdc_v1_0_3 -l axi_traffic_gen_v3_0_18 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_15  -v2k5 "+incdir+../../../ipstatic/hdl/src/verilog" -l xpm -l dist_mem_gen_v8_0_15 -l blk_mem_gen_v8_4_8 -l lib_bmg_v1_0_17 -l lib_cdc_v1_0_3 -l axi_traffic_gen_v3_0_18 -l xil_defaultlib \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vlog -work blk_mem_gen_v8_4_8  -v2k5 "+incdir+../../../ipstatic/hdl/src/verilog" -l xpm -l dist_mem_gen_v8_0_15 -l blk_mem_gen_v8_4_8 -l lib_bmg_v1_0_17 -l lib_cdc_v1_0_3 -l axi_traffic_gen_v3_0_18 -l xil_defaultlib \
"../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \

vcom -work lib_bmg_v1_0_17 -93  \
"../../../ipstatic/hdl/lib_bmg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_traffic_gen_v3_0_18 -93  \
"../../../ipstatic/hdl/axi_traffic_gen_v3_0_rfs.vhd" \

vlog -work axi_traffic_gen_v3_0_18  -v2k5 "+incdir+../../../ipstatic/hdl/src/verilog" -l xpm -l dist_mem_gen_v8_0_15 -l blk_mem_gen_v8_4_8 -l lib_bmg_v1_0_17 -l lib_cdc_v1_0_3 -l axi_traffic_gen_v3_0_18 -l xil_defaultlib \
"../../../ipstatic/hdl/axi_traffic_gen_v3_0_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../ipstatic/hdl/src/verilog" -l xpm -l dist_mem_gen_v8_0_15 -l blk_mem_gen_v8_4_8 -l lib_bmg_v1_0_17 -l lib_cdc_v1_0_3 -l axi_traffic_gen_v3_0_18 -l xil_defaultlib \
"../../../../axi_quad_spi_0_ex.gen/sources_1/ip/axi_traffic_gen_1/sim/axi_traffic_gen_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

