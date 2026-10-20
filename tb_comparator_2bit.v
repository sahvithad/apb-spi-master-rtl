`timescale 1ns/1ps
module tb_comparator_2bit;
    reg  [1:0] a, b;
    wire gt, eq, lt;
    integer i, j;

    comparator_2bit dut (.a(a), .b(b), .gt(gt), .eq(eq), .lt(lt));

    initial begin
        $display(" a  b | gt eq lt");
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                a = i; b = j; #10;
                $display("%d  %d |  %b  %b  %b", a, b, gt, eq, lt);
                if ((gt !== (a > b)) ||
                    (eq !== (a == b)) ||
                    (lt !== (a < b))) begin
                    $error("Mismatch for a=%0d b=%0d", a, b);
                    $finish;
                end
            end
        end
        $display("PASS: all 16 input combinations checked.");
        $finish;
    end
endmodule
