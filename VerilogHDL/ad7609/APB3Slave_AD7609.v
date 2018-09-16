//value1--3000_0000 
//value2--3000_0004
//value3--3000_0008
//value4--3000_000c
//value5--3000_0010
//value6--3000_0014
//value7--3000_0018
//value8--3000_001c
//Start---3000_0100

`timescale 1ns/1ns

module APBSlave_AD7609(

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
    input  [15:0]  value1,
    input  [15:0]  value2,
    input  [15:0]  value3,
    input  [15:0]  value4,
    input  [15:0]  value5,
    input  [15:0]  value6,
    input  [15:0]  value7,
    input  [15:0]  value8,
    input          clk_i,
    input          rst_n_i,
    output  reg    Start
	
);

	assign		PREADY = 1'b1;

	//??MSS????
	reg	[31:0]	DataFromMSS_r;
	reg	[31:0]	AddrFromMSS_r;
    


	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			DataFromMSS_r <= 31'd0;
		end 
		else if(PWRITE & PSEL & PENABLE)begin			// ???
			AddrFromMSS_r <= PADDR;
			DataFromMSS_r <= PWDATA;		
		end	
		
	end 

	//raed data from mss
	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			Start <= 0;
		end 
		else begin
			case(AddrFromMSS_r)
				32'h3000_0100:  	Start<= DataFromMSS_r[0];
				default: begin
					Start <= Start;
				end 
			endcase	
		end 
	end 
	
	

	//write data to msss
	reg	[31:0]	DataFromFabricToMSS_r;	
	always @ (posedge clk_i or negedge rst_n_i)
	begin
		if(!rst_n_i) begin
			DataFromFabricToMSS_r <= 31'd0;
		end
		else if(!PWRITE & PSEL) begin
			case(PADDR)
				32'h3000_0000:		DataFromFabricToMSS_r <=value1 ;
				32'h3000_0004:		DataFromFabricToMSS_r <=value2 ;
				32'h3000_0008:		DataFromFabricToMSS_r <=value3 ;
				32'h3000_000c:		DataFromFabricToMSS_r <=value4 ;
				32'h3000_0010:		DataFromFabricToMSS_r <=value5 ;
				32'h3000_0014:		DataFromFabricToMSS_r <=value6 ;
				32'h3000_0018:		DataFromFabricToMSS_r <=value7 ;
				32'h3000_001c:		DataFromFabricToMSS_r <=value8 ;				
				default: 			DataFromFabricToMSS_r <= 32'd9999;			
			endcase 
		end 
		else
			DataFromFabricToMSS_r <= DataFromFabricToMSS_r;				
	end
	
	assign	PRDATA = DataFromFabricToMSS_r;
			
			
			
						
endmodule
/************************************????*************************************************************/