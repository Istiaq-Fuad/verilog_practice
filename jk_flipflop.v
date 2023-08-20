module jk_flipflop (
    j,
    k,
    clk,
    q,
    qbar
);

  input j, k, clk;
  output q, qbar;
  wire nand1out, nand2out;

  // initial begin
  //   q = 0;
  //   qbar = ~q;
  // end

  nand (nand1out, j, clk, qbar);
  nand (nand2out, K, clk, q);
  nand (q, nand1out, qbar);
  nand (qbar, nand2out, q);

endmodule

module jk_flipflop_tb ();

  reg J, K, CLK;
  wire Q, QBAR;

  jk_flipflop jkff (
      J,
      K,
      CLK,
      Q,
      QBAR
  );

  initial begin
    CLK = 0;
    forever #2 CLK = ~CLK;
  end

  initial begin
    $dumpfile("jk_flipflop.vcd");
    $dumpvars(0, jk_flipflop_tb);
    CLK = 1;
    J = 0;
    K = 0;
    #2;
    J = 0;
    K = 1;
    #2;
    J = 1;
    K = 0;
    #5;
    J = 1;
    K = 1;
    #5;
    $finish;
  end

endmodule
