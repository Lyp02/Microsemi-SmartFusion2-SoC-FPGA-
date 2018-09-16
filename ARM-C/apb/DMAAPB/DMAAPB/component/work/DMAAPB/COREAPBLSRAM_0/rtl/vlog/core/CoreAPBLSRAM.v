// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  CoreAPBLSRAM
//               Provides APB interface to embedded Large/micro SRAM.
//
//
// Revision Information:
// Date     Description
//
// SVN Revision Information:
// SVN $Revision: 4805 $
// SVN $Date: 2008-11-27 17:48:48 +0530 (Thu, 27 Nov 2008) $
//
// Resolved SARs
// SAR      Date     Who   Description
//
// Notes:
//
// ********************************************************************/

`timescale 1ns/100ps

module DMAAPB_COREAPBLSRAM_0_COREAPBLSRAM (
    //inputs
    PCLK,
    PRESETN,
    PSEL,
    PENABLE,
    PWRITE,
    PADDR,
    PWDATA,
    //outputs
    PRDATA,
    PSLVERR,
    PREADY
);

    //----------------------------------------------------------------------
    // Parameters
    //----------------------------------------------------------------------

    parameter FAMILY = 19;
    parameter APB_DWIDTH = 32;
    parameter SEL_SRAM_TYPE = 1;
    parameter USRAM_NUM_LOCATIONS_DWIDTH = 64;
    //parameter USRAM_NUM_LOCATIONS_DWIDTH16 = 64;
    //parameter USRAM_NUM_LOCATIONS_DWIDTH08 = 128;
    parameter LSRAM_NUM_LOCATIONS_DWIDTH = 512;
   // parameter LSRAM_NUM_LOCATIONS_DWIDTH16 = 1024;
   // parameter LSRAM_NUM_LOCATIONS_DWIDTH08 = 2048;

    // ADDR_SCHEME
    // 0 = word aligned
    // 1 = half-word aligned
    // 2 = sequential or byte-aligned
    //localparam ADDR_SCHEME = 0;  
    localparam ADDR_SCHEME = (APB_DWIDTH == 32) ? 0 : ((APB_DWIDTH == 16) ? 1 :  ((APB_DWIDTH == 8) ? 2 : 2));  


    //----------------------------------------------------------------------
    // I/Os
    //----------------------------------------------------------------------
    // inputs
    input                       PCLK;
    input                       PRESETN;
    input                       PSEL;
    input                       PENABLE;
    input                       PWRITE;
    input   [19:0]              PADDR;
    input   [APB_DWIDTH-1:0]    PWDATA;
    // outputs
    output  [APB_DWIDTH-1:0]    PRDATA;
    output                      PSLVERR;    // APB3 sig
    output                      PREADY;     // APB3 sig

    //----------------------------------------------------------------------
    // Internal Signals
    //----------------------------------------------------------------------
   reg [APB_DWIDTH-1:0]         PRDATA;
   reg [17:0]                   addr;
   reg [APB_DWIDTH-1:0]         PRDATA_reg;
   reg                          PREADY_reg;

   wire                         wen;
   wire                         ren;
   wire                         lsram_512_BUSY_all;
   wire                         lsram_512to46k_BUSY_all;
   wire                         lsram_1k_BUSY_all;
   wire                         lsram_2k_BUSY_all;
   wire                         lsram_BUSY_all;

   wire                         usram_2K_BUSY_all;
   wire                         usram_3K_BUSY_all;
   wire                         usram_4K_BUSY_all;
   wire                         usram_9K_BUSY_all;
   wire                         usram_BUSY_all;
   wire                         mem_BUSY_all;

   wire [APB_DWIDTH-1:0]        lsram_width32_PRDATA;
   wire [APB_DWIDTH-1:0]        lsram_width24_PRDATA;
   wire [APB_DWIDTH-1:0]        lsram_width16_PRDATA;
   wire [APB_DWIDTH-1:0]        lsram_width08_PRDATA;

   wire [APB_DWIDTH-1:0]        usram_width32_PRDATA;
   wire [APB_DWIDTH-1:0]        usram_width24_PRDATA;
   wire [APB_DWIDTH-1:0]        usram_width16_PRDATA;
   wire [APB_DWIDTH-1:0]        usram_width08_PRDATA;

    //----------------------------------------------------------------------
    // Main body of code
    //----------------------------------------------------------------------

    //----------------------------------------------------------------------
    // BUSY signal used to block the User transactions so that SII interface 
    // can proceed with using the memory
    // The APB transactions are exited properly before the SII interface can
    // access the SRAMs
    //----------------------------------------------------------------------

    assign lsram_BUSY_all = (APB_DWIDTH == 32)  ? lsram_512_BUSY_all : 
                            (APB_DWIDTH == 24 ) ? lsram_512to46k_BUSY_all : 
			    (APB_DWIDTH == 16 ) ? lsram_1k_BUSY_all : lsram_2k_BUSY_all;
    assign usram_BUSY_all = (APB_DWIDTH == 32)  ? usram_2K_BUSY_all : 
	                    (APB_DWIDTH == 24 ) ? usram_3K_BUSY_all : 
			    (APB_DWIDTH == 16 ) ? usram_4K_BUSY_all : usram_9K_BUSY_all;

    assign mem_BUSY_all = SEL_SRAM_TYPE ? usram_BUSY_all : lsram_BUSY_all;
   
    //----------------------------------------------------------------------
    // APB 3 signals
    //----------------------------------------------------------------------
    //    assign PREADY = 1'b1 & ~mem_BUSY_all;

    assign PREADY = 1'b1; //PREADY_reg; // SAR#38264

    
    assign PSLVERR = 1'b0;
   
    //----------------------------------------------------------------------
    // Create read and write enable signals using APB control signals
    //----------------------------------------------------------------------
    assign wen = PWRITE && PENABLE && PSEL;
    assign ren = ~PWRITE && ~PENABLE && PSEL;

            always @(*)
            begin
                case (ADDR_SCHEME)
                    0:  begin
                        addr = PADDR[19:2];  // v2.1  - Word
                        end
                    1:  begin
                        addr = PADDR[18:1];  // v2.1  - Halfword
                        end
                    2:  begin
                        addr = PADDR[17:0];  // v2.1 - Byte
                        end
                    default: begin
                        addr = PADDR[17:0];
                        end
                endcase
            end

    //----------------------------------------------------------------------
    // Instances
    //----------------------------------------------------------------------
    generate 
      if(SEL_SRAM_TYPE == 1'b0) begin


        if (APB_DWIDTH == 32) begin


            DMAAPB_COREAPBLSRAM_0_lsram_512to35328x32 #(
                .DEPTH      (LSRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            lsram_512to35328x32_block0(
                .writeData  (PWDATA),
                .readData   (lsram_width32_PRDATA),
                .wen        (wen),
                .ren        (ren),
                .writeAddr  (addr),
                .readAddr   (addr),
                .clk        (PCLK),
                .resetn     (PRESETN),
                .lsram_512_BUSY_all (lsram_512_BUSY_all)
            );
        end
        else if (APB_DWIDTH == 16) begin
 

            DMAAPB_COREAPBLSRAM_0_lsram_1024to70656x16 #(
                .DEPTH      (LSRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            lsram_1024to70656x16_block0(
                .writeData  (PWDATA),
                .readData   (lsram_width16_PRDATA),
                .wen        (wen),
                .ren        (ren),
                .writeAddr  (addr),
                .readAddr   (addr),
                .clk        (PCLK),
                .resetn     (PRESETN),
                .lsram_1k_BUSY_all (lsram_1k_BUSY_all)
            );
        end else if (APB_DWIDTH == 8) begin


            DMAAPB_COREAPBLSRAM_0_lsram_2048to141312x8 #(
                .DEPTH      (LSRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            lsram_2048to141312x8_block0(
                .writeData  (PWDATA),
                .readData   (lsram_width08_PRDATA),
                .wen        (wen),
                .ren        (ren),
                .writeAddr  (addr),
                .readAddr   (addr),
                .clk        (PCLK),
                .resetn     (PRESETN),
                .lsram_2k_BUSY_all (lsram_2k_BUSY_all)
            );
        end
      end // if (SEL_SRAM_TYPE == 1'b0)
      else begin

         
        if (APB_DWIDTH == 32) begin
            DMAAPB_COREAPBLSRAM_0_usram_64to2304x32 #(
                .USRAM_NUM_LOCATIONS_DWIDTH32     (USRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            usram_64to2304x32_block0(
                               .writeData  (PWDATA),
                               .readData   (usram_width32_PRDATA),
                               .wen        (wen),
                               .ren        (ren),
                               .writeAddr  (addr),
                               .readAddr   (addr),
                               .clk        (PCLK),
                               .resetn     (PRESETN),
                               .u_2K_BUSY_all (usram_2K_BUSY_all)
                               );
        end
        else if (APB_DWIDTH == 16) begin

            DMAAPB_COREAPBLSRAM_0_usram_64to4608x16 #(
                .USRAM_NUM_LOCATIONS_DWIDTH16 (USRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            usram_64to4608x16_block0(
                               .writeData  (PWDATA),
                               .readData   (usram_width16_PRDATA),
                               .wen        (wen),
                               .ren        (ren),
                               .writeAddr  (addr),
                               .readAddr   (addr),
                               .clk        (PCLK),
                               .resetn     (PRESETN),
                               .u_4K_BUSY_all (usram_4K_BUSY_all)
                               );

        end else if (APB_DWIDTH == 8) begin


            DMAAPB_COREAPBLSRAM_0_usram_128to9216x8 #(
                .USRAM_NUM_LOCATIONS_DWIDTH08 (USRAM_NUM_LOCATIONS_DWIDTH),
                .APB_DWIDTH (APB_DWIDTH)
            )
            usram_128to9216x8_block0(
                               .writeData  (PWDATA),
                               .readData   (usram_width08_PRDATA),
                               .wen        (wen),
                               .ren        (ren),
                               .writeAddr  (addr),
                               .readAddr   (addr),
                               .clk        (PCLK),
                               .resetn     (PRESETN),
                               .u_9K_BUSY_all (usram_9K_BUSY_all)
                               );
        end


      end // else: !if(SEL_SRAM_TYPE == 1'b0)
    endgenerate

    //----------------------------------------------------------------------
    // PRDATA generation logic for LSRAM and uSRAM
    // SAR #38624
    //----------------------------------------------------------------------

    always @(*) begin
       if(PSEL == 1'b1 && PWRITE == 1'b0 && PENABLE == 1'b1) begin
          if(SEL_SRAM_TYPE == 1'b0) begin
             case (APB_DWIDTH)
               32 : begin
                  PRDATA = lsram_width32_PRDATA;                 
               end
               16 : begin
                  PRDATA = lsram_width16_PRDATA;                 
               end
               8 : begin
                  PRDATA = lsram_width08_PRDATA;                 
               end
               default : begin
                  PRDATA = {APB_DWIDTH{1'b0}};
               end
             endcase // case (APB_DWIDTH)
          end // if (SEL_SRAM_TYPE == 1'b0)
          else begin
             case (APB_DWIDTH)
               32 : begin
                  PRDATA = usram_width32_PRDATA;                 
               end
               16 : begin
                  PRDATA = usram_width16_PRDATA;                 
               end
               8 : begin
                  PRDATA = usram_width08_PRDATA;                 
               end
               default : begin
                  PRDATA = {APB_DWIDTH{1'b0}};
               end
             endcase // case (APB_DWIDTH)
          end
       end // if (PSEL == 1'b1 && PWRITE == 1'b0 && PENABLE == 1'b1)
       else begin
          PRDATA = PRDATA_reg;
       end
 end // always @ (posedge PCLK or negedge PRESETN)

    //----------------------------------------------------------------------
    // Registered PRDATA
    //----------------------------------------------------------------------
  always @(posedge PCLK or negedge PRESETN) begin   // SAR#38264
    if(PRESETN == 1'b0) begin
       PRDATA_reg <= {APB_DWIDTH{1'b0}};
    end
    else begin
       PRDATA_reg <= PRDATA;
    end
  end

endmodule


    //----------------------------------------------------------------------
    //                         End-of-file
    //----------------------------------------------------------------------
