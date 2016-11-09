// $Id: $
// File name:   tb_edgeDetection.sv
// Created:     4/20/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: test bench

`timescale 1ns / 100ps


module tb_edgeDetection();

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
reg [23:0] tb_rgb;
reg tb_startSignal;
reg [7:0] tb_sobelOut;
reg tb_useIt;
reg [18:0] tb_outputAddressOffset;
reg [31:0] tb_readEnable, tb_writeEnable;
edgeDetection DUT(
.clk(tb_clk),
.n_rst(tb_n_rst),
.rgb(tb_rgb),
.startSignal(tb_startSignal),
.sobelOutFinal(tb_sobelOut),
.useIt(tb_useIt),
.outputAddressOffset(tb_outputAddressOffset),
.readEnable(tb_readEnable),
.writeEnable(tb_writeEnable)
);

initial
begin
	tb_n_rst=0;
	tb_startSignal=0;
	tb_rgb=24'b0;
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_n_rst=1;
	@(posedge tb_clk);
	
	
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_startSignal=1;
	@(posedge tb_clk);
	//tb_rgb = 24'd16777215;//255
	//tb_rgb=24'd328965; //5
	
	//@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd2039583; //31
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4737096; //72
	tb_rgb=24'd460551; //7
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd14474460; //220
	tb_rgb=24'd1381653; //21
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd7237230; //110
	tb_rgb=24'd394758; //6
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4539717;  //69
	tb_rgb=24'd789516; //12
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd1315860; //20
	tb_rgb=24'd4802889; //73
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd7171437; //109
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd3552822; //54
	tb_rgb=24'd3289650; //50
	@(posedge tb_clk);
	tb_rgb=24'd2434341; //37


//num 2
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
//tb_n_rst=0;
	tb_startSignal=0;
	//tb_rgb=24'b0;
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_n_rst=1;
	@(posedge tb_clk);
	
	
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_startSignal=1;
	@(posedge tb_clk);
	//tb_rgb = 24'd16777215;//255
	tb_rgb=24'd328965; //5
	
	//@(posedge tb_clk);
	@(posedge tb_clk);
	tb_rgb = 24'd13816530; //210
	//tb_rgb=24'd2039583; //31
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd4737096; //72
	//tb_rgb=24'd460551; //7
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd14474460; //220
	//tb_rgb=24'd1381653; //21
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd7237230; //110
	//tb_rgb=24'd394758; //6
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd4539717;  //69
	//tb_rgb=24'd789516; //12
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd1315860; //20
	//tb_rgb=24'd4802889; //73
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd13816530; //210
	//tb_rgb=24'd7171437; //109
	@(posedge tb_clk);
	//@(posedge tb_clk);
	tb_rgb = 24'd3552822; //54
	//tb_rgb=24'd3289650; //50
	//@(posedge tb_clk);
	//tb_rgb=24'd2434341; //37




//num 3
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
//tb_n_rst=0;
	tb_startSignal=0;
	//tb_rgb=24'b0;
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_n_rst=1;
	@(posedge tb_clk);
	
	
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_startSignal=1;
	@(posedge tb_clk);
	//tb_rgb = 24'd16777215;//255
	//tb_rgb=24'd328965; //5
	
	//@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd2039583; //31
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4737096; //72
	tb_rgb=24'd460551; //7
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd14474460; //220
	tb_rgb=24'd1381653; //21
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd7237230; //110
	tb_rgb=24'd394758; //6
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4539717;  //69
	tb_rgb=24'd789516; //12
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd1315860; //20
	tb_rgb=24'd4802889; //73
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd7171437; //109
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd3552822; //54
	tb_rgb=24'd3289650; //50
	@(posedge tb_clk);
	tb_rgb=24'd2434341; //37



//num 4
@(posedge tb_clk);
@(posedge tb_clk);
@(posedge tb_clk);
//tb_n_rst=0;
	tb_startSignal=0;
	//tb_rgb=24'b0;
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_n_rst=1;
	@(posedge tb_clk);
	
	
	@(posedge tb_clk);
	@(posedge tb_clk);
	tb_startSignal=1;
	@(posedge tb_clk);
	//tb_rgb = 24'd16777215;//255
	//tb_rgb=24'd328965; //5
	
	//@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd2039583; //31
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4737096; //72
	tb_rgb=24'd460551; //7
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd14474460; //220
	tb_rgb=24'd1381653; //21
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd7237230; //110
	tb_rgb=24'd394758; //6
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd4539717;  //69
	tb_rgb=24'd789516; //12
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd1315860; //20
	tb_rgb=24'd4802889; //73
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd13816530; //210
	tb_rgb=24'd7171437; //109
	@(posedge tb_clk);
	//@(posedge tb_clk);
	//tb_rgb = 24'd3552822; //54
	tb_rgb=24'd3289650; //50
	@(posedge tb_clk);
	tb_rgb=24'd2434341; //37
end

endmodule 