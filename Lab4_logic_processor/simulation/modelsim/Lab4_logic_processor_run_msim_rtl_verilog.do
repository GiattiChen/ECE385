transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Synchronizers.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Router.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Reg_4.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/HexDriver.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Control.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/compute.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Register_unit.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/Processor.sv}

vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab4_logic_processor {C:/ECE385_Project_Files/Lab4_logic_processor/testbench_8.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns