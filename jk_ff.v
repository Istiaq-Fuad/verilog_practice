module jk_ff (
    j, k, clk, q, qbar
);

    input j, k, clk;
    output reg q, qbar;

    always @(posedge clk) begin
        if ((j == 0) & (k == 0)) begin
            q <= q;
            qbar <= ~q;
        end
        if ((j == 0) & (k == 1)) begin
            q <= 0;
            qbar <= 1;
        end
        if ((j == 1) & (k == 0)) begin
            q <= 1;
            qbar <= 0;
        end
        if ((j == 1) & (k == 1)) begin
            q <= ~q;
            qbar <= ~qbar;
        end
    end

endmodule


module jk_ff_tb ();

    reg clk, j, k;
    wire q, qbar;

    jk_ff jkff (j, k, clk, q, qbar);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $dumpfile("jk_ff.vcd");
        $dumpvars(0, jk_ff_tb);
        j = 0; k = 1; #3;
        j = 0; k = 0; #2;
        j = 1; k = 0; #5;
        j = 0; k = 0; #5;
        j = 1; k = 1; #5;
        j = 0; k = 1; #2;
        $finish;
    end

endmodule