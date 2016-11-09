// $Id: $
// File name:   captureOutput2.sv
// Created:     4/27/2016
// Author:      Kareem El Azhary
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: hold sobel output until they write it


module captureOutput2(
	input wire clk,
	input wire n_rst,
	input wire holdIt,
	input wire [7:0] sobelValue,
	output wire [31:0] out,
	output wire useIt,
	//output wire [18:0] outOffset,
	output wire [31:0] read,
	output wire [31:0] write

);

reg [7:0] temp,temp2,temp3;
reg useItTemp,useItTemp2;
//reg [18:0]pixelNum,pixelNum2;
reg [31:0] readTemp,writeTemp;
reg rstTemp;

always_comb
begin
	if (holdIt==1)
	begin
		temp=sobelValue;
		useItTemp=1;
		
	end
	else
	begin
		temp='0;
		useItTemp=0;
		
	end

end


always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		temp2 <= '0;
		useItTemp2<=0;
		//pixelNum2<=0;
	  
		
	end
	else
	begin
		temp2 <= temp;
		useItTemp2<=useItTemp;
		//pixelNum2<=outOffset+(useIt==1);
		
	end
end

always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		temp2 <= '0;
		useItTemp2<=0;
		//pixelNum2<=0;
	  
		
	end
	else
	begin
		temp2 <= temp;
		temp3<=out;
		useItTemp2<=useItTemp;
		//pixelNum2<=outOffset+(useIt==1);
		
	end
end


assign out= {24'd0, holdIt ? temp : temp3};
assign useIt=holdIt;
//assign outOffset=pixelNum2;
//assign outOffset= n_rst ? outOffset+(useIt==1) : 19'd0;
assign read=!useIt;
assign write=useIt;
endmodule 