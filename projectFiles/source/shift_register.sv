// $Id: $
// File name:   shift_register.sv
// Created:     2/28/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is it.


module shift_register
(
	input logic clk,
	input logic n_rst,
	input logic shift_enable,
	input logic [7:0] grayPix,
	output logic [71:0] matrix
);

flex_stp_sr #(72,0) DUT(.clk(clk),.n_rst(n_rst),.shift_enable(shift_enable), .serial_in(grayPix), .parallel_out(matrix));

endmodule
