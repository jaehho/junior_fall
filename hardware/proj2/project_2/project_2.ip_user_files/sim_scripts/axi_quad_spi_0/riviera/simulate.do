transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+axi_quad_spi_0  -L xpm -L dist_mem_gen_v8_0_15 -L lib_pkg_v1_0_4 -L lib_cdc_v1_0_3 -L lib_srl_fifo_v1_0_4 -L fifo_generator_v13_2_10 -L lib_fifo_v1_0_19 -L axi_lite_ipif_v3_0_4 -L interrupt_control_v3_1_5 -L axi_quad_spi_v3_2_31 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_quad_spi_0 xil_defaultlib.glbl

do {axi_quad_spi_0.udo}

run 1000ns

endsim

quit -force
