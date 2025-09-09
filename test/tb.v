`timescale 1ns/1ps
`default_nettype none

module tb_tt_um_example;

  reg  [7:0] ui_in;
  reg  [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;
  reg        ena;
  reg        clk;
  reg        rst_n;

  // DUT
  tt_um_example dut (
    .ui_in(ui_in),
    .uo_out(uo_out),
    .uio_in(uio_in),
    .uio_out(uio_out),
    .uio_oe(uio_oe),
    .ena(ena),
    .clk(clk),
    .rst_n(rst_n)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    ena   = 1;
    clk   = 0;
    rst_n = 1;

    ui_in  = 8'b11101111; // operand1 (239), sel initially 1110
    uio_in = 8'b10011110; // operand2 (158)

    // Apply different opcodes
    ui_in[7:4] = 4'b0000; #20; // ADD
    ui_in[7:4] = 4'b0001; #20; // SUB
    ui_in[7:4] = 4'b0010; #20; // MUL
    ui_in[7:4] = 4'b0011; #20; // DIV
    ui_in[7:4] = 4'b0100; #20; // AND
    ui_in[7:4] = 4'b0101; #20; // OR
    ui_in[7:4] = 4'b0110; #20; // NOT in1
    ui_in[7:4] = 4'b0111; #20; // NOT in2
    ui_in[7:4] = 4'b1000; #20; // SQUARE in1
    ui_in[7:4] = 4'b1001; #20; // SQUARE in2
    ui_in[7:4] = 4'b1010; #20; // LESS THAN
    ui_in[7:4] = 4'b1011; #20; // EQUAL
    ui_in[7:4] = 4'b1100; #20; // GREATER THAN

    $finish;
  end

  // Optional clock (not used by ALU, but kept for skeleton)
  always #5 clk = ~clk;

endmodule
