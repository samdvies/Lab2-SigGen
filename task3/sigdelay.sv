module sinegen #(
    parameter WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic                 wr,
    input logic                 rd,
    input logic [WIDTH-1:0]     offset,
    input logic [WIDTH-1:0]     mic_signal,
    output logic [WIDTH-1:0]    delayed_signal
);
    logic [WIDTH-1:0]       count;

counter myCounter(
    .clk (clk),
    .rst (rst),
    .en (en),
    .count (count)
);
ram myRam (
    .clk (clk),
    .dout (delayed_signal),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (count),
    .rd_addr (count+offset),
    .din (mic_signal)
);

endmodule
