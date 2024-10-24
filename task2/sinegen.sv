module sinegen #(
    parameter WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic [WIDTH-1:0]     incr,
    input logic [WIDTH-1:0]     step,
    output logic [WIDTH-1:0]    dout,
    output logic [WIDTH-1:0]    dout2

);
    logic [WIDTH-1:0]       count;

counter myCounter(
    .clk (clk),
    .incr (incr),
    .rst (rst),
    .en (en),
    .count (count)
);
rom myRom (
    .clk (clk),
    .addr (count),
    .step (step),
    .dout (dout),
    .dout2 (dout2)
);

endmodule
