module master_example ( 
	CLOCK_50 , 
	SW , 
	KEY, 
	LEDG, 
	LEDR , 
	// DRAM signals
	DRAM_CLK, 
	DRAM_CKE, 
	DRAM_ADDR ,
	
	DRAM_BA ,
	DRAM_CS_N ,
	DRAM_CAS_N , 
	DRAM_RAS_N , 
	DRAM_WE_N, 
	DRAM_DQ ,
	DRAM_DQM ,
	
	// HEX 7 SEG DISPLAY
	HEX0,
	HEX1,
	HEX2,
	HEX3,
	HEX4,
	HEX5,
	HEX6, 
	HEX7,
	// PCIE signals
	PCIE_PERST_N,
	PCIE_REFCLK_P,
	PCIE_RX_P,
	PCIE_TX_P,
	PCIE_WAKE_N,
	FAN_CTRL,

	VGA_B,
	VGA_BLANK_N,
	VGA_CLK,
	VGA_G,
	VGA_HS,
	VGA_R,
	VGA_SYNC_N,
	VGA_VS


);		
	

input logic  CLOCK_50  ;
input logic [17:0] SW ; 
input logic [3:0] KEY ;
output logic [8:0] LEDG; 
output logic [17:0]LEDR;
output logic [6:0] HEX0;
output logic [6:0] HEX1;
output logic [6:0] HEX2;
output logic [6:0] HEX3;
output logic [6:0] HEX4;
output logic [6:0] HEX5;
output logic [6:0] HEX6;
output logic [6:0] HEX7;

output logic [11:0]DRAM_ADDR;
output logic [1:0]DRAM_BA;
output logic DRAM_CAS_N;
output logic DRAM_CKE;
output logic DRAM_CLK;
output logic DRAM_CS_N;
inout	logic  [31:0] DRAM_DQ;
output logic [3:0] DRAM_DQM;
output logic DRAM_RAS_N;
output logic DRAM_WE_N;
 
inout logic FAN_CTRL;

input logic PCIE_PERST_N;
input logic PCIE_REFCLK_P;
input logic PCIE_RX_P;
output logic PCIE_TX_P;
output logic PCIE_WAKE_N;

//VGA
output [7:0] VGA_B;
output		 VGA_BLANK_N;
output		 VGA_CLK;
output [7:0] VGA_G;
output		 VGA_HS;
output [7:0] VGA_R;
output		 VGA_SYNC_N;
output		 VGA_VS;


//parameter ADDRESSWIDTH = 32 ;
parameter ADDRESSWIDTH = 28;
parameter DATAWIDTH = 32;

logic soc_clk;


logic [31:0] display_data;
/* 
pll pll_inst(
	.inclk0( CLOCK_50) ,
	.c1( temp_vga_clk ) ,
	.c0(DRAM_CLK ) ,	
	.c2( soc_clk) );
*/
	
assign FAN_CTRL = 1'b0;
assign PCIE_WAKE_N = 1'b1;

assign soc_clk = CLOCK_50;


assign DRAM_CLK = CLOCK_50;

	
always_ff @(posedge CLOCK_50) begin
	if(!KEY[0]) begin
		LEDG <= 0; 
		LEDR <= 0;
		//reset hex used
	end else if (!KEY[1]) begin
		LEDG <= '1;
	end else if (!KEY[2]) begin
		LEDR <= '1;
	end else begin
	end
end	

//amm_master_qsys amm_master_inst  ( 
 amm_master_qsys_with_pcie amm_master_inst  ( 
 	.clk_clk				(soc_clk),  				  // clk.clk
 	.reset_reset_n				(KEY[0]),                  	          // reset.reset_n
 	.sdram_addr				(DRAM_ADDR),         			  // new_sdram_controller_0_wire.addr
 	.sdram_ba				(DRAM_BA),           			  // ba
 	.sdram_cas_n				(DRAM_CAS_N),        			  // cas_n
 	.sdram_cke				(DRAM_CKE),          			  // cke
 	.sdram_cs_n				(DRAM_CS_N),         			  // cs_n
 	.sdram_dq				(DRAM_DQ),           			  // dq
 	.sdram_dqm				(DRAM_DQM),          			  // dqm
 	.sdram_ras_n				(DRAM_RAS_N),        			  // ras_n
 	.sdram_we_n				(DRAM_WE_N),         			  // we_n 
	.custom_module_conduit_rdwr_cntl	(SW[17]),
	.custom_module_conduit_n_action		(KEY[1]),
	.custom_module_conduit_add_data_sel	(SW[16]),
	.custom_module_conduit_rdwr_address	(SW[15:0]),
	.custom_module_conduit_display_data	(display_data),
 	.pcie_ip_refclk_export           	(PCIE_REFCLK_P),                      // pcie_ip_refclk.export
 	.pcie_ip_pcie_rstn_export        	(PCIE_PERST_N),             	  // pcie_ip_pcie_rstn.export
 	.pcie_ip_rx_in_rx_datain_0       	(PCIE_RX_P),                          // pcie_ip_rx_in.rx_datain_0
 	.pcie_ip_tx_out_tx_dataout_0     	(PCIE_TX_P),                           // pcie_ip_tx_out.tx_dataout_0
 	.video_vga_controller_0_external_interface_CLK   (VGA_CLK),   // video_vga_controller_0_external_interface.CLK
	.video_vga_controller_0_external_interface_HS    (VGA_HS),    //                                          .HS
	.video_vga_controller_0_external_interface_VS    (VGA_VS),    //                                          .VS
	.video_vga_controller_0_external_interface_BLANK (VGA_BLANK_N), //                                          .BLANK
	.video_vga_controller_0_external_interface_SYNC  (VGA_SYNC_N),  //                                          .SYNC
	.video_vga_controller_0_external_interface_R     (VGA_R),     //                                          .R
	.video_vga_controller_0_external_interface_G     (VGA_G),     //                                          .G
	.video_vga_controller_0_external_interface_B     (VGA_B) 
 );
 
 
 
 SEG_HEX hex7(
 	   .iDIG(display_data[31:28]),         
 	   .oHEX_D(HEX7)
            );  
 SEG_HEX hex6(                              
            .iDIG(display_data[27:24]),
            .oHEX_D(HEX6)
            );
 SEG_HEX hex5(                           
            .iDIG(display_data[23:20]),
            .oHEX_D(HEX5)
            );
 SEG_HEX hex4(                              
            .iDIG(display_data[19:16]),
            .oHEX_D(HEX4)
            );
 SEG_HEX hex3(                               
            .iDIG(display_data[15:12]),
            .oHEX_D(HEX3)
            );
 SEG_HEX hex2(                          
            .iDIG(display_data[11:8]), 
            .oHEX_D(HEX2)
            );
 SEG_HEX hex1(                      
            .iDIG(display_data[7:4]),
            .oHEX_D(HEX1)
            );
 SEG_HEX hex0(              
            .iDIG(display_data[3:0]) ,
            .oHEX_D(HEX0)
            );

//NEW binary switch to hex code
//logic [6:0] n_hex0;//next hex0, translation of binary switches to 7 segment decimal

//localparam zerohex  = 7'b1000000;
//localparam onehex   = 7'b1111001;
//localparam twohex   = 7'b0100100;
//localparam threehex = 7'b0110000;
//localparam fourhex  = 7'b0011001;
//localparam fivehex  = 7'b0010010;
//localparam sixhex   = 7'b0000010;
//localparam sevenhex = 7'b1111000;
//localparam eighthex = 7'b0000000;
//localparam ninehex  = 7'b0011000;

//localparam ahex = 7'b0001000;//10
//localparam bhex = 7'b0000011;//11
//localparam chex = 7'b0100111;//12
//localparam dhex = 7'b0100001;//13
//localparam ehex = 7'b0000110;//14
//localparam fhex = 7'b0001110;//15

//assign HEX1[6:0] = chex;

//always_ff @(posedge CLOCK_50) begin
//	if(!KEY[0]) begin
//		HEX0[6:0] <= zerohex;
//		//reset hex used
//	end else begin
//		HEX0[6:0] <= n_hex0;
//	end 
//end	

//always_comb begin

//	case (SW[3:0])
//		4'b0000 : n_hex0 = zerohex;//zero
//		4'b0001 : n_hex0 = onehex; 
//		4'b0010 : n_hex0 = twohex;
//		4'b0011 : n_hex0 = threehex;
//		4'b0100 : n_hex0 = fourhex;
//		4'b0101 : n_hex0 = fivehex;
//		4'b0110 : n_hex0 = sixhex;
//		4'b0111 : n_hex0 = sevenhex;
//		4'b1000 : n_hex0 = eighthex;
//		4'b1001 : n_hex0 = ninehex;
//
//		4'b1010 : n_hex0 = ahex;
//		4'b1011 : n_hex0 = bhex;
//		4'b1100 : n_hex0 = chex;
//		4'b1101 : n_hex0 = dhex;
//		4'b1110 : n_hex0 = ehex;
//		4'b1111 : n_hex0 = fhex;
//
//		default : n_hex0 = zerohex;
//	endcase
//end


endmodule 