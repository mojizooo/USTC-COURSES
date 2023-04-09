onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L dist_mem_gen_v8_0_13 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.ins_a xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {ins_a.udo}

run -all

quit -force
