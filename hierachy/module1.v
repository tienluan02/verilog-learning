module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [23:0] add;
    my_dff8 c1 (.clk(clk),.d(d),.q(add[7:0]));
    my_dff8 c2 (.clk(clk),.d(add[7:0]),.q(add[15:8]));
    my_dff8 c3 (.clk(clk),.d(add[15:8]),.q(add[23:16]));
    mux4to1 c4 (.a(d), .b(add[7:0]), .c(add[15:8]), .d(add[23:16]), .sel(sel), .y(q));
   

endmodule

module mux4to1 (
    input [7:0] a, b, c, d,
    input [1:0] sel,
    output [7:0] y
);

always @(sel) begin
    case(sel)
        2'b00: y = a;
        2'b01: y = b;
        2'b10: y = c;
        2'b11: y = d;
    endcase
end
endmodule