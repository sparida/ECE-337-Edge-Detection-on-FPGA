// $Id: $
// File name:   testConcat.sv
// Created:     4/20/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: wrapper for concat


module testConcat(
	input logic clk,
	input logic n_rst,
	input logic count_enable,
  	input logic clear,
	input logic [7:0] pixel,
	output logic [71:0] matrix,
	output logic [7:0] s1,s2,s3,s4,s5,s6,s7,s8,s9

);
reg rollover_flag;
reg [3:0] rollover_val, count_out;

assign rollover_val = 4'b1010;


flex_counter FC(

.clk(clk),
.n_rst(n_rst),
.clear(clear),
.count_enable(count_enable),
.rollover_val(rollover_val),
.count_out(count_out),
.rollover_flag(rollover_flag)

);

concat CT(

.clk(clk),
.n_rst(n_rst),
.pixel(pixel),
.count(count_out),
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

endmodule 