// improve: don't have to wait for the carry chain to propagate through the entire adder

module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire sel;
    wire [15:0] w1, w2, w3, w4;
add16 c1 (.a(a[15:0]), .b(b[15:0]),.cin(1'b0), .sum(w1),.cout(sel) );
add16 c2 (.a(a[31:16]),.b(b[31:16]), .cin(1'b0), .sum(w2),.cout());
add16 c3 ( .a(a[31:16]),.b(b[31:16]),.cin(1'b1), .sum(w3), .cout());
mux2to1 c4 (.sel(sel), .a(w2), .b(w3), .y(w4));
assign sum = {w4, w1};
endmodule

module mux2to1 (
    input sel, 
    input [15:0] a, b,
    output [15:0] y
);
    assign y = sel ? b : a;
endmodule