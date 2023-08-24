module bcd_to_xs3 (bcd, xs3);   // no need to include in modelsim

    input [3:0] bcd;
    output [3:0] xs3;
    wire w1, w2;

    or (w1, bcd[0], bcd[1]);
    and (w2, bcd[2], w1);
    or (xs3[3], bcd[3], w2);
    xor (xs3[2], bcd[2], w1);
    xnor (xs3[1], bcd[0], bcd[1]);
    not (xs3[0], bcd[0]);

endmodule

module bcd_to_xs3_tb ();

    reg [3:0] bcd;
    wire [3:0] xs3;

    bcd_to_xs3 bcdtoxs3 (.bcd(bcd), .xs3(xs3));

    initial begin
        $dumpfile("bcd_to_xs3.vcd");
        $dumpvars(0, bcd_to_xs3_tb);

        bcd[3] = 0; bcd[2] = 0; bcd[1] = 0; bcd[0] = 0; #2;
        bcd[3] = 0; bcd[2] = 0; bcd[1] = 0; bcd[0] = 1; #2;
        bcd[3] = 0; bcd[2] = 0; bcd[1] = 1; bcd[0] = 0; #2;
        bcd[3] = 0; bcd[2] = 0; bcd[1] = 1; bcd[0] = 1; #2;
        bcd[3] = 0; bcd[2] = 1; bcd[1] = 0; bcd[0] = 0; #2;
        bcd[3] = 0; bcd[2] = 1; bcd[1] = 0; bcd[0] = 1; #2;
        bcd[3] = 0; bcd[2] = 1; bcd[1] = 1; bcd[0] = 0; #2;
        bcd[3] = 0; bcd[2] = 1; bcd[1] = 1; bcd[0] = 1; #2;
        bcd[3] = 1; bcd[2] = 0; bcd[1] = 0; bcd[0] = 0; #2;
        bcd[3] = 1; bcd[2] = 0; bcd[1] = 0; bcd[0] = 1; #2;
        $finish;
    end

endmodule