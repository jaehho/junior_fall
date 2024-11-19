vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/dist_mem_gen_v8_0_15
vlib modelsim_lib/msim/lib_pkg_v1_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_3
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_4
vlib modelsim_lib/msim/fifo_generator_v13_2_10
vlib modelsim_lib/msim/lib_fifo_v1_0_19
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/interrupt_control_v3_1_5
vlib modelsim_lib/msim/axi_quad_spi_v3_2_31
vlib modelsim_lib/msim/xil_defaultlib

vmap xpm modelsim_lib/msim/xpm
vmap dist_mem_gen_v8_0_15 modelsim_lib/msim/dist_mem_gen_v8_0_15
vmap lib_pkg_v1_0_4 modelsim_lib/msim/lib_pkg_v1_0_4
vmap lib_cdc_v1_0_3 modelsim_lib/msim/lib_cdc_v1_0_3
vmap lib_srl_fifo_v1_0_4 modelsim_lib/msim/lib_srl_fifo_v1_0_4
vmap fifo_generator_v13_2_10 modelsim_lib/msim/fifo_generator_v13_2_10
vmap lib_fifo_v1_0_19 modelsim_lib/msim/lib_fifo_v1_0_19
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 modelsim_lib/msim/interrupt_control_v3_1_5
vmap axi_quad_spi_v3_2_31 modelsim_lib/msim/axi_quad_spi_v3_2_31
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xpm  -incr -mfcu  -sv \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93  \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_15  -incr -mfcu  \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_pkg_v1_0_4  -93  \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_3  -93  \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_4  -93  \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10  -93  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -mfcu  \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_19  -93  \
"../../../ipstatic/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4  -93  \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5  -93  \
"../../../ipstatic/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_31  -93  \
"../../../ipstatic/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93  \
"../../../../axi_quad_spi_0_ex.gen/sources_1/ip/axi_quad_spi_0/sim/axi_quad_spi_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

