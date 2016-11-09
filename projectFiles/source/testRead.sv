// $Id: $
// File name:   testRead.sv
// Created:     4/25/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is an overarching file which calls both read and counters.


module testRead
(
	input logic clk,
	input logic n_rst,
	input logic dataRead,	//Output from FPGA
	input logic executeRead, //From State Machine
	output logic [31:0] readAddress,	//Calculated Based on rowCount colCount & offsetCount
	output logic [3:0] numPixToLoad,	//Should be Number 3 or 9 	
	output logic readEnable			//Should Hold 
);

logic [1:0] rowCount;
logic [9:0] colCount;
logic [8:0] offsetCount;


readController RCNTL(
.clk(clk), 
.n_rst(n_rst),
.rowCount(rowCount),
.colCount(colCount), 
.offsetCount(offsetCount),
.dataRead(dataRead),
.executeRead(executeRead),
.readAddress(readAddress), 
.numPixToLoad(numPixToLoad), 
.readEnable(readEnable)
);

readCounters RC
(
.clk(clk), 
.n_rst(n_rst),
.executeRead(executeRead),
.rowCount(rowCount),
.colCount(colCount),
.offsetCount(offsetCount)
);

endmodule
