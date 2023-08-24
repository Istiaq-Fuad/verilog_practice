`include "four_bit_full_adder.v" // no need to include in modelsim

module bcd_adder (s, cout, a, b, cin);

    input [3:0] a, b;
    input cin;
    output [3:0] s;
    output cout;
    reg cin2 = 0;
    wire [3:0] s0, b0;
    wire w1, w2, w3, w4, w5;

    four_bit_full_adder fbfa0 (a, b, cin, s0, w1);
    and (w2, s0[3], s0[2]);
    and (w3, s0[3], s0[1]);
    or (w4, w1, w2, w3);

    buf (b0[3], 1'b0);
    buf (b0[2], w4);
    buf (b0[1], w4);
    buf (b0[0], 1'b0);
    four_bit_full_adder fbfa1 (b0, s0, cin2, s, cout);

endmodule


module bcd_adder_tb ();
	reg [3:0] a, b;
	reg cin;
	wire cout;
	wire [3:0] s;

	bcd_adder BA(s, cout, a, b, cin);

	initial begin
        $dumpfile("bcd_adder.vcd");
        $dumpvars(0, bcd_adder_tb);
		a = 4'b1001; b = 4'b0100; cin = 1'b0; #50;
		a = 4'b0000; b = 4'b0001; cin = 1'b0; #50;
		a = 4'b0001; b = 4'b0001; cin = 1'b0; #50;
		a = 4'b0010; b = 4'b0001; cin = 1'b0; #50;
		a = 4'b0010; b = 4'b0010; cin = 1'b0; #50;
		a = 4'b0010; b = 4'b0011; cin = 1'b0; #50;
		a = 4'b0101; b = 4'b0001; cin = 1'b0; #50;
		a = 4'b0101; b = 4'b0010; cin = 1'b0; #50;
		a = 4'b1000; b = 4'b0000; cin = 1'b0; #50;
		a = 4'b0110; b = 4'b0011; cin = 1'b0; #50;
		a = 4'b1000; b = 4'b0001; cin = 1'b1; #50;
		a = 4'b1000; b = 4'b0010; cin = 1'b1; #50;
		a = 4'b1000; b = 4'b0011; cin = 1'b1; #50;
		a = 4'b1011; b = 4'b0001; cin = 1'b1; #50;
		a = 4'b0100; b = 4'b1001; cin = 1'b1; #50;
		a = 4'b0110; b = 4'b1000; cin = 1'b1; #50;
		a = 4'b1001; b = 4'b0110; cin = 1'b1; #50;
		a = 4'b1010; b = 4'b0110; cin = 1'b1; #50;
		a = 4'b1101; b = 4'b0100; cin = 1'b1; #50;
		a = 4'b1110; b = 4'b0100; cin = 1'b1; #50;
	end
endmodule
