// $Id: $
// File name:   readController.sv
// Created:     4/24/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is what controls the reading of data from the fpga.

module readController
(	
 	input logic clk,	
	input logic n_rst, 
	input logic [1:0] rowCount,
	input logic [9:0] colCount,
	input logic [8:0] offsetCount,
	input logic startSobel,
	//input logic dataRead,	//Output from FPGA
	input logic executeRead, //From State Machine
	
	output logic [31:0] readAddress,	//Calculated Based on rowCount colCount & offsetCount
	output logic [3:0] numPixToLoad	//Should be Number 3 or 9 	
	//output logic readEnable			//Should Hold 	
);

//Temp Variables
//logic temp_readEnable;
logic [3:0] temp_numPixToLoad,temp2_numPixToLoad;
logic [31:0] temp_readAddress;

//Set Variables
//logic set_readEnable;
logic [3:0] set_numPixToLoad;
logic [31:0] set_readAddress;

always_comb
begin
	//temp_readEnable = set_readEnable;
	temp_readAddress = set_readAddress;
	temp_numPixToLoad = 4'b1001;
	
	if(colCount > 2'd2)// && startSobel)
	begin 
	  temp_numPixToLoad = 4'b0011; 
	end
	
	/*if(dataRead == 1'b1 & set_readEnable == 1'b1)
	begin
		temp_readEnable = 1'b0;	
	end*/
	if(executeRead == 1'b1)
	begin
		//temp_readEnable = 1'b1;
		temp_readAddress = ((rowCount + offsetCount)*640 + colCount) * 32;
	end 

end


always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		set_readAddress <= 32'b0;
		//set_readEnable <= 1'b0;
		temp2_numPixToLoad <= 4'b1001;  	
	end
	else
	begin
		set_readAddress <= temp_readAddress;
		//set_readEnable <= temp_readEnable;
		temp2_numPixToLoad <= temp_numPixToLoad;
	end
end

always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		//set_readAddress <= 32'b0;
		//set_readEnable <= 1'b0;
		set_numPixToLoad <= 4'b1001;  	
	end
	else
	begin
		//set_readAddress <= temp_readAddress;
		//set_readEnable <= temp_readEnable;
		set_numPixToLoad <= temp2_numPixToLoad;
	end
end

assign readAddress = set_readAddress;
//assign readEnable = set_readEnable;
assign numPixToLoad = set_numPixToLoad;

endmodule



