// full adder implementation from scratch
module full_adder_scratch (sum, cout, a, b, cin);

    input a, b, cin;
    output sum, cout;
    wire w1, w2, w3;

    xor (w1, a, b);
    xor (sum, w1, cin);
    and (w2, cin, w1);
    and (w3, a, b);
    or (cout, w2, w3);

endmodule


module full_adder_scratch_tb ();

    reg a, b, cin;
    wire sum, cout;

    full_adder_scratch fa (sum, cout, a, b, cin);

    initial begin
        $dumpfile("full_adder_scratch.vcd");
        $dumpvars(0, full_adder_scratch_tb);
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