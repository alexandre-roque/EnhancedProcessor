transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/processador.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/regn.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/upcount.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/dec3to8.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/ULA.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/MemRam.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/toplevel.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/regnIR.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/counterR7.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/regnW.v}
vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/TLB.v}

vlog -vlog01compat -work work +incdir+C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2 {C:/Users/alexa/Documents/Repositorios/LAOC-2/Praticas/Pratica2/simula.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneiv_hssi_ver -L cycloneiv_pcie_hip_ver -L cycloneiv_ver -L rtl_work -L work -voptargs="+acc"  simula

add wave *
view structure
view signals
run -all
