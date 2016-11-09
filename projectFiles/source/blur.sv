// $Id: $
// File name:   blur.sv
// Created:     4/16/2016
// Author:      Pradeep Kumar Lam
// Lab Section: 337-03
// Version:     1.0  Initial Design Entry
// Description: This module takes in input of a 5x5 matrix and returns the averaged middle pixel value.

module blur
(
	input logic [199:0] gray,
	output logic [7:0] blurred
);

logic [15:0] x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25;
logic [15:0] averaged;

always_comb
begin
	x1 = 0 * gray[199:192];
	x2 = 3 * gray[191:184];
	x3 = 6 * gray[183:176];
	x4 = 3 * gray[175:168];
	x5 = 0 * gray[167:160];
	x6 = 3 * gray[159:152];
	x7 = 14 * gray[151:144];
	x8 = 24 * gray[143:136];
	x9 = 14 * gray[135:128];
	x10 = 3 * gray[127:120];
	x11 = 6 * gray[119:112];
	x12 = 24 * gray[111:104];
	x13 = 38 * gray[103:96];
	x14 = 24 * gray[95:88];
	x15 = 6 * gray[87:80];
	x16 = 3 * gray[79:72];
	x17 = 14 * gray[71:64];
	x18 = 24 * gray[63:56];
	x19 = 14 * gray[55:48];
	x20 = 3 * gray[47:40];
	x21 = 0 * gray[39:32];
	x22 = 3 * gray[31:24];
	x23 = 6 * gray[23:16];
	x24 = 3 * gray[15:8];
	x25 = 0 * gray[7:0];
end

assign averaged = x1 + x2 + x3 + x4 + x5 + x6 + x9 + x10 + x11 + x12 + x13 + x14 + x15 + x16 + x17 + x18 + x19 + x20 + x21 + x22 + x23 + x24 + x25;

assign blurred = averaged[15:8];

endmodule

