module binary_to_gray (
    o,
    i
);

  output [3:0] o;
  input [3:0] i;

  buf (o[3], i[3]);
  xor (o[2], i[3], i[2]);
  xor (o[1], i[2], i[1]);
  xor (o[0], i[1], i[0]);

endmodule


module binary_to_gray_tb ();

  reg  [3:0] binary;
  wire [3:0] gray;

  binary_to_gray b2g (
      .o(gray),
      .i(binary)
  );

  initial begin
    // $monitor("binary=%b, gray=%b", binary, gray);
    $dumpfile("binary_to_gray.vcd");
    $dumpvars(0, binary_to_gray_tb);
    binary = 4'b0000;
    #50;
    binary = 4'b0001;
    #50;
    binary = 4'b0010;
    #50;
    binary = 4'b0011;
    #50;
    binary = 4'b0100;
    #50;
    binary = 4'b0101;
    #50;
    binary = 4'b0110;
    #50;
    binary = 4'b0111;
    #50;
    binary = 4'b1000;
    #50;
    binary = 4'b1001;
    #50;
    binary = 4'b1010;
    #50;
    binary = 4'b1011;
    #50;
    binary = 4'b1100;
    #50;
    binary = 4'b1101;
    #50;
    binary = 4'b1110;
    #50;
    binary = 4'b1111;
    #50;
    // $finish;
  end

endmodule
