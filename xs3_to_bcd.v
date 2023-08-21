module xs3_to_bcd (
    bcd, xs3
);

    input [3:0] xs3;
    output [3:0] bcd;
    wire w1, w2;

    not (bcd[0], xs3[0]);
    xor (bcd[1], xs3[0], xs3[1]);
    and (w1, xs3[0], xs3[1]);
    xnor (bcd[2], xs3[2], w1);
    or (w2, w1, xs3[2]);
    and (bcd[3], xs3[3], w2);

endmodule


module xs3_to_bcd_tb;
	reg [3:0] Excess3;
	wire [3:0] BCD;

	xs3_to_bcd e2b(.bcd(BCD), .xs3(Excess3));

	initial begin
        $dumpfile("xs3_to_bcd.vcd");
        $dumpvars(0, xs3_to_bcd_tb);
		// input 4'b0000 to 4'b0010 were ignore
		Excess3 = 4'b0011; #50;
		Excess3 = 4'b0100; #50;
		Excess3 = 4'b0101; #50;
		Excess3 = 4'b0110; #50;
		Excess3 = 4'b0111; #50;
		Excess3 = 4'b1000; #50;
		Excess3 = 4'b1001; #50;
		Excess3 = 4'b1010; #50;
		Excess3 = 4'b1011; #50;
		Excess3 = 4'b1100; #50;
		// input 4'b1101 to 4'b1111 were ignored
	end
endmodule