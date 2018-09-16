//////////////////////////////////////////////////////////////////////
// Created by SmartDesign Sun Jun 10 08:46:53 2018
// Version: v11.8 SP2 11.8.2.4
//////////////////////////////////////////////////////////////////////

`timescale 1ns / 100ps

// DMAAPB
module DMAAPB(
    // Inputs
    DEVRST_N,
    // Outputs
    GPIO_0_M2F
);

//--------------------------------------------------------------------
// Input
//--------------------------------------------------------------------
input  DEVRST_N;
//--------------------------------------------------------------------
// Output
//--------------------------------------------------------------------
output GPIO_0_M2F;
//--------------------------------------------------------------------
// Nets
//--------------------------------------------------------------------
wire          CoreAPB3_0_APBmslave3_PENABLE;
wire          CoreAPB3_0_APBmslave3_PREADY;
wire          CoreAPB3_0_APBmslave3_PSELx;
wire          CoreAPB3_0_APBmslave3_PSLVERR;
wire          CoreAPB3_0_APBmslave3_PWRITE;
wire          DEVRST_N;
wire   [31:0] DMAAPB_MSS_0_FIC_0_APB_MASTER_PADDR;
wire          DMAAPB_MSS_0_FIC_0_APB_MASTER_PENABLE;
wire   [31:0] DMAAPB_MSS_0_FIC_0_APB_MASTER_PRDATA;
wire          DMAAPB_MSS_0_FIC_0_APB_MASTER_PREADY;
wire          DMAAPB_MSS_0_FIC_0_APB_MASTER_PSELx;
wire          DMAAPB_MSS_0_FIC_0_APB_MASTER_PSLVERR;
wire   [31:0] DMAAPB_MSS_0_FIC_0_APB_MASTER_PWDATA;
wire          DMAAPB_MSS_0_FIC_0_APB_MASTER_PWRITE;
wire          FCCC_0_GL0;
wire          FCCC_0_LOCK;
wire          GPIO_0_M2F_net_0;
wire          OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC;
wire          SYSRESET_0_POWER_ON_RESET_N;
wire          GPIO_0_M2F_net_1;
//--------------------------------------------------------------------
// TiedOff Nets
//--------------------------------------------------------------------
wire   [1:0]  DMA_DMAREADY_FIC_0_const_net_0;
wire          GND_net;
wire          VCC_net;
wire   [31:0] IADDR_const_net_0;
wire   [7:2]  PADDR_const_net_0;
wire   [7:0]  PWDATA_const_net_0;
wire   [31:0] PRDATAS0_const_net_0;
wire   [31:0] PRDATAS1_const_net_0;
wire   [31:0] PRDATAS2_const_net_0;
wire   [31:0] PRDATAS4_const_net_0;
wire   [31:0] PRDATAS5_const_net_0;
wire   [31:0] PRDATAS6_const_net_0;
wire   [31:0] PRDATAS7_const_net_0;
wire   [31:0] PRDATAS8_const_net_0;
wire   [31:0] PRDATAS9_const_net_0;
wire   [31:0] PRDATAS10_const_net_0;
wire   [31:0] PRDATAS11_const_net_0;
wire   [31:0] PRDATAS12_const_net_0;
wire   [31:0] PRDATAS13_const_net_0;
wire   [31:0] PRDATAS14_const_net_0;
wire   [31:0] PRDATAS15_const_net_0;
wire   [31:0] PRDATAS16_const_net_0;
//--------------------------------------------------------------------
// Bus Interface Nets Declarations - Unequal Pin Widths
//--------------------------------------------------------------------
wire   [19:0] CoreAPB3_0_APBmslave3_PADDR_0_19to0;
wire   [19:0] CoreAPB3_0_APBmslave3_PADDR_0;
wire   [31:0] CoreAPB3_0_APBmslave3_PADDR;
wire   [15:0] CoreAPB3_0_APBmslave3_PRDATA;
wire   [31:16]CoreAPB3_0_APBmslave3_PRDATA_0_31to16;
wire   [15:0] CoreAPB3_0_APBmslave3_PRDATA_0_15to0;
wire   [31:0] CoreAPB3_0_APBmslave3_PRDATA_0;
wire   [15:0] CoreAPB3_0_APBmslave3_PWDATA_0_15to0;
wire   [15:0] CoreAPB3_0_APBmslave3_PWDATA_0;
wire   [31:0] CoreAPB3_0_APBmslave3_PWDATA;
//--------------------------------------------------------------------
// Constant assignments
//--------------------------------------------------------------------
assign DMA_DMAREADY_FIC_0_const_net_0 = 2'h3;
assign GND_net                        = 1'b0;
assign VCC_net                        = 1'b1;
assign IADDR_const_net_0              = 32'h00000000;
assign PADDR_const_net_0              = 6'h00;
assign PWDATA_const_net_0             = 8'h00;
assign PRDATAS0_const_net_0           = 32'h00000000;
assign PRDATAS1_const_net_0           = 32'h00000000;
assign PRDATAS2_const_net_0           = 32'h00000000;
assign PRDATAS4_const_net_0           = 32'h00000000;
assign PRDATAS5_const_net_0           = 32'h00000000;
assign PRDATAS6_const_net_0           = 32'h00000000;
assign PRDATAS7_const_net_0           = 32'h00000000;
assign PRDATAS8_const_net_0           = 32'h00000000;
assign PRDATAS9_const_net_0           = 32'h00000000;
assign PRDATAS10_const_net_0          = 32'h00000000;
assign PRDATAS11_const_net_0          = 32'h00000000;
assign PRDATAS12_const_net_0          = 32'h00000000;
assign PRDATAS13_const_net_0          = 32'h00000000;
assign PRDATAS14_const_net_0          = 32'h00000000;
assign PRDATAS15_const_net_0          = 32'h00000000;
assign PRDATAS16_const_net_0          = 32'h00000000;
//--------------------------------------------------------------------
// Top level output port assignments
//--------------------------------------------------------------------
assign GPIO_0_M2F_net_1 = GPIO_0_M2F_net_0;
assign GPIO_0_M2F       = GPIO_0_M2F_net_1;
//--------------------------------------------------------------------
// Bus Interface Nets Assignments - Unequal Pin Widths
//--------------------------------------------------------------------
assign CoreAPB3_0_APBmslave3_PADDR_0_19to0 = CoreAPB3_0_APBmslave3_PADDR[19:0];
assign CoreAPB3_0_APBmslave3_PADDR_0 = { CoreAPB3_0_APBmslave3_PADDR_0_19to0 };

assign CoreAPB3_0_APBmslave3_PRDATA_0_31to16 = 16'h0;
assign CoreAPB3_0_APBmslave3_PRDATA_0_15to0 = CoreAPB3_0_APBmslave3_PRDATA[15:0];
assign CoreAPB3_0_APBmslave3_PRDATA_0 = { CoreAPB3_0_APBmslave3_PRDATA_0_31to16, CoreAPB3_0_APBmslave3_PRDATA_0_15to0 };

assign CoreAPB3_0_APBmslave3_PWDATA_0_15to0 = CoreAPB3_0_APBmslave3_PWDATA[15:0];
assign CoreAPB3_0_APBmslave3_PWDATA_0 = { CoreAPB3_0_APBmslave3_PWDATA_0_15to0 };

//--------------------------------------------------------------------
// Component instances
//--------------------------------------------------------------------
//--------CoreAPB3   -   Actel:DirectCore:CoreAPB3:4.1.100
CoreAPB3 #( 
        .APB_DWIDTH      ( 16 ),
        .APBSLOT0ENABLE  ( 0 ),
        .APBSLOT1ENABLE  ( 0 ),
        .APBSLOT2ENABLE  ( 0 ),
        .APBSLOT3ENABLE  ( 1 ),
        .APBSLOT4ENABLE  ( 0 ),
        .APBSLOT5ENABLE  ( 0 ),
        .APBSLOT6ENABLE  ( 0 ),
        .APBSLOT7ENABLE  ( 0 ),
        .APBSLOT8ENABLE  ( 0 ),
        .APBSLOT9ENABLE  ( 0 ),
        .APBSLOT10ENABLE ( 0 ),
        .APBSLOT11ENABLE ( 0 ),
        .APBSLOT12ENABLE ( 0 ),
        .APBSLOT13ENABLE ( 0 ),
        .APBSLOT14ENABLE ( 0 ),
        .APBSLOT15ENABLE ( 0 ),
        .FAMILY          ( 19 ),
        .IADDR_OPTION    ( 0 ),
        .MADDR_BITS      ( 28 ),
        .SC_0            ( 0 ),
        .SC_1            ( 0 ),
        .SC_2            ( 0 ),
        .SC_3            ( 0 ),
        .SC_4            ( 0 ),
        .SC_5            ( 0 ),
        .SC_6            ( 0 ),
        .SC_7            ( 0 ),
        .SC_8            ( 0 ),
        .SC_9            ( 0 ),
        .SC_10           ( 0 ),
        .SC_11           ( 0 ),
        .SC_12           ( 0 ),
        .SC_13           ( 0 ),
        .SC_14           ( 0 ),
        .SC_15           ( 0 ),
        .UPR_NIBBLE_POSN ( 6 ) )
CoreAPB3_0(
        // Inputs
        .PRESETN    ( GND_net ), // tied to 1'b0 from definition
        .PCLK       ( GND_net ), // tied to 1'b0 from definition
        .PWRITE     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PWRITE ),
        .PENABLE    ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PENABLE ),
        .PSEL       ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PSELx ),
        .PREADYS0   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS0  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS1   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS1  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS2   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS2  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS3   ( CoreAPB3_0_APBmslave3_PREADY ),
        .PSLVERRS3  ( CoreAPB3_0_APBmslave3_PSLVERR ),
        .PREADYS4   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS4  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS5   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS5  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS6   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS6  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS7   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS7  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS8   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS8  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS9   ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS9  ( GND_net ), // tied to 1'b0 from definition
        .PREADYS10  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS10 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS11  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS11 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS12  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS12 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS13  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS13 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS14  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS14 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS15  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS15 ( GND_net ), // tied to 1'b0 from definition
        .PREADYS16  ( VCC_net ), // tied to 1'b1 from definition
        .PSLVERRS16 ( GND_net ), // tied to 1'b0 from definition
        .PADDR      ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PADDR ),
        .PWDATA     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PWDATA ),
        .PRDATAS0   ( PRDATAS0_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS1   ( PRDATAS1_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS2   ( PRDATAS2_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS3   ( CoreAPB3_0_APBmslave3_PRDATA_0 ),
        .PRDATAS4   ( PRDATAS4_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS5   ( PRDATAS5_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS6   ( PRDATAS6_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS7   ( PRDATAS7_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS8   ( PRDATAS8_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS9   ( PRDATAS9_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS10  ( PRDATAS10_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS11  ( PRDATAS11_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS12  ( PRDATAS12_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS13  ( PRDATAS13_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS14  ( PRDATAS14_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS15  ( PRDATAS15_const_net_0 ), // tied to 32'h00000000 from definition
        .PRDATAS16  ( PRDATAS16_const_net_0 ), // tied to 32'h00000000 from definition
        .IADDR      ( IADDR_const_net_0 ), // tied to 32'h00000000 from definition
        // Outputs
        .PREADY     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PREADY ),
        .PSLVERR    ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PSLVERR ),
        .PWRITES    ( CoreAPB3_0_APBmslave3_PWRITE ),
        .PENABLES   ( CoreAPB3_0_APBmslave3_PENABLE ),
        .PSELS0     (  ),
        .PSELS1     (  ),
        .PSELS2     (  ),
        .PSELS3     ( CoreAPB3_0_APBmslave3_PSELx ),
        .PSELS4     (  ),
        .PSELS5     (  ),
        .PSELS6     (  ),
        .PSELS7     (  ),
        .PSELS8     (  ),
        .PSELS9     (  ),
        .PSELS10    (  ),
        .PSELS11    (  ),
        .PSELS12    (  ),
        .PSELS13    (  ),
        .PSELS14    (  ),
        .PSELS15    (  ),
        .PSELS16    (  ),
        .PRDATA     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PRDATA ),
        .PADDRS     ( CoreAPB3_0_APBmslave3_PADDR ),
        .PWDATAS    ( CoreAPB3_0_APBmslave3_PWDATA ) 
        );

//--------DMAAPB_COREAPBLSRAM_0_COREAPBLSRAM   -   Actel:DirectCore:COREAPBLSRAM:3.0.101
DMAAPB_COREAPBLSRAM_0_COREAPBLSRAM #( 
        .APB_DWIDTH                 ( 16 ),
        .FAMILY                     ( 19 ),
        .LSRAM_NUM_LOCATIONS_DWIDTH ( 1024 ),
        .SEL_SRAM_TYPE              ( 0 ),
        .USRAM_NUM_LOCATIONS_DWIDTH ( 128 ) )
COREAPBLSRAM_0(
        // Inputs
        .PCLK    ( FCCC_0_GL0 ),
        .PRESETN ( SYSRESET_0_POWER_ON_RESET_N ),
        .PSEL    ( CoreAPB3_0_APBmslave3_PSELx ),
        .PENABLE ( CoreAPB3_0_APBmslave3_PENABLE ),
        .PWRITE  ( CoreAPB3_0_APBmslave3_PWRITE ),
        .PADDR   ( CoreAPB3_0_APBmslave3_PADDR_0 ),
        .PWDATA  ( CoreAPB3_0_APBmslave3_PWDATA_0 ),
        // Outputs
        .PSLVERR ( CoreAPB3_0_APBmslave3_PSLVERR ),
        .PREADY  ( CoreAPB3_0_APBmslave3_PREADY ),
        .PRDATA  ( CoreAPB3_0_APBmslave3_PRDATA ) 
        );

//--------DMAAPB_MSS
DMAAPB_MSS DMAAPB_MSS_0(
        // Inputs
        .MCCC_CLK_BASE          ( FCCC_0_GL0 ),
        .FIC_0_APB_M_PREADY     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PREADY ),
        .FIC_0_APB_M_PSLVERR    ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PSLVERR ),
        .MCCC_CLK_BASE_PLL_LOCK ( FCCC_0_LOCK ),
        .MSS_RESET_N_F2M        ( SYSRESET_0_POWER_ON_RESET_N ),
        .FIC_0_APB_M_PRDATA     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PRDATA ),
        .DMA_DMAREADY_FIC_0     ( DMA_DMAREADY_FIC_0_const_net_0 ),
        // Outputs
        .FIC_0_APB_M_PSEL       ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PSELx ),
        .FIC_0_APB_M_PWRITE     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PWRITE ),
        .FIC_0_APB_M_PENABLE    ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PENABLE ),
        .GPIO_0_M2F             ( GPIO_0_M2F_net_0 ),
        .FIC_0_APB_M_PADDR      ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PADDR ),
        .FIC_0_APB_M_PWDATA     ( DMAAPB_MSS_0_FIC_0_APB_MASTER_PWDATA ) 
        );

//--------DMAAPB_FCCC_0_FCCC   -   Actel:SgCore:FCCC:2.0.201
DMAAPB_FCCC_0_FCCC FCCC_0(
        // Inputs
        .RCOSC_25_50MHZ ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        // Outputs
        .GL0            ( FCCC_0_GL0 ),
        .LOCK           ( FCCC_0_LOCK ) 
        );

//--------DMAAPB_OSC_0_OSC   -   Actel:SgCore:OSC:2.0.101
DMAAPB_OSC_0_OSC OSC_0(
        // Inputs
        .XTL                ( GND_net ), // tied to 1'b0 from definition
        // Outputs
        .RCOSC_25_50MHZ_CCC ( OSC_0_RCOSC_25_50MHZ_CCC_OUT_RCOSC_25_50MHZ_CCC ),
        .RCOSC_25_50MHZ_O2F (  ),
        .RCOSC_1MHZ_CCC     (  ),
        .RCOSC_1MHZ_O2F     (  ),
        .XTLOSC_CCC         (  ),
        .XTLOSC_O2F         (  ) 
        );

//--------SYSRESET
SYSRESET SYSRESET_0(
        // Inputs
        .DEVRST_N         ( DEVRST_N ),
        // Outputs
        .POWER_ON_RESET_N ( SYSRESET_0_POWER_ON_RESET_N ) 
        );


endmodule
