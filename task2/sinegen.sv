module sinegen #(
    parameter WIDTH = 8
)(
    input logic                 clk,
    input logic                 rst,
    input logic                 en,
    input logic [WIDTH-1:0]     incr,
    output logic [WIDTH-1:0]    dout
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
    .dout (dout)
);

endmodule
