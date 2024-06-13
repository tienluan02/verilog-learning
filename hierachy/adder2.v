module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    wire [15:0] c,d;
    wire cout;

add16 c1 (.a(a[15:0]),.b(b[15:0]),.cin(1'b0),.sum(c),.cout(cout) );
add16 c2 (.a(a[31:16]),.b(b[31:16]),.cin(cout),.sum(d),.cout(cout) );
assign sum = {d,c};
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

    assign sum = a^b^cin;
    assign cout = (a&b) | (a^b)&cin;

endmodule
