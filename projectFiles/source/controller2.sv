// $Id: $
// File name:   controller2.sv
// Created:     4/26/2016
// Author:      Kareem El Azhary
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: controller for second main


module controller2
(
	input wire clk,
	input wire n_rst,
	input wire [31:0] startSignal,
	input wire [31:0] readDone,
	input wire [31:0] rwError,
	input wire [3:0] countVal,
	input wire [3:0] countOut,
 	input wire [31:0] signalToAssertWriteEnable,
	input wire [31:0] writeDone,
	output wire executeRead,
	output wire [31:0] readEnable,
	output wire [31:0] outputError,
	output wire grayReady,
	output wire grayReady2,
	output wire writeEnable,
	output wire [31:0] realOutputEnable
  
);

parameter [2:0] idle=3'b000, generateAddress=3'b001, waitForData=3'b010, storeGray=3'b011, error=3'b100, writing=3'b101;
reg [2:0] state, nxtState;
reg start,assertWrite,assertWriteTemp;

always_comb
begin
    nxtState=state;
	assertWrite=0;
	start=0;
    case(state)
	
        
	idle: begin
		if(startSignal[0]==1)
		begin
			nxtState=generateAddress;
		end
		else
		begin
			nxtState=idle;
		end
	end 
	generateAddress: begin
		//assert executeRead
		nxtState=waitForData;
	end
	waitForData: begin
		//de-assert executeRead, should have address, assign it and enable readEnable and wait until readDone
		if(readDone[0]==1 && rwError[0]==0)
		begin
			start=1;
			nxtState=storeGray;
		end
		else if (rwError[0]==1)
		begin
			nxtState=error;
			//start=0;
		end
		else
		begin
			nxtState=waitForData;
			///start=0;
		end
	end
	storeGray: begin
		//grayPixel ready
		//if(startSobel==1)
			//go to sobel
		//nxtState=storeGray;
		if(countVal==9 && countOut==9)
		begin
			assertWrite=1'b1;
			nxtState=writing;
		end
		else if (countVal==3 && countOut==3)
		begin
			assertWrite=1'b1;
			nxtState=writing;
		end
		

		/*if(signalToAssertWriteEnable==32'd1)
		begin
			
		end
		*/else
		begin
			nxtState=generateAddress; //might have to put below or in two different else statements
		end
		
	end
	writing: begin
		if(writeDone[0]==1)
		begin
			nxtState=generateAddress;
		end
		else
		begin
			nxtState=writing;
		end
	end
	error: begin
		nxtState=error;
	end
	
	
    endcase   

end

always @(posedge clk, negedge n_rst)
begin
    if(n_rst == 0)
    begin
        state<=idle;
	assertWriteTemp=0;
    end
    else
    begin
        state<=nxtState;
	assertWriteTemp=assertWrite;
    end
end



assign executeRead=(state==generateAddress);
assign readEnable=(state==waitForData);
assign outputError=(state==error);

//assign grayReady=(state==storeGray);
assign grayReady= start ? 1 : 0;
assign grayReady2=(state==storeGray);
assign writeEnable= assertWriteTemp ? 1 : 0;
assign realOutputEnable= (state==writing);
endmodule 