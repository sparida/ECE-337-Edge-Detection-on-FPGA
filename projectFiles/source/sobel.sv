// $Id: $
// File name:   sobel.sv
// Created:     4/17/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This module takes in input matrix of six pixels and returns the sobel magnitude of the center pixel.

module sobel( 
input wire clk,
input wire n_rst,
input wire [71:0] data,
//output wire [31:0] out
output wire [7:0] out
);
reg [7:0] p1,p2,p3,p4,p5,p6,p7,p8,p9,outTemp;

assign p1=data[71:64];
assign p2=data[63:56];
assign p3=data[55:48];
assign p4=data[47:40];
assign p5=data[39:32]; //will not use this one since both x and y mult is by 0
assign p6=data[31:24];
assign p7=data[23:16];
assign p8=data[15:8];
assign p9=data[7:0];
				

wire signed [10:0] gX,gY;   
			 
wire signed [10:0] absGX,absGY;	
wire [10:0] sum;			

assign gX=((p3-p1)+((p6-p4)*2)+(p9-p7));  //element by element multiplication with constant matrix and summing all
assign gY=((p1-p7)+((p2-p8)*2)+(p3-p9));

assign absGX = (gX[10]? ~gX+1 : gX);	 //if msb is 1->number is negative so take inverse and add 1, else keep same number
assign absGY = (gY[10]? ~gY+1 : gY);	

assign sum = (absGX+absGY);		//approx of abs(G)		
assign outTemp = (sum[10]|sum[9]|sum[8])?8'd255 : sum[7:0];  //make sure max is 255	


/*always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		outTemp<='0;
	end
	else
	begin
		outTemp <= (sum[10]|sum[9]|sum[8])?8'd255 : sum[7:0];  //make sure max is 255
	end
end*/

assign out=outTemp;//{24'd0,outTemp};//{8'd0,outTemp,outTemp,outTemp};
endmodule
