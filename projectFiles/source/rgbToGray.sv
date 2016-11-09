// $Id: $
// File name:   rgbToGray.sv
// Created:     4/14/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This module takes in input of a 24 bit rgb value and outputs a 8 bit grayscale value. It takes 2 clock cycles.

module rgbToGray
(
	input clk,
	input n_rst,
	
	input logic [23:0] rgb,
	output logic [7:0] gray
);

logic [15:0] r;
logic [15:0] g;
logic [15:0] b;
logic [15:0] total;
reg [7:0] grayTemp;

always_comb
begin
	r = 54*rgb[23:16];
	g = 184*rgb[15:8];
	b = 18*rgb[7:0];
end

assign total = r + g + b;

//assign gray = total[15:8];


always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		grayTemp<='0;
	end
	else
	begin
		grayTemp <= total[15:8]; 
	end
end

assign gray=grayTemp;

endmodule
