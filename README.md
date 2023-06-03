# Caminho-de-dados-RISCV

    Para execução do caminho de dados abra o terminal da pasta projeto e digite 
        
                            "./compilar.sh"
    
    Instruções de uso:
        na pasta entrada contém o assembler.bin, memoria.bin e registradores.bin

        assembler.bin: arquivo com as instruções a serem executadas no formato binário,
            a última instrução sempre dever ser 32 bits 0 para indicar a máquina de estados
            que chegou no fim da execução.
        
        memoria.bin: arquivo para inicializar a memória com valores Predefinidos, certifique-se 
            de que o immediate usado na instrução é mutíplo de 4 bits. Exemplo: lw x1, 4(x0)
            o 4 indica a primeira posição do endereço guardado por x0 caso x0 seja igual a 0
            então essa função carregara para x1 o valor contido na posição 1 da memória, se fosse 8 
            a posição 2, assim por diante.

        registradores.bin: contém os valores iniciais dos registradores indo de x0 a x31

        assim é possível inicar tanto a memória e os registradores com valores Predefinidos

        ALERTA: sempre deve se alterar no modulo lerinstrucao.v o tamanho do array instrucoes 
                para a quantidade de instruções que deseja executar - 1
                Exemplo: addi x5, x5, 10
                         srl x8 , x8, x5
                         xor x6, x6, x6
                serão executadas 3 instruções mais a instrução 0 (usada para sinalizar onde acaba 
                as instruções) totalizando 4 instruções - 1, tamanho do array igual a 3 
                (imagem1)

        esse caminho de dados suportas as seguintes instruções:
            ADD, SUB, LW, SW, XOR, SLR, AND, OR, ADDI, BEQ, BNE

            somente as instruções BEQ, BNE e ADDI aceitam imediato negativo

            também pode ser usado nosso montador assembly para converter assembly em binário,
            mas esse monstador não aceita rótulo, então nas função de branch forneça o
            imediato para onde o desvio será tomado


        Execução das instruções:
        addi x7, x7, 5
        loop:
        addi x7, x7, -1
        bne x7, x0, loop 


