# Caminho-de-dados-RISCV
    Para execução do caminho de dados abra o terminal da pasta projeto e digite:
        
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

        registradores.bin: contém os valores iniciais dos registradores indo de x0 a x31, eles estão
                           nomeados de reg0 a reg31.

        assim é possível inicar tanto a memória e os registradores com valores Predefinidos

     
        ALERTAS:
                1. Ao incluir na instrução imediato negativo ao imprimir o resultado final em decimal,
                pode acontecer do número estar muito grande, isso acontece pois está em complemento de 
                dois, ao verificar no GTKWave o registrador ou memória como signed decimal verá o 
                resultado correto.
                
                2. sempre deve se alterar no modulo lerinstrucao.v o tamanho do array instrucoes 
                para a quantidade de instruções que deseja executar - 1.
                Exemplo: addi x5, x5, 10
                         srl x8 , x8, x5
                         xor x6, x6, x6
                serão executadas 3 instruções mais a instrução 0 (usada para sinalizar onde acaba 
                as instruções) totalizando 4 instruções - 1, tamanho do array igual a 3. 
      
        Limitação: a memória so contém apenas 32 posições e acessos para endereços maiores que 32 
                    o valor não sera computado, pois contamos com apenas 32 posições de memória.
        
        Sobre:
        esse caminho de dados suportas as seguintes instruções:
            ADD, SUB, LW, SW, XOR, SLR, AND, OR, ADDI, BEQ, BNE

            somente as instruções BEQ, BNE e ADDI aceitam imediato negativo.

            também pode ser usado nosso montador assembly para converter assembly em binário,
            mas esse monstador não aceita rótulo  então nas função de branch forneça o imediato
            para onde o desvio será tomado, e também as instruções AND, OR, ADD.


        Execução das instruções:
        addi x2, x0, 7
        sw x2, 4(x0)
        lw x1, 4(x0)
        add x2, x1, x0
        add x1, x1, x2
        add x1, x1, x2
        sub x1, x1, x2
        sub x1, x1, x2
        beq x1, x2, SAIDA
        add x1, x1, x1
        sw x1, 0(x0)
        SAIDA:
        and x1, x1, x2
        or x1, x1, x0
        sw x1, 0(x0)

<div align="center">
<img src="https://github.com/ManuelFerreira90/Caminho-de-dados-RISCV/assets/105729881/26924012-48fb-4a5e-87e8-aa1026d597f9">
</div>
<div align="center">
<img src="https://github.com/ManuelFerreira90/Caminho-de-dados-RISCV/assets/105729881/378e54d6-5222-452c-9772-0631bc94c8c4">
</div>

    Implementação na FPGA:
        Na pasta FPGA_01 contém o projeto quartus para implementação do código verilog 
        em uma FPGA.
        
        visão geral do nosso projeto em uma FPGA.
<div align="center">
<img src="https://github.com/ManuelFerreira90/Caminho-de-dados-RISCV/assets/105729881/7197bb21-0cba-4c42-9cd5-4d507065d45f">
</div>

        Seta 1:
            está localizado dois display de sete segmentos que irá algum registrador 
            escolhido no código.

        Seta 2:
            está um display usado para sinalizar o final de todas as instruções, 
            0 para caminho de dados em execução, 1 para todas as instruções foram executadas.

        Seta 3:
            mostra os displays representando o program counter.

        O program counter e o registrador escolhido para mostrar nos displays são mostrados 
        corretamente valores de 0 a 255, em formato hexadecimal.

        Na linhas 116 do arquivo main.v poderá ser escolhido o registrador a 
        ser mostrado nos display.
        
<div align="center">
<img src="https://github.com/ManuelFerreira90/Caminho-de-dados-RISCV/assets/105729881/6d81da1d-cb8a-4fd4-a14c-bac299005909">
</div>
