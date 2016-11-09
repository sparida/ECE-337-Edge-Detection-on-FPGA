// $Id: $
// File name:   tb_rgbOverall.sv
// Created:     4/19/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: test bench for overall rgb testing

`timescale 1ns / 100ps

module tb_rgbOverall
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

reg [23:0] tb_data;
reg tb_startSignal;
reg [7:0] tb_finalOut;
reg tb_n_rst;

rgbOverall DUT(
.clk(tb_clk),
.n_rst(tb_n_rst),
.data(tb_data),
.startSignal(tb_startSignal),
.finalOut(tb_result)

);

initial
       	begin
		tb_n_rst=1;
		tb_startSignal=0;
		tb_data = 24'b000000000000000000000000;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data = 24'b111111111111111111111111;
		tb_startSignal=1;
		
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data = 24'b111110011111000111110011;
		
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010101010101010101010;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010111010101010101010;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010101010101011101010;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b111010101010101010101010;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010101010101010101011;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010101110101010101010;
@(posedge tb_clk);
@(posedge tb_clk);
		tb_data= 24'b101010101010101011101010;

		
		

        end
endmodule 