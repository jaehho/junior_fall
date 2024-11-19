transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+axi_traffic_gen_1  -L xpm -L dist_mem_gen_v8_0_15 -L blk_mem_gen_v8_4_8 -L lib_bmg_v1_0_17 -L lib_cdc_v1_0_3 -L axi_traffic_gen_v3_0_18 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.axi_traffic_gen_1 xil_defaultlib.glbl

do {axi_traffic_gen_1.udo}

run 1000ns

endsim

quit -force
