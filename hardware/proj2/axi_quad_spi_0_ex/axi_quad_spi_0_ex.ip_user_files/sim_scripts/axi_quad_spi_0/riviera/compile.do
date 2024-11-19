transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/dist_mem_gen_v8_0_15
vlib riviera/lib_pkg_v1_0_4
vlib riviera/lib_cdc_v1_0_3
vlib riviera/lib_srl_fifo_v1_0_4
vlib riviera/fifo_generator_v13_2_10
vlib riviera/lib_fifo_v1_0_19
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/interrupt_control_v3_1_5
vlib riviera/axi_quad_spi_v3_2_31
vlib riviera/xil_defaultlib

vmap xpm riviera/xpm
vmap dist_mem_gen_v8_0_15 riviera/dist_mem_gen_v8_0_15
vmap lib_pkg_v1_0_4 riviera/lib_pkg_v1_0_4
vmap lib_cdc_v1_0_3 riviera/lib_cdc_v1_0_3
vmap lib_srl_fifo_v1_0_4 riviera/lib_srl_fifo_v1_0_4
vmap fifo_generator_v13_2_10 riviera/fifo_generator_v13_2_10
vmap lib_fifo_v1_0_19 riviera/lib_fifo_v1_0_19
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap interrupt_control_v3_1_5 riviera/interrupt_control_v3_1_5
vmap axi_quad_spi_v3_2_31 riviera/axi_quad_spi_v3_2_31
vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xpm  -incr -l xpm -l dist_mem_gen_v8_0_15 -l lib_pkg_v1_0_4 -l lib_cdc_v1_0_3 -l lib_srl_fifo_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_quad_spi_v3_2_31 -l xil_defaultlib \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Xilinx/Vivado/2024.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work dist_mem_gen_v8_0_15  -incr -v2k5 -l xpm -l dist_mem_gen_v8_0_15 -l lib_pkg_v1_0_4 -l lib_cdc_v1_0_3 -l lib_srl_fifo_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_quad_spi_v3_2_31 -l xil_defaultlib \
"../../../ipstatic/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_pkg_v1_0_4 -93  -incr \
"../../../ipstatic/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_3 -93  -incr \
"../../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_4 -93  -incr \
"../../../ipstatic/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -v2k5 -l xpm -l dist_mem_gen_v8_0_15 -l lib_pkg_v1_0_4 -l lib_cdc_v1_0_3 -l lib_srl_fifo_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_quad_spi_v3_2_31 -l xil_defaultlib \
"../../../ipstatic/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_10 -93  -incr \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_10  -incr -v2k5 -l xpm -l dist_mem_gen_v8_0_15 -l lib_pkg_v1_0_4 -l lib_cdc_v1_0_3 -l lib_srl_fifo_v1_0_4 -l fifo_generator_v13_2_10 -l lib_fifo_v1_0_19 -l axi_lite_ipif_v3_0_4 -l interrupt_control_v3_1_5 -l axi_quad_spi_v3_2_31 -l xil_defaultlib \
"../../../ipstatic/hdl/fifo_generator_v13_2_rfs.v" \

vcom -work lib_fifo_v1_0_19 -93  -incr \
"../../../ipstatic/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_lite_ipif_v3_0_4 -93  -incr \
"../../../ipstatic/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work interrupt_control_v3_1_5 -93  -incr \
"../../../ipstatic/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_31 -93  -incr \
"../../../ipstatic/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../../axi_quad_spi_0_ex.gen/sources_1/ip/axi_quad_spi_0/sim/axi_quad_spi_0.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

