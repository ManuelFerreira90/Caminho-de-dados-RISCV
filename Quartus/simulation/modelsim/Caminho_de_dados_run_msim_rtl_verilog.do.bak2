transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/clock.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/decodificacao.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/sinaisdecontrole.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/somapc.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/main.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/lerinstrucao.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/memoria.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/registradores.v}

vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus/caminho_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  caminho_tb

add wave *
view structure
view signals
run -all
