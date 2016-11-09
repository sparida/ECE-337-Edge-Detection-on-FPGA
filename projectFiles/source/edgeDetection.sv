// $Id: $
// File name:   edgeDetection.sv
// Created:     4/20/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: this will call all modules needed

module edgeDetection(
/*	input logic clk,
    	input logic n_rst,
    	input logic [31:0] startSignal,  // Starts the Processing of Image
    	input logic [31:0] inputData,     // Input Pixel Data from FPGA in Form 00RGB (Hex)
    	input logic [31:0] rwError,       // Input from FPGA Read/Write Error (Error => FFFFF)
    	input logic [31:0] readDone,     // Input Read Done from FPGA (When Address Has Been Processed & inputData Ready for Program)
    	input logic [31:0] writeDone,     // Input Write Done from FPGA (After Address Has Been Processed & outputData Has Been Read by FPGA)
   	
    	output logic [31:0] address,     // Address for FPGA to Read/Write
    	output logic [31:0] outputData,     // Data for FPGA to Wrote
    	output logic [31:0] readEnable,  // Flag Telling FPGA to Read Address & Send Back Pixel
    	output logic [31:0] writeEnable, // Flag Telling FPGA to Read Address & outputData
    	output logic [31:0] outputError  // Flag Telling FPGA That Internal Error Has Occured Somewhere*/

    input wire clk,
    input wire n_rst,
    input wire [23:0] rgb,
    input wire startSignal,
    output wire [7:0] sobelOutFinal,
    output wire [18:0] outputAddressOffset,
    output wire useIt,
	output wire [31:0] readEnable,
	output wire [31:0] writeEnable

);
reg countUp,rollover_flag;
reg [3:0] rollover_val,count_out;
reg [7:0] grayPix;
reg [71:0] matrix;
reg [7:0] sobelOut;
//reg useIt;
assign rollover_val=4'd12;

controller CNT(
.clk(clk),
.n_rst(n_rst),
.startSignal(startSignal),
.startSobel(rollover_flag),
.startCalc(countUp)
);


rgbToGray GRY(
.clk(clk),
.n_rst(n_rst),
.rgb(rgb),
.gray(grayPix)
);

concat CCT(
.clk(clk),
.n_rst(n_rst),
.pixel(grayPix),
.count(count_out),
.matrix(matrix)

);

flex_counter FCT(

.clk(clk),
.n_rst(n_rst),
.clear(useIt),  //might have to assign start signal to this
//.count_enable(countUp),
.count_enable(startSignal),
.rollover_val(rollover_val),
.count_out(count_out),
.rollover_flag(rollover_flag)

);

sobel SBL(
.clk(clk),
.n_rst(n_rst),
.data(matrix),
.out(sobelOut)
);

captureOutput COT(

.clk(clk),
.n_rst(n_rst),
.holdIt(rollover_flag),
.sobelValue(sobelOut),
.useIt(useIt),
.out(sobelOutFinal),
.outOffset(outputAddressOffset),
.read(readEnable),
.write(writeEnable)
);



endmodule

