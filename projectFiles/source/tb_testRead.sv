// $Id: $
// File name:   tb_testRead.sv
// Created:     4/25/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is the tb for readTest.

`timescale 1ns / 100ps


module tb_testRead();

// Define parameters
	// basic test bench parameters
	localparam	CLK_PERIOD	= 20;
	
	// Shared Test Variables
	//Inputs
	logic tb_clk;
	logic tb_n_rst;
	logic tb_dataRead;
	logic tb_executeRead;
	
	//Outputs
	logic [31:0] tb_readAddress;
	logic [3:0] tb_numPixToLoad;
	logic tb_readEnable;

	// Clock generation block
	always
	begin
		tb_clk = 1'b0;
		#(CLK_PERIOD/2.0);
		tb_clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end

testRead DUT(
.clk(tb_clk), 
.n_rst(tb_n_rst), 
.dataRead(tb_dataRead),
.executeRead(tb_executeRead), 
.readAddress(tb_readAddress), 
.numPixToLoad(tb_numPixToLoad), 
.readEnable(tb_readEnable)
); 

integer i;

initial
begin
	tb_n_rst = 1'b0;
	tb_executeRead = 1'b0;
	tb_dataRead = 1'b0;
	@(posedge tb_clk);
	tb_n_rst = 1'b1;

	for(i=0; i < 4000; i++)
	begin
		tb_executeRead = 1'b1;
		@(posedge tb_clk);
		tb_executeRead= 1'b0;
		tb_dataRead = 1'b1;
		@(posedge tb_clk);
		tb_dataRead = 1'b0;
		$info("ITERATION: %0d", i);
		$info("READ_ADDRESS: %0d", tb_readAddress);
		$info("NUM PIXELS TO LOAD: %0d", tb_numPixToLoad);
	end


	
end

endmodule 