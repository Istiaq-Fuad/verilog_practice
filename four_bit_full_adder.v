`include "full_adder_scratch.v" // no need to include in modelsim

module four_bit_full_adder(
    a, b, cin, sum, cout
);

    input [3:0] a, b;
    input cin;
    output cout;
    output [3:0] sum;
    wire c0, c1, c2;

    // full_adder fa0 (a[0], b[0], cin, sum[0], c0);
    // full_adder fa1 (a[1], b[1], c0, sum[1], c1);
    // full_adder fa2 (a[2], b[2], c1, sum[2], c2);
    // full_adder fa3 (a[3], b[3], c2, sum[3], cout);

    full_adder_scratch fa0 ( sum[0], c0, a[0], b[0], cin);
    full_adder_scratch fa1 (sum[1], c1, a[1], b[1], c0);
    full_adder_scratch fa2 (sum[2], c2, a[2], b[2], c1);
    full_adder_scratch fa3 (sum[3], cout, a[3], b[3], c2);

endmodule

module four_bit_full_adder_tb();

    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;

    four_bit_full_adder fa(a, b, cin, sum, cout);

    initial begin
        $dumpfile("four_bit_full_adder.vcd");
        $dumpvars(0, four_bit_full_adder_tb);

        cin = 0; a = 4'b1000; b = 4'b0010; #3;
		cin = 0; a = 4'b1000; b = 4'b1000; #3;
		cin = 0; a = 4'b0010; b = 4'b1000; #3;
		cin = 0; a = 4'b0001; b = 4'b0111; #3;
		cin = 0; a = 4'b1010; b = 4'b1011; #3;
		cin = 0; a = 4'b1110; b = 4'b1111; #3;
		cin = 0; a = 4'b1010; b = 4'b1101; #3;
		cin = 1; a = 4'b1000; b = 4'b0010; #3;
		cin = 1; a = 4'b1000; b = 4'b1000; #3;
		cin = 1; a = 4'b0010; b = 4'b1000; #3;
		cin = 1; a = 4'b0001; b = 4'b0111; #3;
		cin = 1; a = 4'b1010; b = 4'b1011; #3;
		cin = 1; a = 4'b1110; b = 4'b1111; #3;
		cin = 1; a = 4'b1010; b = 4'b1101; #3;
    end

endmodule