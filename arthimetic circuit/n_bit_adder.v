module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    wire [99:0] c;

    assign {cout,sum} = a + b + cin; // automatically generate the cout at the n+1 bit, only need to include it at the beginning of the output
endmodule
