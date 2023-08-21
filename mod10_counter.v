`include "master_slave_jkff.v"

module mod10_counter (
    q, clk
);

    input clk;
    output [3:0] q;
    wire [3:0] qbar;
    wire clr;
    reg j = 1, k = 1;

    nand (clr, q[3], q[1]);

    master_slave_jkff msjkff0 (j, k, clk, clr, q[0], qbar[0]);
    master_slave_jkff msjkff1 (j, k, q[0], clr, q[1], qbar[1]);
    master_slave_jkff msjkff2 (j, k, q[1], clr, q[2], qbar[2]);
    master_slave_jkff msjkff3 (j, k, q[2], clr, q[3], qbar[3]);

endmodule


// module mod10_counter_tb ();

//     reg clk;
//     wire [3:0] q;

//     mod10_counter cntr (.q(q), .clk(clk));

//     initial begin
//         clk = 0;
//         forever #2 clk = ~clk;
//     end

//     initial begin
//         $dumpfile("mod10_counter.vcd");
//         $dumpvars(0, mod10_counter_tb);
//         #30;
//         $finish;
//     end

// endmodule