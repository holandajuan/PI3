`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name:    lowp6
// Description:    Filtro FIR Passa-Baixa (Média Móvel) - SystemVerilog
//
// Implementa um filtro de média móvel de N pontos usando a técnica de
// integração/diferenciação: y[n] = y[n-1] + x[n] - x[n-N]
// Isso evita a necessidade de N multiplicadores, usando apenas soma e subtração.
//////////////////////////////////////////////////////////////////////////////////

module lowp6 (
    input  logic               clk,
    input  logic               rst,
    input  logic               enable,
    input  logic signed [27:0] signal_in,
    output logic signed [27:0] signal_out
);

    // Função para calcular log2 (usado para dimensionar o acumulador)
    function automatic int log2(input int v);
        log2 = 0;
        while (v >> log2)
            log2 = log2 + 1;
    endfunction

    // Parâmetros do filtro
    parameter int N  = 1024;
    localparam int N2 = log2(N) - 1;

    // Acumulador interno
    logic signed [27+N2:0] signal_out_tmp_3;

    // Shift Register: armazena as últimas N amostras
    logic signed [27:0] data [0:N-1];

    // ---------------------------------------------------------------
    // Sample Shift Register: propaga as amostras a cada ciclo de clock
    // ---------------------------------------------------------------
    genvar i;
    generate
        for (i = 0; i < N-1; i = i + 1) begin : gd
            always_ff @(posedge clk) begin
                if (rst)
                    data[i+1] <= '0;
                else
                    data[i+1] <= data[i];
            end
        end
    endgenerate

    // Entrada do Shift Register: carrega a nova amostra na posição 0
    always_ff @(posedge clk) begin
        if (rst)
            data[0] <= '0;
        else
            data[0] <= signal_in;
    end

    // ---------------------------------------------------------------
    // FIR Core (Média Móvel): y[n] = y[n-1] + x[n] - x[n-N]
    // ---------------------------------------------------------------
    logic signed [27+N2:0] signal_out_tmp_2;
    assign signal_out_tmp_2 = signal_out_tmp_3 + signal_in - data[N-1];

    // ---------------------------------------------------------------
    // Output Register: registra a saída filtrada
    // ---------------------------------------------------------------
    always_ff @(posedge clk) begin
        if (rst) begin
            signal_out     <= '0;
            signal_out_tmp_3 <= '0;
        end else begin
            signal_out     <= signal_out_tmp_2[27+N2 : N2];
            signal_out_tmp_3 <= signal_out_tmp_2;
        end
    end

endmodule
