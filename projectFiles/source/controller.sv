// $Id: $
// File name:   controller.sv
// Created:     4/19/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This is the controller for the whole project. 

module controller
(
    input wire clk,
    input wire n_rst,
    input wire startSignal,
    input wire startSobel,
    output wire startCalc
);

parameter [1:0] idle=3'b000, calculate=3'b001, add=3'b010, sobel=3'b011;
reg [1:0] state, nxtState;
reg start;

always_comb
begin
    nxtState=state;
    case(state)
        
	idle: begin 
            if(startSignal==1) 
            begin
                nxtState=calculate;
		start=1;
            end
            else
            begin
                nxtState=idle;
		start=0;
            end

        end
        
	calculate: begin
                nxtState=add;
        end
        
	add: begin
		if(startSobel==1)
		begin
			nxtState=sobel;
		end
		else
		begin
            		nxtState=calculate;
		end

        end
	sobel: begin
                nxtState=idle;
        end
        
    endcase   

end

always @(posedge clk, negedge n_rst)
begin
    if(n_rst == 0)
    begin
        state<=idle;
    end
    else
    begin
        state<=nxtState;
    end
end


//assign startCalc = (state==calculate) | (state==add);
assign startCalc=start;




endmodule 
