// $Id: $
// File name:   rgbOverall.sv
// Created:     4/19/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: wrapper file for rgb testing


module rgbOverall(
	input wire clk,
	input wire n_rst,
	input wire [23:0]data,
	input wire startSignal,
	output wire [7:0]finalOut
);
reg startCalc;
reg [71:0] matrix;
reg [7:0] result;


controller CONT(
.clk(clk),
.n_rst(n_rst),
.startSignal(startSignal),
.startCalc(startCalc)
);


rgbToGray GRAY(
.rgb(data),
.gray(result)
);


shift_register SR(
.clk(clk),
.n_rst(n_rst),
.shift_enable(startCalc),
.grayPix(result),
.matrix(matrix)
);


sobel S(
.data(matrix),
.out(finalOut)
);


endmodule  