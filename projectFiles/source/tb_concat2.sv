// $Id: $
// File name:   tb_concat2.sv
// Created:     4/26/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is the tb for concat2.sv.



`timescale 1ns / 100ps


module tb_concat2();

// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 20;
	
	// Shared Test Variables
	//Inputs
	logic tb_clk;
	logic tb_n_rst;
	logic [3:0] tb_numPixToLoad;
	logic [3:0] tb_cnt;
	logic [7:0] tb_pixel;
	logic [71:0] tb_matrix;
	logic [7:0] tb_s1,tb_s2,tb_s3,tb_s4,tb_s5,tb_s6,tb_s7,tb_s8,tb_s9;
	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

concat2 DUT(
.clk(tb_clk), 
.n_rst(tb_n_rst), 
.numPixToLoad(tb_numPixToLoad),
.count(tb_cnt),
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
	tb_n_rst = 0;
	@(posedge tb_clk);
	tb_n_rst = 1;
	tb_numPixToLoad = 4'd9;
	tb_cnt = 4'd1;
	tb_pixel = 8'd1;
	@(posedge tb_clk);
	tb_cnt = 4'd2;
	tb_pixel = 8'd6;
	@(posedge tb_clk);
	tb_cnt = 4'd3;
	tb_pixel = 8'd11;
	@(posedge tb_clk);
	tb_cnt = 4'd4;
	tb_pixel = 8'd2;
	@(posedge tb_clk);
	tb_cnt = 4'd5;
	tb_pixel = 8'd7;
	@(posedge tb_clk);
	tb_cnt = 4'd6;
	tb_pixel = 8'd12;
	@(posedge tb_clk);
	tb_cnt = 4'd7;
	tb_pixel = 8'd3;
	@(posedge tb_clk);
	tb_cnt = 4'd8;
	tb_pixel = 8'd8;
	@(posedge tb_clk);
	tb_cnt = 4'd9;
	tb_pixel = 8'd13;
	@(posedge tb_clk);
	tb_numPixToLoad = 4'd3;
	tb_cnt = 4'd1;
	tb_pixel = 8'd4;
	@(posedge tb_clk);
	tb_cnt = 4'd2;
	tb_pixel = 8'd9;
	@(posedge tb_clk);
	tb_cnt = 4'd3;
	tb_pixel = 8'd14;
	@(posedge tb_clk);
	tb_cnt = 4'd1;
	tb_pixel = 8'd5;
	@(posedge tb_clk);
	tb_cnt = 4'd2;
	tb_pixel = 8'd10;
	@(posedge tb_clk);
	tb_cnt = 4'd3;
	tb_pixel = 8'd15;
	@(posedge tb_clk);
	tb_numPixToLoad = 4'd9;
	tb_cnt = 4'd1;
	tb_pixel = 8'd6;
	@(posedge tb_clk);
	tb_cnt = 4'd2;
	tb_pixel = 8'd11;
	@(posedge tb_clk);
	tb_cnt = 4'd3;
	tb_pixel = 8'd16;
	@(posedge tb_clk);
	tb_cnt = 4'd4;
	tb_pixel = 8'd7;
	@(posedge tb_clk);
	tb_cnt = 4'd5;
	tb_pixel = 8'd12;
	@(posedge tb_clk);
	tb_cnt = 4'd6;
	tb_pixel = 8'd17;
	@(posedge tb_clk);
	tb_cnt = 4'd7;
	tb_pixel = 8'd8;
	@(posedge tb_clk);
	tb_cnt = 4'd8;
	tb_pixel = 8'd13;
	@(posedge tb_clk);
	tb_cnt = 4'd9;
	tb_pixel = 8'd18;
	@(posedge tb_clk);
end

endmodule 
