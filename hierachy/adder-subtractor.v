module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cin;
    wire [15:0] w1, w2;
    wire [31:0] c;
assign c = {32{sub}} ^ b;
add16 c2 (.a(a[15:0]),.b(c[15:0]), .cin(sub), .sum(w1),.cout(cin));
add16 c3 ( .a(a[31:16]),.b(c[31:16]),.cin(cin), .sum(w2), .cout());
assign sum = {w2, w1};
endmodule
