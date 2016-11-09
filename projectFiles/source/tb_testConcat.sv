// $Id: $
// File name:   tb_testConcat.sv
// Created:     4/20/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: test bench to test concat

`timescale 1ns / 100ps


module tb_testConcat();

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

reg tb_count_enable;
reg [7:0] tb_pixel; 
reg [71:0] tb_matrix;
reg tb_n_rst,tb_clear;
reg [7:0] tb_s1,tb_s2,tb_s3,tb_s4,tb_s5,tb_s6,tb_s7,tb_s8,tb_s9;

testConcat DUT(
.clk(tb_clk),
.n_rst(tb_n_rst),
.clear(tb_clear),
.count_enable(tb_count_enable),
.pixel(tb_pixel),
.matrix(tb_matrix),
.s1(tb_s1),
.s2(tb_s2),
.s3(tb_s3),
.s4(tb_s4),
.s5(tb_s5),
.s6(tb_s6),
.s7(tb_s7),
.s8(tb_s8),
.s9(tb_s9)
);

initial
begin
	tb_n_rst=0;
@(negedge tb_clk);
@(negedge tb_clk);

	tb_n_rst=1;
	tb_clear=1;
tb_count_enable=1;
@(negedge tb_clk);
	tb_clear=0;
	@(negedge tb_clk);
	
	tb_pixel=8'd10;
	
	
	@(negedge tb_clk);
	//tb_count_enable=0;
	//@(negedge tb_clk);
	tb_pixel=8'd20;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd30;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd40;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd50;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd60;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd70;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd80;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
	@(negedge tb_clk);
	tb_pixel=8'd90;
	//tb_count_enable=1;
	//@(negedge tb_clk);
	//tb_count_enable=0;
end

endmodule 