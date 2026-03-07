module Shifter (Clk, EN, WR, RD, SI, SO, Data);
  // synopsys template

  parameter L = 1;

  input Clk, EN, WR, RD, SI;
  output SO;
  inout [L-1:0] Data;

  reg SO;
  reg [L-1:0] shift_reg;

  assign Data = !RD ? shift_reg : {L{1'bz}};

  always @(posedge Clk)
    if (!EN)
    begin
      SO <= shift_reg[0];
      shift_reg = shift_reg >> 1;
      shift_reg[L-1] = SI;
    end
    else if (!WR)
      shift_reg = Data;

  always @(WR or EN)
    if (!WR & !EN)
      $display("Error, Wr and En both active");

endmodule

