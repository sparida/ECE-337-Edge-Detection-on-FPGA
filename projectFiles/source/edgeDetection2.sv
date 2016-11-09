// $Id: $
// File name:   edgeDetection2.sv
// Created:     4/26/2016
// Author:      Kareem El Azhary
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: second main file

module edgeDetection2(
	input logic clk,
    	input logic n_rst,
    	input logic [31:0] startSignal,  // Starts the Processing of Image
    	input logic [31:0] inputData,     // Input Pixel Data from FPGA in Form 00RGB (Hex)
    	input logic [31:0] rwError,       // Input from FPGA Read/Write Error (Error => FFFFF)
    	input logic [31:0] readDone,     // Input Read Done from FPGA (When Address Has Been Processed & inputData Ready for Program)
    	input logic [31:0] writeDone,     // Input Write Done from FPGA (After Address Has Been Processed & outputData Has Been Read by FPGA)
   	
    	output logic [31:0] readAddress,     // Address for FPGA to Read/Write
	output logic [31:0] writeAddress,
    	output logic [31:0] outputData,     // Data for FPGA to Wrote
    	output logic [31:0] readEnable,  // Flag Telling FPGA to Read Address & Send Back Pixel
    	output logic [31:0] writeEnable, // Flag Telling FPGA to Read Address & outputData
    	output logic [31:0] outputError  // Flag Telling FPGA That Internal Error Has Occured Somewhere*/
);

reg [1:0] rowCount;
reg [9:0] colCount;
reg [8:0] offsetCount;
reg [3:0] numPixToLoad;
reg executeRead;
reg grayReady,grayReady2;
reg [3:0] countOut;
reg startSobel;
reg [71:0] matrix;
reg [7:0] s1,s2,s3,s4,s5,s6,s7,s8,s9;
reg [7:0] grayPixel;
reg cols_rollover_flag;
reg assertWrite;
reg [7:0] sobelData;
reg [31:0] readTempSignal;
reg [31:0] writeEnableTempSignal;

controller2 controller(
.clk(clk),
.n_rst(n_rst),
.startSignal(startSignal),
.readDone(readDone),
.rwError(rwError),
.countVal(numPixToLoad),
.countOut(countOut),
.executeRead(executeRead),
.readEnable(readEnable),
.outputError(outputError),
.grayReady(grayReady),
.grayReady2(grayReady2),
.writeEnable(assertWrite),
.signalToAssertWriteEnable(writeEnableTempSignal),
.writeDone(writeDone),
.realOutputEnable(writeEnable)
);


readController readController(
.clk(clk),	
.n_rst(n_rst), 
.rowCount(rowCount),
.colCount(colCount),
.offsetCount(offsetCount),
.executeRead(executeRead),
.startSobel(startSobel),
	
.readAddress(readAddress),	
.numPixToLoad(numPixToLoad)	
	


);

readCounters readCounter(
.clk(clk),
.n_rst(n_rst),
.executeRead(executeRead), 

.rowCount(rowCount),
.colCount(colCount),
.offsetCount(offsetCount),
.cols_rollover_flag(cols_rollover_flag)
);

rgbToGray2 rgbToGray(
.clk(clk),
.n_rst(n_rst),
.inputData(inputData),

.grayPixel(grayPixel)

);

flex_counter flexCounterStore(
.clk(clk),
.n_rst(n_rst),
.clear(cols_rollover_flag | rwError[0]),//(rwError[0]),  //if anything goes wrong, remove the rwError[0]
.count_enable(grayReady),
.rollover_val(numPixToLoad),
.colsFlag(cols_rollover_flag),
.count_out(countOut),
.rollover_flag(startSobel)

);

concat2 concat(
.clk(clk),
.n_rst(n_rst),
.pixel(grayPixel),
.grayReady(grayReady),
.grayReady2(grayReady2),
.numPixToLoad(numPixToLoad),
.count(countOut),
.matrix(matrix),
.s1(s1),
.s2(s2),
.s3(s3),
.s4(s4),
.s5(s5),
.s6(s6),
.s7(s7),
.s8(s8),
.s9(s9)

);


sobel sobel(
.clk(clk),
.n_rst(n_rst),
.data(matrix),
.out(sobelData)

);

captureOutput2 captureOutput(
.clk(clk),
.n_rst(n_rst),
.holdIt(assertWrite),
.sobelValue(sobelData),

.out(outputData),
.write(writeEnableTempSignal),
.read(readTempSignal)

);
endmodule 