`timescale 1ns / 1ps

module tb_filtro;
    // Sinais de controle e entrada
    logic clock_in;
    logic reset;
    logic enable;
    logic signed [27:0] signal_in;

    // Sinal de saída
    logic signed [27:0] signal_out;

    // Instancia o filtro lowp6
    lowp6 uut (
        .signal_in  (signal_in),
        .signal_out (signal_out),
        .clock_in   (clock_in),
        .reset      (reset),
        .enable     (enable)
    );

    // Memória para armazenar as linhas do TXT
    // Tamanho ajustado para 600000 para suportar arquivos grandes
    logic [27:0] memoria_entrada [0:599999];

    int arquivo_saida;
    int arquivo_tempo;
    int i;

    // Gera o Clock (período de 20ns -> 50MHz)
    always #10 clock_in = ~clock_in;

    initial begin
        // Inicializa as variáveis
        clock_in  = 1'b0;
        reset     = 1'b1;
        enable    = 1'b0;
        signal_in = '0;

        // Limpa a memoria_entrada para saber quando o arquivo txt acaba
        for (i = 0; i < 600000; i = i + 1) begin
            memoria_entrada[i] = 28'bx;
        end

        // 1. CARREGA O ARQUIVO TXT
        // Lê os dados do arquivo gerado e coloca na memória
        $readmemb("../entrada_audio.txt", memoria_entrada);

        // 2. CRIA OS ARQUIVOS DE SAÍDA
        arquivo_saida = $fopen("output.txt", "w");
        arquivo_tempo = $fopen("time.txt", "w");

        // Aguarda um tempo inicial e tira do reset
        #100;
        reset  = 1'b0;
        enable = 1'b1;

        // 3. INJETA OS DADOS: Um por ciclo de clock
        for (i = 0; i < 600000; i = i + 1) begin
            // Se acabar as amostras ou o dado for vazio (x), encerra a simulação
            if (memoria_entrada[i] === 28'bx) begin
                $display("Fim do arquivo alcancado na linha %0d!", i);
                break;  // SystemVerilog: usa 'break' ao invés de forçar o índice
            end else begin
                signal_in = memoria_entrada[i];

                // Espera a borda de subida do clock para o filtro processar a amostra
                @(posedge clock_in);

                // Grava M1 (entrada) e M2 (saída) no output.txt
                $fdisplay(arquivo_saida, "%d %d", signal_in, signal_out);

                // Grava o tempo simulado no time.txt
                $fdisplay(arquivo_tempo, "%0d", $time);
            end
        end

        // Finaliza e fecha os arquivos
        #10;
        $fclose(arquivo_saida);
        $fclose(arquivo_tempo);
        $display("Simulacao Concluida! Arquivos output.txt e time.txt gerados com sucesso.");
        $stop; // Pausa a simulação
    end
endmodule
