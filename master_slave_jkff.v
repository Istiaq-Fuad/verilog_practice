module master_slave_jkff (
  j, k, clk, clr, q, qbar
);

  input j, k, clk, clr;
  output q, qbar;
  wire n0, n1, n2, n3, q0, q1, clkbar;

  nand (n0, j, clk, clr, qbar);
  nand (n1, K, clk, q);
  nand (q0, q1, n0);
  nand (q1, q0, n1, clr);

  not (clkbar, clk);

  nand (n2, q0, clkbar);
  nand (n3, q1, clkbar);
  nand (q, n2, qbar);
  nand (qbar, n3, q, clr);

endmodule


// module master_slave_jkff_tb ();

//     reg clk, clr, j, k;
//     wire q, qbar;

//     master_slave_jkff msjkff (j, k, clk, clr, q, qbar);

//     initial begin
//         clk = 0;
//         forever #2 clk = ~clk;
//     end

//     initial begin
//         $dumpfile("master_slave_jkff.vcd");
//         $dumpvars(0, master_slave_jkff_tb);
//         j = 0; k = 1; clr = 0; #3;
//         j = 0; k = 0; clr = 1; #2;
//         j = 1; k = 0; #5;
//         j = 0; k = 0; #5;
//         // j = 1; k = 1; #5;
//         j = 0; k = 1; #2;
//         $finish;
//     end

// endmodule
