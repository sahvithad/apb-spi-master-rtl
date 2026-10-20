`timescale 1ns/1ps
module comparator_2bit (
    input  wire [1:0] a,
    input  wire [1:0] b,
    output wire       gt,
    output wire       eq,
    output wire       lt
);
    assign gt = (a > b);
    assign eq = (a == b);
    assign lt = (a < b);
endmodule
