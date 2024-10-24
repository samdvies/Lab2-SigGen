module counter #(
    parameter WIDTH = 9

)(
    // interface signals
    input logic clk,
    input logic rst,
    input logic en,
    output logic [WIDTH-1:0] count
);

always_ff @ (posedge clk)
    if (rst) count <= '0;
    else    count<= count + en;
endmodule
