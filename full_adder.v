// full adder implementation using half adder
`include "half_adder.v"

module full_adder(
    a, b, cin, sum, cout
);

    input a, b, cin;
    output sum, cout;
    wire ha1sum, ha1carry, ha2carry;

    half_adder ha1 (a, b, ha1sum, ha1carry);
    half_adder ha2 (cin, ha1sum, sum, ha2carry);
    or (cout, ha1carry, ha2carry);

endmodule

module full_adder_tb ();

    reg a, b, cin;
    wire sum, cout;

    full_adder fa (a, b, cin, sum, cout);

    initial begin
        $dumpfile("full_adder.vcd");
        $dumpvars(0, full_adder_tb);
        a = 0; b = 0; cin = 0; #5;
        a = 0; b = 0; cin = 1; #5;
        a = 0; b = 1; cin = 0; #5;
        a = 0; b = 1; cin = 1; #5;
        a = 1; b = 0; cin = 0; #5;
        a = 1; b = 0; cin = 1; #5;
        a = 1; b = 1; cin = 0; #5;
        a = 1; b = 1; cin = 1; #5;
    end

endmodule