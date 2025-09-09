module tt_um_ALU_4bit(
  output reg [7:0] uo_out,
  input [3:0] ena,
  input [3:0] ui_in,uio_in);
  always@(*)
    begin
      case(ena)
        4'b0000: uo_out = ui_in+uio_in;
        4'b0001: uo_out = ui_in-uio_in;
        4'b0010: uo_out = ui_in*uio_in;
        4'b0011: uo_out = ui_in/uio_in;
        4'b0100: uo_out = ui_in&uio_in;
        4'b0101: uo_out = ui_in|uio_in;
        4'b0110: uo_out = ~ui_in;
        4'b0111: uo_out = ~uio_in;
        4'b1000: uo_out = ui_in*ui_in;
        4'b1001: uo_out = uio_in*uio_in;
        4'b1010: begin if (ui_in < uio_in) uo_out = 16'b1111111111111111;
          else uo_out = 16'b0000000000000000; end
        4'b1011: begin if (ui_in == uio_in) uo_out = 16'b1111111111111111;
          else uo_out = 16'b0000000000000000; end
        4'b1100: begin if (ui_in > uio_in) uo_out = 16'b1111111111111111;
          else uo_out = 16'b0000000000000000; end
      endcase
    end 
endmodule
