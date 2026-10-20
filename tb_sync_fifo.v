`timescale 1ns/1ps
module tb_sync_fifo;
    reg clk = 0;
    reg rst = 1;
    reg wr_en = 0;
    reg rd_en = 0;
    reg [7:0] din = 0;
    wire [7:0] dout;
    wire full, empty;
    wire [4:0] count;

    sync_fifo #(.DATA_WIDTH(8), .DEPTH(16)) dut (
        .clk(clk), .rst(rst), .wr_en(wr_en), .rd_en(rd_en),
        .din(din), .dout(dout), .full(full), .empty(empty), .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        repeat (2) @(negedge clk);
        rst = 0;

        wr_en = 1; din = 8'h12; @(negedge clk);
        din = 8'h34; @(negedge clk);
        wr_en = 0;
        if (count !== 2) $fatal(1, "Expected count 2, got %0d", count);

        rd_en = 1; @(negedge clk);
        if (dout !== 8'h12) $fatal(1, "First read mismatch: %h", dout);
        @(negedge clk);
        if (dout !== 8'h34) $fatal(1, "Second read mismatch: %h", dout);
        rd_en = 0;
        if (!empty) $fatal(1, "FIFO should be empty");
        $display("PASS: synchronous FIFO basic test");
        $finish;
    end
endmodule
