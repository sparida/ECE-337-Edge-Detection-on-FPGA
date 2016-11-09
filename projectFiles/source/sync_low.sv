// $Id: $
// File name:   sync_low.sv
// Created:     1/26/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is a synchronizer.

module sync_low
(
  input wire clk,
  input wire n_rst,
  input wire async_in,
  output reg sync_out
);

reg sync_out2;

always_ff @ (posedge clk, negedge n_rst)
begin 
  if(1'b0 == n_rst)
  begin
    sync_out <= 1'b0;
    sync_out2 <= 1'b0;
  end
  else
  begin
    sync_out <= async_in;
    sync_out2 <= sync_out; 
  end
end


endmodule 