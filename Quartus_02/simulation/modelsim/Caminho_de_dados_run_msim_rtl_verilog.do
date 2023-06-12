transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/decodificacao.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/sinaisdecontrole.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/somapc.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/main.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/lerinstrucao.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/memoria.v}
vlog -vlog01compat -work work +incdir+C:/Users/itall/OneDrive/Documentos/Meus\ Projetos/Caminho-de-dados-RISCV/Quartus_02 {C:/Users/itall/OneDrive/Documentos/Meus Projetos/Caminho-de-dados-RISCV/Quartus_02/registradores.v}

