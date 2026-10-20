module spi_master #(
    parameter integer CLK_DIV = 2
) (
    input wire clk,
    input wire rst,
    input wire start,
    input wire [7:0] tx_data,
    output reg [7:0] rx_data,
    output reg busy,
    output reg done,
    output reg sclk,
    output reg cs_n,
    output reg mosi,
    input wire miso
);
    localparam IDLE = 1'b0;
    localparam TRANSFER = 1'b1;

    reg state;
    reg [7:0] tx_shift;
    reg [7:0] rx_shift;
    reg [3:0] bit_count;
    integer div_count;

    always @(posedge clk) begin
        if (rst) begin
            state <= IDLE;
            tx_shift <= 0;
            rx_shift <= 0;
            rx_data <= 0;
            bit_count <= 0;
            div_count <= 0;
            busy <= 0;
            done <= 0;
            sclk <= 0;
            cs_n <= 1;
            mosi <= 0;
        end else begin
            done <= 0;

            case (state)
                IDLE: begin
                    busy <= 0;
                    sclk <= 0;
                    cs_n <= 1;
                    div_count <= 0;
                    if (start) begin
                        state <= TRANSFER;
                        busy <= 1;
                        cs_n <= 0;
                        tx_shift <= tx_data;
                        rx_shift <= 0;
                        bit_count <= 0;
                        mosi <= tx_data[7];
                        div_count <= 0;
                    end
                end

                TRANSFER: begin
                    busy <= 1;
                    if (div_count == CLK_DIV-1) begin
                        div_count <= 0;
                        sclk <= ~sclk;

                        if (!sclk) begin
                            rx_shift <= {rx_shift[6:0], miso};
                            if (bit_count == 7) begin
                                rx_data <= {rx_shift[6:0], miso};
                                state <= IDLE;
                                busy <= 0;
                                done <= 1;
                                cs_n <= 1;
                                sclk <= 0;
                            end else begin
                                bit_count <= bit_count + 1'b1;
                                tx_shift <= {tx_shift[6:0], 1'b0};
                                mosi <= tx_shift[6];
                            end
                        end
                    end else begin
                        div_count <= div_count + 1;
                    end
                end
                default: state <= IDLE;
            endcase
        end
    end

    initial begin
        if (CLK_DIV < 1)
            $error("CLK_DIV must be at least 1");
    end
endmodule
