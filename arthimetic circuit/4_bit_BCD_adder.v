// You are provided with a BCD (binary-coded decimal) one-digit adder named bcd_fadd that adds two BCD digits and carry-in, and produces a sum and carry-out.

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );

    assign {cout, sum} = a + b + cin;
endmodule

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [3:0] c;

    bcd_fadd c1 (a[3:0], b[3:0], cin, c[0], sum[3:0]);
    bcd_fadd c2 (a[7:4], b[7:4], c[0], c[1], sum[7:4]);
    bcd_fadd c3 (a[11:8], b[11:8], c[1], c[2], sum[11:8]);
    bcd_fadd c4 (a[15:12], b[15:12], c[2], cout, sum[15:12]);

endmodule