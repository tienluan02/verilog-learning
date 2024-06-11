module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] sum,
    output cout
);

assign {cout, sum} = a + b + cin;

endmodule