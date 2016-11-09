// $Id: $
// File name:   tb_edgeDetection2.sv
// Created:     4/26/2016
// Author:      Kareem El Azhary
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: test edge detection 2


`timescale 1ns / 100ps


module tb_edgeDetection2();

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

reg tb_n_rst;
reg [31:0] tb_startSignal;  // Starts the Processing of Image
reg [31:0] tb_inputData;     // Input Pixel Data from FPGA in Form 00RGB (Hex)
reg [31:0] tb_rwError;       // Input from FPGA Read/Write Error (Error => FFFFF)
reg [31:0] tb_readDone;     // Input Read Done from FPGA (When Address Has Been Processed & inputData Ready for Program)
reg [31:0] tb_writeDone;     // Input Write Done from FPGA (After Address Has Been Processed & outputData Has Been Read by FPGA)
   	
reg [31:0] tb_readAddress;     // Address for FPGA to Read/Write
reg [31:0] tb_writeAddress;
reg [31:0] tb_outputData;     // Data for FPGA to Wrote
reg [31:0] tb_readEnable;  // Flag Telling FPGA to Read Address & Send Back Pixel
reg [31:0] tb_writeEnable; // Flag Telling FPGA to Read Address & outputData
reg [31:0] tb_outputError;  // Flag Telling FPGA That Internal Error Has Occured Somewhere*/

edgeDetection2 DUT(
.clk(tb_clk),
.n_rst(tb_n_rst),
.startSignal(tb_startSignal),
.inputData(tb_inputData),
.rwError(tb_rwError),
.readDone(tb_readDone),
.writeDone(tb_writeDone),
.readAddress(tb_readAddress),
.writeAddress(tb_writeAddress),
.outputData(tb_outputData),
.readEnable(tb_readEnable),
.writeEnable(tb_writeEnable),
.outputError(tb_outputError)

);
int i;
initial
begin
	tb_n_rst=0;
	tb_startSignal=0;
	tb_rwError=0;
	tb_readDone=0;
	tb_writeDone=0;
	@(posedge tb_clk);
	tb_n_rst=1;
	
	tb_startSignal=1;
	@(posedge tb_clk);
	@(posedge tb_clk);
	/*@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010000010111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101110101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010100000111011111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010100110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101000000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000101010101110110000111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);*/
@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd328965;
	//tb_inputData=32'b00000000101010101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd13816530;
	//tb_inputData=32'b00000000101010000010111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd4737096;
	//tb_inputData=32'b00000000101110101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd14474460;
	//tb_inputData=32'b00000000101010100000111011111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd7237230;
	//tb_inputData=32'b00000000101010100110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd4539717;
	//tb_inputData=32'b00000000101010000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd1315860;
	//tb_inputData=32'b00000000101000000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd13816530;
	//tb_inputData=32'b00000000101010101110110000111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd3552822;
	//tb_inputData=32'b00000000100000101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
tb_writeDone=1;
//adding 3 more

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_writeDone=0;
	tb_inputData=32'b00000000100000101110100010001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000000010111010101011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000101110110000000000;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

//adding 3 more

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100000100010001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000000010111000001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100010110000000000;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

//try to test when it reaches row 2, to store 9 again
for(i=0;i<634;i++)
begin
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100000100010001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000000010111000001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100010110000000000;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

end
//adding 3 before having to add 9
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'd2236962; //34
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'd8092539; //123
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'd2302755; //35
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

//now adding new 9
@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd328965;
	//tb_inputData=32'b00000000101010101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd13816530;
	//tb_inputData=32'b00000000101010000010111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd4737096;
	//tb_inputData=32'b00000000101110101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
	tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd14474460;
	//tb_inputData=32'b00000000101010100000111011111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd7237230;
	//tb_inputData=32'b00000000101010100110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd4539717;
	//tb_inputData=32'b00000000101010000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd1315860;
	//tb_inputData=32'b00000000101000000110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd13816530;
	//tb_inputData=32'b00000000101010101110110000111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

@(posedge tb_clk);
	@(posedge tb_clk);
	tb_inputData=32'd3552822;
	//tb_inputData=32'b00000000100000101110111010111011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

//wanna add the same 3 again
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000101110100010001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000000010111010101011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000101110110000000000;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);

//adding 3 more like before

@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100000100010001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000000010111000001011;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
@(posedge tb_clk);
	@(posedge tb_clk);
	
	tb_inputData=32'b00000000100000100010110000000000;
	tb_readDone=1;
	@(posedge tb_clk);
tb_readDone=0;
	@(posedge tb_clk);
end




endmodule 