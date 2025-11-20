`timescale 1ns / 1ps

module button_debounce(
    input wire clk,
    input wire rst_n,
    input wire btn_in,
    output wire btn_pulse
);

    reg btn_sync_0, btn_sync_1; 

    // Stage 1: Signal synchronization (correct as-is)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            btn_sync_0 <= 1'b0;
            btn_sync_1 <= 1'b0;
        end else begin
            btn_sync_0 <= btn_in;
            btn_sync_1 <= btn_sync_0;
        end
    end
    
    assign btn_pulse = ~btn_sync_0 & btn_sync_1;
endmodule
