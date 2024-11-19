onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc"  -L xpm -L dist_mem_gen_v8_0_15 -L blk_mem_gen_v8_4_8 -L lib_bmg_v1_0_17 -L lib_cdc_v1_0_3 -L axi_traffic_gen_v3_0_18 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.axi_traffic_gen_2 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {axi_traffic_gen_2.udo}

run 1000ns

quit -force
