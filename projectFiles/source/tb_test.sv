// $Id: $
// File name:   tb_test.sv
// Created:     4/18/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is a test bench for ideas/proposals.

`timescale 1ns / 100ps

module tb_test
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

        // Declare Design Under Test (DUT) portmap signals
	logic [23:0] tb_rgb;
	logic [7:0] tb_gray;


        // DUT port map
        test DUT(.rgb(tb_rgb), .gray(tb_gray)); 
	
        // Test bench process (Change the Inside of This to be Golden)
        initial
       	begin
		
		tb_rgb = 24'b000000000000000000000000;
		@(posedge tb_clk);
		
		
		tb_rgb = 24'b111111111111111111111111;
		@(posedge tb_clk);
		
		
		tb_rgb = 24'b111110011111000111110011;
        end

endmodule
