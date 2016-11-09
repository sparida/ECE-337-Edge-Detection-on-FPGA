// $Id: $
// File name:   flex_stp_sr.sv
// Created:     1/30/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is a n-bit serial to parallel shift register.

module flex_stp_sr
#(
	parameter NUM_BITS = 4,
  	parameter SHIFT_MSB = 1
)
(
	input wire clk,
	input wire n_rst,
	input wire shift_enable,
	input wire [7:0] serial_in, 
	output reg [NUM_BITS-1:0] parallel_out
);

always_ff@(posedge clk, negedge n_rst)
begin
	if (n_rst == 0)
	begin
		parallel_out[NUM_BITS-1:0] <= '1;
	end
	else
	begin
		if(shift_enable == 1)
		begin
			if(SHIFT_MSB == 0)
			begin
				parallel_out[NUM_BITS-1:0] <= {serial_in,parallel_out[NUM_BITS-1:1]};
			end
			else
			begin
				parallel_out[NUM_BITS-1:0] <= {parallel_out[NUM_BITS-2:0],serial_in};
			end
		end
	end
end

endmodule
