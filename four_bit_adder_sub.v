`include "full_adder.v"
`include "four_bit_full_adder.v"

module four_bit_adder_sub(
    a, b, ctrl, sout, cout
);

    input [3:0] a, b;
    input ctrl;
    output [3:0] sout;
    output cout;
    // wire b0, b1, b2, b3, c0, c1, c2;
	wire [3:0] w;

	// implementation using full adder
    // xor (b0, b[0], ctrl);
    // full_adder fa0 (a[0], b0, ctrl, sout[0], c0);
    // xor (b1, b[1], ctrl);
    // full_adder fa1 (a[1], b1, c0, sout[1], c1);
    // xor (b2, b[2], ctrl);
    // full_adder fa2 (a[2], b2, c1, sout[2], c2);
    // xor (b3, b[3], ctrl);
    // full_adder fa3 (a[3], b3, c2, sout[3], cout);

	// implementation using four bit full adder
    xor (w[0], b[0], ctrl);
    xor (w[1], b[1], ctrl);
    xor (w[2], b[2], ctrl);
    xor (w[3], b[3], ctrl);
	four_bit_full_adder fa (a, w, ctrl, sout, cout);

endmodule


module four_bit_adder_sub_tb ();

    reg [3:0] a, b;
	reg cin;	
	wire cout;
	wire [3:0] s;

    four_bit_adder_sub AddSub (a, b, cin, s, cout);

	initial begin
        $dumpfile("four_bit_adder_sub.vcd");
        $dumpvars(0, four_bit_adder_sub_tb);
		cin = 0; a = 4'b1000; b = 4'b0010; #50;
		cin = 0; a = 4'b1000; b = 4'b1000; #50;
		cin = 0; a = 4'b0010; b = 4'b1000; #50;
		cin = 0; a = 4'b0001; b = 4'b0111; #50;
		cin = 0; a = 4'b1010; b = 4'b1011; #50;
		cin = 0; a = 4'b1110; b = 4'b1111; #50;
		cin = 0; a = 4'b1010; b = 4'b1101; #50;
		cin = 1; a = 4'b1000; b = 4'b0010; #50;
		cin = 1; a = 4'b1000; b = 4'b1000; #50;
		cin = 1; a = 4'b0010; b = 4'b1000; #50;
		cin = 1; a = 4'b0001; b = 4'b0111; #50;
		cin = 1; a = 4'b1010; b = 4'b1011; #50;
		cin = 1; a = 4'b1110; b = 4'b1111; #50;
		cin = 1; a = 4'b1010; b = 4'b1101; #50;
	end

endmodule