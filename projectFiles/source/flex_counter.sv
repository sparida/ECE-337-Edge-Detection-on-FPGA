// $Id: $
// File name:   flex_counter.sv
// Created:     2/3/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is a flex counter.

`timescale 1ns / 10ps

module flex_counter
#(
	parameter NUM_CNT_BITS = 4
)
(
	input wire clk,
	input wire n_rst,
	input wire clear,
	input wire count_enable,
	input wire colsFlag,
	input wire [NUM_CNT_BITS-1:0] rollover_val,
	output reg [NUM_CNT_BITS-1:0] count_out,
	output reg rollover_flag
);

// To be Modified in always_com Block
reg [NUM_CNT_BITS-1:0] count_out_storage;
reg rollover_flag_storage;

always_comb
begin
	count_out_storage = count_out;
	rollover_flag_storage = rollover_flag;
	if(clear == 1)
	begin
		count_out_storage = 0;
		rollover_flag_storage = 0;
	end
	else
	begin	
		if(count_enable == 1)
		begin
			count_out_storage = count_out + 1;
			rollover_flag_storage = 0;
			if((rollover_val < count_out_storage))// || (colsFlag==1'b1))
			begin
				count_out_storage = 1;
			end
			if(rollover_val == count_out_storage)
			begin
				rollover_flag_storage = 1;
			end
		end
	end
	
end


always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		count_out <= '0;  
		rollover_flag <= 1'b0;
	end
	else
	begin
		count_out <= count_out_storage;
		rollover_flag <= rollover_flag_storage;
	end
end

endmodule
