module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    wire [2:0] c;

full_adder FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
full_adder FA1 (.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
full_adder FA2 (.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));

assign cout = c;

endmodule

module full_adder( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a^b^cin;
    assign cout = (a&b) | (a^b)&cin;
endmodule
