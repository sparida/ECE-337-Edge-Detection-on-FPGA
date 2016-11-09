// $Id: $
// File name:   concat.sv
// Created:     4/20/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: concatenate 9 bytes


module concat(

input logic clk,
input logic n_rst,
input logic [7:0] pixel,
input logic [3:0] count,
output logic [71:0] matrix
//output logic [7:0] s1,s2,s3,s4,s5,s6,s7,s8,s9

);
//reg [8:0][7:0] hold;
reg [7:0] t1,t2,t3,t4,t5,t6,t7,t8,t9,m1,m2,m3,m4,m5,m6,m7,m8,m9;
always_comb
begin
	
	if(count==4'd0)
	begin
		t1='0;
		t2='0;
		t3='0;
		t4='0;
		t5='0;
		t6='0;
		t7='0;
		t8='0;
		t9='0;
		
	end
	if(count==4'd1)
	begin
		t1=pixel;
		
	end
	if(count==4'd2)
	begin
		t2=pixel;		
	end
	if(count==4'd3)
	begin
		t3=pixel;
	end
	if(count==4'd4)
	begin
		t4=pixel;
	end
	if(count==4'd5)
	begin
		t5=pixel;
	end
	if(count==4'd6)
	begin
		t6=pixel;
	end
	if(count==4'd7)
	begin
		t7=pixel;
	end
	if(count==4'd8)
	begin
		t8=pixel;
	end
	if(count==4'd9)
	begin
		t9=pixel;
	end
	


end

always_ff@(posedge clk, negedge n_rst)
begin
	if(n_rst == 0)
	begin
		/*hold[0] <= '0;  
		hold[1] <= '0;
		hold[2] <= '0;
		hold[3] <= '0;
		hold[4] <= '0;
		hold[5] <= '0;
		hold[6] <= '0;
		hold[7] <= '0;
		hold[8] <= '0;*/
		m1<='0;
		m2<='0;
		m3<='0;
		m4<='0;
		m5<='0;
		m6<='0;
		m7<='0;
		m8<='0;
		m9<='0;    

		
	end
	else
	begin
		//hold[count-1][7:0]<=pixel;
		m1<=t1;
		m2<=t2;
		m3<=t3;
		m4<=t4;
		m5<=t5;
		m6<=t6;
		m7<=t7;
		m8<=t8;
		m9<=t9;
		
	end
end

//assign matrix={hold[8][7:0],hold[7][7:0],hold[6][7:0],hold[5][7:0],hold[4][7:0],hold[3][7:0],hold[2][7:0],hold[1][7:0],hold[0][7:0]};
/*assign s1=m1;
assign s2=m2;
assign s3=m3;
assign s4=m4;
assign s5=m5;
assign s6=m6;
assign s7=m7;
assign s8=m8;
assign s9=m9;
assign matrix={s1,s2,s3,s4,s5,s6,s7,s8,s9};*/
assign matrix={m1,m2,m3,m4,m5,m6,m7,m8,m9};
endmodule 