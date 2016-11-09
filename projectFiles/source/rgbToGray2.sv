// $Id: $
// File name:   rgbToGray2.sv
// Created:     4/26/2016
// Author:      Kareem El Azhary
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: grayscale 2

module rgbToGray2
(
	input clk,
	input n_rst,
	
	input logic [31:0] inputData,
	output logic [7:0] grayPixel
	
);


logic [15:0] r;
logic [15:0] g;
logic [15:0] b;
logic [15:0] total;
reg [7:0] grayTemp;


always_comb
begin
	r = 54*inputData[23:16];
	g = 184*inputData[15:8];
	b = 18*inputData[7:0];
end

assign total = r + g + b;

//assign grayPixel = {24'b000000000000000000000000,total[15:8]};


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

assign grayPixel=grayTemp;

endmodule 