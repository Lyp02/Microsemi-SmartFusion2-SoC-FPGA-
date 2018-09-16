`timescale 1ns/1ns

module APBSlaveLED(

	// APB Slave Interface
	input	[31:0]	PADDR,
	input			PSEL,
	input			PENABLE,
	input			PWRITE,
	output	[31:0]	PRDATA,
	input	[31:0]	PWDATA,
	output			PREADY,
//	output			PSLVERRS,
	
	// 
	input			clk_i,
	input			rst_n_i,
	input			key_i,
	output	reg		led0_o,
	output	reg		led1_o
	
);

	assign		PREADY = 1'b1;

	//??MSS????
	reg	[31:0]	DataFromMSS_r;
	reg	[31:0]	AddrFromMSS_r;

	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			DataFromMSS_r <= 32'd0;
		end 
		else if(PWRITE & PSEL & PENABLE)begin			// ???
			AddrFromMSS_r <= PADDR;
			DataFromMSS_r <= PWDATA;			
		end	
		
	end 

	//?MSS????????LED????
	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			led0_o <= 0;
			led1_o <= 0;
		end 
		else begin
			case(AddrFromMSS_r)
				32'h3000_0000:  	led0_o <= DataFromMSS_r[0];
				32'h3000_0004: 		led1_o <= DataFromMSS_r[0];
				default: begin
					led0_o <= led0_o;
					led1_o <= led1_o;
				end 
			endcase	
		end 
	end 
	
	

	//??MSS???? ?KEY??????MSS
	reg	[31:0]	DataFromFabricToMSS_r;	
	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			DataFromFabricToMSS_r <= 32'd0;
		end
		else if(!PWRITE & PSEL) begin
			case(PADDR)
				32'h3000_0008:		DataFromFabricToMSS_r <= {31'd0, key_i};				// ??????????0
				default: 			DataFromFabricToMSS_r <= DataFromFabricToMSS_r;			
			endcase 
		end 
		else
			DataFromFabricToMSS_r <= DataFromFabricToMSS_r;				
	end
	
	assign	PRDATA = DataFromFabricToMSS_r;
			
			
			
						
endmodule