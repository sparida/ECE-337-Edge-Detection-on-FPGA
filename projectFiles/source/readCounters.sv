// $Id: $
// File name:   readCounters.sv
// Created:     4/25/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is for the readCounters.

module readCounters
(
	input logic clk,
	input logic n_rst,
	input logic executeRead, 
	output logic [1:0] rowCount,
	output logic [9:0] colCount,
	output logic [8:0] offsetCount,
	output logic cols_rollover_flag
);

//Internal Variables for flex_counter
logic rows_rollover_flag;
logic cols_rollover_flag_Temp,cols_rollover_flag_Temp2,cols_rollover_flag_Temp3;
logic offset_rollover_flag;

flex_counter2 #(2) ROWS(.clk(clk), .n_rst(n_rst), .count_enable(executeRead), .clear(rows_rollover_flag), .rollover_val(2'd3), .count_out(rowCount), .rollover_flag(rows_rollover_flag)); //Goes from 0 to 2
flex_counter2 #(10) COLS(.clk(clk), .n_rst(n_rst), .count_enable(rows_rollover_flag), .clear(cols_rollover_flag_Temp), .rollover_val(10'd640), .count_out(colCount), .rollover_flag(cols_rollover_flag_Temp)); //Goes from 0 to 639 
flex_counter2 #(9) OFFSET(.clk(clk), .n_rst(n_rst), .count_enable(cols_rollover_flag_Temp), .clear(offset_rollover_flag), .rollover_val(9'd478), .count_out(offsetCount), .rollover_flag(offset_rollover_flag)); //Goes from 0 to 477


always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		cols_rollover_flag_Temp2<=0;
	end
	else
	begin
		cols_rollover_flag_Temp2<=cols_rollover_flag_Temp;		
	end
end

always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		cols_rollover_flag_Temp3<=0;
	end
	else
	begin
		cols_rollover_flag_Temp3<=cols_rollover_flag_Temp2;		
	end
end

assign cols_rollover_flag=cols_rollover_flag_Temp3;
endmodule

