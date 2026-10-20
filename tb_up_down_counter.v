`timescale 1ns/1ps
module tb_up_down_counter;
    reg clk = 0, rst = 1, en = 0, up = 1;
    wire [3:0] count;

    up_down_counter #(.WIDTH(4)) dut (
        .clk(clk), .rst(rst), .en(en), .up(up), .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("up_down_counter.vcd");
        $dumpvars(0, tb_up_down_counter);

        repeat (2) @(negedge clk);
        rst = 0; en = 1; up = 1;
        repeat (5) @(negedge clk);
        up = 0;
        repeat (3) @(negedge clk);
        en = 0;
        repeat (2) @(negedge clk);
        $display("Counter test finished. Inspect count and VCD waveform.");
        $finish;
    end
endmodule
