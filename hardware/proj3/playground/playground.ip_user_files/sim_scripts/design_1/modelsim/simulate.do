onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xilinx_vip -L xpm -L axi_lite_ipif_v3_0_4 -L v_tc_v6_1_14 -L v_vid_in_axi4s_v4_0_11 -L v_axi4s_vid_out_v4_0_18 -L xil_defaultlib -L v_tc_v6_2_8 -L axi_infrastructure_v1_1_0 -L axi_vip_v1_1_18 -L processing_system7_vip_v1_0_20 -L lib_cdc_v1_0_3 -L proc_sys_reset_v5_0_15 -L xlconstant_v1_1_9 -L xlslice_v1_0_4 -L lib_pkg_v1_0_4 -L fifo_generator_v13_2_10 -L lib_fifo_v1_0_19 -L blk_mem_gen_v8_4_8 -L lib_bmg_v1_0_17 -L lib_srl_fifo_v1_0_4 -L axi_datamover_v5_1_34 -L axi_vdma_v6_3_20 -L smartconnect_v1_0 -L axi_register_slice_v2_1_32 -L generic_baseblocks_v2_1_2 -L axi_data_fifo_v2_1_31 -L axi_protocol_converter_v2_1_32 -L xilinx_vip -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run 1000ns

quit -force
