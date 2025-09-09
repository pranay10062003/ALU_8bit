`default_nettype none
`timescale 1ns / 1ps

/* This testbench just instantiates the module and makes some convenient wires
   that can be driven / tested by the cocotb test.py.
*/
module ALU_4bit_tb;
  wire [7:0] uo_out;
  reg [3:0] ena;
  reg [3:0] ui_in,uio_in;
  tt_um_ALU4bit sai (.ui_in(ui_in),.uio_in(uio_in),.ena(ena),.uo_out(uo_out));
  initial
    begin
      $dumpfile("dump.vcd"); $dumpvars;
      ui_in = 4'b1110;
      uio_in = 4'b1001;
      ena = 4'b0000; #20;
      ena = 4'b0001; #20;
      ena = 4'b0010; #20;
      ena = 4'b0011; #20;
      ena = 4'b0100; #20;
      ena = 4'b0101; #20;
      ena = 4'b0110; #20;
      ena = 4'b0111; #20;
      ena = 4'b1000; #20;
      ena = 4'b1001; #20;
      ena = 4'b1010; #20;
      ena = 4'b1011; #20;
      ena = 4'b1100; #20;
      $finish;
    end
endmodule
