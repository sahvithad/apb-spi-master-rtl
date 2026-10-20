`timescale 1ns/1ps
module tb_spi_master;
    reg clk = 0;
    reg rst = 1;
    reg start = 0;
    reg [7:0] tx_data = 8'hA6;
    wire [7:0] rx_data;
    wire busy, done, sclk, cs_n, mosi;
    reg miso = 0;
    reg [7:0] response = 8'h3C;
    integer sample_index = 0;
    integer timeout_count = 0;

    spi_master #(.CLK_DIV(2)) dut (
        .clk(clk), .rst(rst), .start(start), .tx_data(tx_data),
        .rx_data(rx_data), .busy(busy), .done(done),
        .sclk(sclk), .cs_n(cs_n), .mosi(mosi), .miso(miso)
    );

    always #5 clk = ~clk;

    always @(negedge sclk) begin
        if (!cs_n && !rst) begin
            if (sample_index < 8)
                miso = response[7-sample_index];
            sample_index = sample_index + 1;
        end
    end

    initial begin
        repeat (3) @(negedge clk);
        rst = 0;
        @(negedge clk);
        start = 1;
        @(negedge clk);
        start = 0;

        while (!done && timeout_count < 300) begin
            @(negedge clk);
            timeout_count = timeout_count + 1;
        end

        if (!done) $fatal(1, "Timeout waiting for done");
        if (rx_data !== response)
            $fatal(1, "RX mismatch: expected %h, got %h", response, rx_data);
        if (cs_n !== 1'b1)
            $fatal(1, "Chip select should be inactive after transfer");

        $display("PASS: SPI master transfer completed");
        $display("TX byte requested: %h", tx_data);
        $display("RX byte captured: %h", rx_data);
        $finish;
    end
endmodule
