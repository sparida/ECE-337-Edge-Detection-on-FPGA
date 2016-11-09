// $Id: $
// File name:   tb_sobel.sv
// Created:     4/19/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: sobel test bench



`timescale 1ns / 100ps

module tb_sobel
();

	// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 20;
	
	// Shared Test Variables
	reg tb_clk;
	
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

reg [7:0]p0,p1,p2,p3,p5,p6,p7,p8,out;
reg [63:0] data;



sobel DUT(
/*.p0(p0),
.p1(p1),
.p2(p2),
.p3(p3),
.p5(p5),
.p6(p6),
.p7(p7),
.p8(p8),*/
.data(data),
.out(out)

);

initial
       	begin
		/*p0=8'b00110110;
p1=8'b11010010;
p2=8'b00010100;
p3=8'b01000101;
p5=8'b11011100;
p6=8'b01001000;
p7=8'b11010010;
p8=8'b11111111;*/
data=64'b0011011011010010000101000100010111011100010010001101001011111111;
        end
endmodule 