transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/HexDriver.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/Synchronizers.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/Control.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/Reg_8.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/Adder_subtractor.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/Dreg.sv}
vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/lab5_toplevel.sv}

vlog -sv -work work +incdir+C:/ECE385_Project_Files/Lab5 {C:/ECE385_Project_Files/Lab5/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 6000 ns