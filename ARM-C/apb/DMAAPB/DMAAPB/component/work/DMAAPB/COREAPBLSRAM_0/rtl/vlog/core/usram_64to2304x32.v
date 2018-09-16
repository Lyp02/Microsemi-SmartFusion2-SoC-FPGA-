// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  SRAM block, 4 byte wide, 64 to 2304 deep (in steps
//               of 64 for Word accesses), 64 to 4608 deep (in steps
//               of 64 for Half-Word accesses) and 64 to 4608 deep (in 
//               steps of 128 for Byte accesses) used to construct 
//               the memory.
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

module DMAAPB_COREAPBLSRAM_0_usram_64to2304x32
  (
   writeData,
   readData,
   wen,
   ren,
   writeAddr,
   readAddr,
   clk,
   resetn,
   u_2K_BUSY_all
   );

// ---------------------------------------------------------------------
// Parameters
// ---------------------------------------------------------------------
// DEPTH can range from
// 64 to 2304bytes  , in steps of 64bytes for WORD

   parameter USRAM_NUM_LOCATIONS_DWIDTH32 = 64;
   parameter APB_DWIDTH                   = 32;


// ---------------------------------------------------------------------
// Port declarations
// ---------------------------------------------------------------------

   // Inputs
   input [APB_DWIDTH - 1:0] writeData;

   // AhbSramIf interface
   // Inputs
   input        wen;
   input        ren;
   input [17:0] writeAddr;
   input [17:0] readAddr;
   input        clk;
   input        resetn;
   
    // Output
   output [APB_DWIDTH-1:0] readData;
   output                  u_2K_BUSY_all;   
     
// ---------------------------------------------------------------------
// Constant declarations
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// Signal declarations
// ---------------------------------------------------------------------
   reg [APB_DWIDTH-1:0] readData;
        reg     [13:6]                  ckRdAddr;

        reg     [2:0]                   width0;
        reg     [2:0]                   width1;
        reg     [2:0]                   width2;
        reg     [2:0]                   width3;
        reg     [2:0]                   width4;
        reg     [2:0]                   width5;
        reg     [2:0]                   width6;
        reg     [2:0]                   width7;
        reg     [2:0]                   width8;
        reg     [2:0]                   width9;
        reg     [2:0]                   width10;
        reg     [2:0]                   width11;
        reg     [2:0]                   width12;
        reg     [2:0]                   width13;
        reg     [2:0]                   width14;
        reg     [2:0]                   width15;
        reg     [2:0]                   width16;
        reg     [2:0]                   width17;
        reg     [2:0]                   width18;
        reg     [2:0]                   width19;
        reg     [2:0]                   width20;
        reg     [2:0]                   width21;
        reg     [2:0]                   width22;
        reg     [2:0]                   width23;
        reg     [2:0]                   width24;
        reg     [2:0]                   width25;
        reg     [2:0]                   width26;
        reg     [2:0]                   width27;
        reg     [2:0]                   width28;
        reg     [2:0]                   width29;
        reg     [2:0]                   width30;
        reg     [2:0]                   width31;
        reg     [2:0]                   width32;
        reg     [2:0]                   width33;
        reg     [2:0]                   width34;
        reg     [2:0]                   width35;
        reg     [2:0]                   width36;
        reg     [2:0]                   width37;
        reg     [2:0]                   width38;
        reg     [2:0]                   width39;
        reg     [2:0]                   width40;
        reg     [2:0]                   width41;
        reg     [2:0]                   width42;
        reg     [2:0]                   width43;
        reg     [2:0]                   width44;
        reg     [2:0]                   width45;
        reg     [2:0]                   width46;
        reg     [2:0]                   width47;
        reg     [2:0]                   width48;
        reg     [2:0]                   width49;
        reg     [2:0]                   width50;
        reg     [2:0]                   width51;
        reg     [2:0]                   width52;
        reg     [2:0]                   width53;
        reg     [2:0]                   width54;
        reg     [2:0]                   width55;
        reg     [2:0]                   width56;
        reg     [2:0]                   width57;
        reg     [2:0]                   width58;
        reg     [2:0]                   width59;
        reg     [2:0]                   width60;
        reg     [2:0]                   width61;
        reg     [2:0]                   width62;
        reg     [2:0]                   width63;
        reg     [2:0]                   width64;
        reg     [2:0]                   width65;
        reg     [2:0]                   width66;
        reg     [2:0]                   width67;
        reg     [2:0]                   width68;
        reg     [2:0]                   width69;
        reg     [2:0]                   width70;
        reg     [2:0]                   width71;

        reg                             wen_a0;
        reg                             wen_a1;
        reg                             wen_a2;
        reg                             wen_a3;
        reg                             wen_a4;
        reg                             wen_a5;
        reg                             wen_a6;
        reg                             wen_a7;
        reg                             wen_a8;
        reg                             wen_a9;
        reg                             wen_a10;
        reg                             wen_a11;
        reg                             wen_a12;
        reg                             wen_a13;
        reg                             wen_a14;
        reg                             wen_a15;
        reg                             wen_a16;
        reg                             wen_a17;
        reg                             wen_a18;
        reg                             wen_a19;
        reg                             wen_a20;
        reg                             wen_a21;
        reg                             wen_a22;
        reg                             wen_a23;
        reg                             wen_a24;
        reg                             wen_a25;
        reg                             wen_a26;
        reg                             wen_a27;
        reg                             wen_a28;
        reg                             wen_a29;
        reg                             wen_a30;
        reg                             wen_a31;
        reg                             wen_a32;
        reg                             wen_a33;
        reg                             wen_a34;
        reg                             wen_a35;
        reg                             wen_a36;
        reg                             wen_a37;
        reg                             wen_a38;
        reg                             wen_a39;
        reg                             wen_a40;
        reg                             wen_a41;
        reg                             wen_a42;
        reg                             wen_a43;
        reg                             wen_a44;
        reg                             wen_a45;
        reg                             wen_a46;
        reg                             wen_a47;
        reg                             wen_a48;
        reg                             wen_a49;
        reg                             wen_a50;
        reg                             wen_a51;
        reg                             wen_a52;
        reg                             wen_a53;
        reg                             wen_a54;
        reg                             wen_a55;
        reg                             wen_a56;
        reg                             wen_a57;
        reg                             wen_a58;
        reg                             wen_a59;
        reg                             wen_a60;
        reg                             wen_a61;
        reg                             wen_a62;
        reg                             wen_a63;
        reg                             wen_a64;
        reg                             wen_a65;
        reg                             wen_a66;
        reg                             wen_a67;
        reg                             wen_a68;
        reg                             wen_a69;
        reg                             wen_a70;
        reg                             wen_a71;


        reg                             wen_b0;
        reg                             wen_b1;
        reg                             wen_b2;
        reg                             wen_b3;
        reg                             wen_b4;
        reg                             wen_b5;
        reg                             wen_b6;
        reg                             wen_b7;
        reg                             wen_b8;
        reg                             wen_b9;
        reg                             wen_b10;
        reg                             wen_b11;
        reg                             wen_b12;
        reg                             wen_b13;
        reg                             wen_b14;
        reg                             wen_b15;
        reg                             wen_b16;
        reg                             wen_b17;
        reg                             wen_b18;
        reg                             wen_b19;
        reg                             wen_b20;
        reg                             wen_b21;
        reg                             wen_b22;
        reg                             wen_b23;
        reg                             wen_b24;
        reg                             wen_b25;
        reg                             wen_b26;
        reg                             wen_b27;
        reg                             wen_b28;
        reg                             wen_b29;
        reg                             wen_b30;
        reg                             wen_b31;
        reg                             wen_b32;
        reg                             wen_b33;
        reg                             wen_b34;
        reg                             wen_b35;
        reg                             wen_b36;
        reg                             wen_b37;
        reg                             wen_b38;
        reg                             wen_b39;
        reg                             wen_b40;
        reg                             wen_b41;
        reg                             wen_b42;
        reg                             wen_b43;
        reg                             wen_b44;
        reg                             wen_b45;
        reg                             wen_b46;
        reg                             wen_b47;
        reg                             wen_b48;
        reg                             wen_b49;
        reg                             wen_b50;
        reg                             wen_b51;
        reg                             wen_b52;
        reg                             wen_b53;
        reg                             wen_b54;
        reg                             wen_b55;
        reg                             wen_b56;
        reg                             wen_b57;
        reg                             wen_b58;
        reg                             wen_b59;
        reg                             wen_b60;
        reg                             wen_b61;
        reg                             wen_b62;
        reg                             wen_b63;
        reg                             wen_b64;
        reg                             wen_b65;
        reg                             wen_b66;
        reg                             wen_b67;
        reg                             wen_b68;
        reg                             wen_b69;
        reg                             wen_b70;
        reg                             wen_b71;

        reg     [17:0]                   writeData0;
        reg     [17:0]                   writeData1;
        reg     [17:0]                   writeData2;
        reg     [17:0]                   writeData3;
        reg     [17:0]                   writeData4;
        reg     [17:0]                   writeData5;
        reg     [17:0]                   writeData6;
        reg     [17:0]                   writeData7;
        reg     [17:0]                   writeData8;
        reg     [17:0]                   writeData9;
        reg     [17:0]                   writeData10;
        reg     [17:0]                   writeData11;
        reg     [17:0]                   writeData12;
        reg     [17:0]                   writeData13;
        reg     [17:0]                   writeData14;
        reg     [17:0]                   writeData15;
        reg     [17:0]                   writeData16;
        reg     [17:0]                   writeData17;
        reg     [17:0]                   writeData18;
        reg     [17:0]                   writeData19;
        reg     [17:0]                   writeData20;
        reg     [17:0]                   writeData21;
        reg     [17:0]                   writeData22;
        reg     [17:0]                   writeData23;
        reg     [17:0]                   writeData24;
        reg     [17:0]                   writeData25;
        reg     [17:0]                   writeData26;
        reg     [17:0]                   writeData27;
        reg     [17:0]                   writeData28;
        reg     [17:0]                   writeData29;
        reg     [17:0]                   writeData30;
        reg     [17:0]                   writeData31;
        reg     [17:0]                   writeData32;
        reg     [17:0]                   writeData33;
        reg     [17:0]                   writeData34;
        reg     [17:0]                   writeData35;
        reg     [17:0]                   writeData36;
        reg     [17:0]                   writeData37;
        reg     [17:0]                   writeData38;
        reg     [17:0]                   writeData39;
        reg     [17:0]                   writeData40;
        reg     [17:0]                   writeData41;
        reg     [17:0]                   writeData42;
        reg     [17:0]                   writeData43;
        reg     [17:0]                   writeData44;
        reg     [17:0]                   writeData45;
        reg     [17:0]                   writeData46;
        reg     [17:0]                   writeData47;
        reg     [17:0]                   writeData48;
        reg     [17:0]                   writeData49;
        reg     [17:0]                   writeData50;
        reg     [17:0]                   writeData51;
        reg     [17:0]                   writeData52;
        reg     [17:0]                   writeData53;
        reg     [17:0]                   writeData54;
        reg     [17:0]                   writeData55;
        reg     [17:0]                   writeData56;
        reg     [17:0]                   writeData57;
        reg     [17:0]                   writeData58;
        reg     [17:0]                   writeData59;
        reg     [17:0]                   writeData60;
        reg     [17:0]                   writeData61;
        reg     [17:0]                   writeData62;
        reg     [17:0]                   writeData63;
        reg     [17:0]                   writeData64;
        reg     [17:0]                   writeData65;
        reg     [17:0]                   writeData66;
        reg     [17:0]                   writeData67;
        reg     [17:0]                   writeData68;
        reg     [17:0]                   writeData69;
        reg     [17:0]                   writeData70;
        reg     [17:0]                   writeData71;

        wire    [17:0]                   readData0;
        wire    [17:0]                   readData1;
        wire    [17:0]                   readData2;
        wire    [17:0]                   readData3;
        wire    [17:0]                   readData4;
        wire    [17:0]                   readData5;
        wire    [17:0]                   readData6;
        wire    [17:0]                   readData7;
        wire    [17:0]                   readData8;
        wire    [17:0]                   readData9;
        wire    [17:0]                   readData10;
        wire    [17:0]                   readData11;
        wire    [17:0]                   readData12;
        wire    [17:0]                   readData13;
        wire    [17:0]                   readData14;
        wire    [17:0]                   readData15;
        wire    [17:0]                   readData16;
        wire    [17:0]                   readData17;
        wire    [17:0]                   readData18;
        wire    [17:0]                   readData19;
        wire    [17:0]                   readData20;
        wire    [17:0]                   readData21;
        wire    [17:0]                   readData22;
        wire    [17:0]                   readData23;
        wire    [17:0]                   readData24;
        wire    [17:0]                   readData25;
        wire    [17:0]                   readData26;
        wire    [17:0]                   readData27;
        wire    [17:0]                   readData28;
        wire    [17:0]                   readData29;
        wire    [17:0]                   readData30;
        wire    [17:0]                   readData31;
        wire    [17:0]                   readData32;
        wire    [17:0]                   readData33;
        wire    [17:0]                   readData34;
        wire    [17:0]                   readData35;
        wire    [17:0]                   readData36;
        wire    [17:0]                   readData37;
        wire    [17:0]                   readData38;
        wire    [17:0]                   readData39;
        wire    [17:0]                   readData40;
        wire    [17:0]                   readData41;
        wire    [17:0]                   readData42;
        wire    [17:0]                   readData43;
        wire    [17:0]                   readData44;
        wire    [17:0]                   readData45;
        wire    [17:0]                   readData46;
        wire    [17:0]                   readData47;
        wire    [17:0]                   readData48;
        wire    [17:0]                   readData49;
        wire    [17:0]                   readData50;
        wire    [17:0]                   readData51;
        wire    [17:0]                   readData52;
        wire    [17:0]                   readData53;
        wire    [17:0]                   readData54;
        wire    [17:0]                   readData55;
        wire    [17:0]                   readData56;
        wire    [17:0]                   readData57;
        wire    [17:0]                   readData58;
        wire    [17:0]                   readData59;
        wire    [17:0]                   readData60;
        wire    [17:0]                   readData61;
        wire    [17:0]                   readData62;
        wire    [17:0]                   readData63;
        wire    [17:0]                   readData64;
        wire    [17:0]                   readData65;
        wire    [17:0]                   readData66;
        wire    [17:0]                   readData67;
        wire    [17:0]                   readData68;
        wire    [17:0]                   readData69;
        wire    [17:0]                   readData70;
        wire    [17:0]                   readData71;

        reg     [9:0]                  writeAddr0;
        reg     [9:0]                  writeAddr1;
        reg     [9:0]                  writeAddr2;
        reg     [9:0]                  writeAddr3;
        reg     [9:0]                  writeAddr4;
        reg     [9:0]                  writeAddr5;
        reg     [9:0]                  writeAddr6;
        reg     [9:0]                  writeAddr7;
        reg     [9:0]                  writeAddr8;
        reg     [9:0]                  writeAddr9;
        reg     [9:0]                  writeAddr10;
        reg     [9:0]                  writeAddr11;
        reg     [9:0]                  writeAddr12;
        reg     [9:0]                  writeAddr13;
        reg     [9:0]                  writeAddr14;
        reg     [9:0]                  writeAddr15;
        reg     [9:0]                  writeAddr16;
        reg     [9:0]                  writeAddr17;
        reg     [9:0]                  writeAddr18;
        reg     [9:0]                  writeAddr19;
        reg     [9:0]                  writeAddr20;
        reg     [9:0]                  writeAddr21;
        reg     [9:0]                  writeAddr22;
        reg     [9:0]                  writeAddr23;
        reg     [9:0]                  writeAddr24;
        reg     [9:0]                  writeAddr25;
        reg     [9:0]                  writeAddr26;
        reg     [9:0]                  writeAddr27;
        reg     [9:0]                  writeAddr28;
        reg     [9:0]                  writeAddr29;
        reg     [9:0]                  writeAddr30;
        reg     [9:0]                  writeAddr31;
        reg     [9:0]                  writeAddr32;
        reg     [9:0]                  writeAddr33;
        reg     [9:0]                  writeAddr34;
        reg     [9:0]                  writeAddr35;
        reg     [9:0]                  writeAddr36;
        reg     [9:0]                  writeAddr37;
        reg     [9:0]                  writeAddr38;
        reg     [9:0]                  writeAddr39;
        reg     [9:0]                  writeAddr40;
        reg     [9:0]                  writeAddr41;
        reg     [9:0]                  writeAddr42;
        reg     [9:0]                  writeAddr43;
        reg     [9:0]                  writeAddr44;
        reg     [9:0]                  writeAddr45;
        reg     [9:0]                  writeAddr46;
        reg     [9:0]                  writeAddr47;
        reg     [9:0]                  writeAddr48;
        reg     [9:0]                  writeAddr49;
        reg     [9:0]                  writeAddr50;
        reg     [9:0]                  writeAddr51;
        reg     [9:0]                  writeAddr52;
        reg     [9:0]                  writeAddr53;
        reg     [9:0]                  writeAddr54;
        reg     [9:0]                  writeAddr55;
        reg     [9:0]                  writeAddr56;
        reg     [9:0]                  writeAddr57;
        reg     [9:0]                  writeAddr58;
        reg     [9:0]                  writeAddr59;
        reg     [9:0]                  writeAddr60;
        reg     [9:0]                  writeAddr61;
        reg     [9:0]                  writeAddr62;
        reg     [9:0]                  writeAddr63;
        reg     [9:0]                  writeAddr64;
        reg     [9:0]                  writeAddr65;
        reg     [9:0]                  writeAddr66;
        reg     [9:0]                  writeAddr67;
        reg     [9:0]                  writeAddr68;
        reg     [9:0]                  writeAddr69;
        reg     [9:0]                  writeAddr70;
        reg     [9:0]                  writeAddr71;

        reg     [9:0]                  readAddr0;
        reg     [9:0]                  readAddr1;
        reg     [9:0]                  readAddr2;
        reg     [9:0]                  readAddr3;
        reg     [9:0]                  readAddr4;
        reg     [9:0]                  readAddr5;
        reg     [9:0]                  readAddr6;
        reg     [9:0]                  readAddr7;
        reg     [9:0]                  readAddr8;
        reg     [9:0]                  readAddr9;
        reg     [9:0]                  readAddr10;
        reg     [9:0]                  readAddr11;
        reg     [9:0]                  readAddr12;
        reg     [9:0]                  readAddr13;
        reg     [9:0]                  readAddr14;
        reg     [9:0]                  readAddr15;
        reg     [9:0]                  readAddr16;
        reg     [9:0]                  readAddr17;
        reg     [9:0]                  readAddr18;
        reg     [9:0]                  readAddr19;
        reg     [9:0]                  readAddr20;
        reg     [9:0]                  readAddr21;
        reg     [9:0]                  readAddr22;
        reg     [9:0]                  readAddr23;
        reg     [9:0]                  readAddr24;
        reg     [9:0]                  readAddr25;
        reg     [9:0]                  readAddr26;
        reg     [9:0]                  readAddr27;
        reg     [9:0]                  readAddr28;
        reg     [9:0]                  readAddr29;
        reg     [9:0]                  readAddr30;
        reg     [9:0]                  readAddr31;
        reg     [9:0]                  readAddr32;
        reg     [9:0]                  readAddr33;
        reg     [9:0]                  readAddr34;
        reg     [9:0]                  readAddr35;
        reg     [9:0]                  readAddr36;
        reg     [9:0]                  readAddr37;
        reg     [9:0]                  readAddr38;
        reg     [9:0]                  readAddr39;
        reg     [9:0]                  readAddr40;
        reg     [9:0]                  readAddr41;
        reg     [9:0]                  readAddr42;
        reg     [9:0]                  readAddr43;
        reg     [9:0]                  readAddr44;
        reg     [9:0]                  readAddr45;
        reg     [9:0]                  readAddr46;
        reg     [9:0]                  readAddr47;
        reg     [9:0]                  readAddr48;
        reg     [9:0]                  readAddr49;
        reg     [9:0]                  readAddr50;
        reg     [9:0]                  readAddr51;
        reg     [9:0]                  readAddr52;
        reg     [9:0]                  readAddr53;
        reg     [9:0]                  readAddr54;
        reg     [9:0]                  readAddr55;
        reg     [9:0]                  readAddr56;
        reg     [9:0]                  readAddr57;
        reg     [9:0]                  readAddr58;
        reg     [9:0]                  readAddr59;
        reg     [9:0]                  readAddr60;
        reg     [9:0]                  readAddr61;
        reg     [9:0]                  readAddr62;
        reg     [9:0]                  readAddr63;
        reg     [9:0]                  readAddr64;
        reg     [9:0]                  readAddr65;
        reg     [9:0]                  readAddr66;
        reg     [9:0]                  readAddr67;
        reg     [9:0]                  readAddr68;
        reg     [9:0]                  readAddr69;
        reg     [9:0]                  readAddr70;
        reg     [9:0]                  readAddr71;

   reg [1:0]                           ablk;
   reg [1:0]                           bblk;
   reg [1:0]                           cblk;
   
   wire                                 u_2K_BUSY_all;
   wire                                 u_BUSY_71;
   wire                                 u_BUSY_70;
   wire                                 u_BUSY_69;
   wire                                 u_BUSY_68;
   wire                                 u_BUSY_67;
   wire                                 u_BUSY_66;
   wire                                 u_BUSY_65;
   wire                                 u_BUSY_64;
   wire                                 u_BUSY_63;
   wire                                 u_BUSY_62;
   wire                                 u_BUSY_61;
   wire                                 u_BUSY_60;
   wire                                 u_BUSY_59;
   wire                                 u_BUSY_58;
   wire                                 u_BUSY_57;
   wire                                 u_BUSY_56;
   wire                                 u_BUSY_55;
   wire                                 u_BUSY_54;
   wire                                 u_BUSY_53;
   wire                                 u_BUSY_52;
   wire                                 u_BUSY_51;
   wire                                 u_BUSY_50;
   wire                                 u_BUSY_49;
   wire                                 u_BUSY_48;
   wire                                 u_BUSY_47;
   wire                                 u_BUSY_46;
   wire                                 u_BUSY_45;
   wire                                 u_BUSY_44;
   wire                                 u_BUSY_43;
   wire                                 u_BUSY_42;
   wire                                 u_BUSY_41;
   wire                                 u_BUSY_40;
   wire                                 u_BUSY_39;
   wire                                 u_BUSY_38;
   wire                                 u_BUSY_37;
   wire                                 u_BUSY_36;
   wire                                 u_BUSY_35;
   wire                                 u_BUSY_34;
   wire                                 u_BUSY_33;
   wire                                 u_BUSY_32;
   wire                                 u_BUSY_31;
   wire                                 u_BUSY_30;
   wire                                 u_BUSY_29;
   wire                                 u_BUSY_28;
   wire                                 u_BUSY_27;
   wire                                 u_BUSY_26;
   wire                                 u_BUSY_25;
   wire                                 u_BUSY_24;
   wire                                 u_BUSY_23;
   wire                                 u_BUSY_22;
   wire                                 u_BUSY_21;
   wire                                 u_BUSY_20;
   wire                                 u_BUSY_19;
   wire                                 u_BUSY_18;
   wire                                 u_BUSY_17;
   wire                                 u_BUSY_16;
   wire                                 u_BUSY_15;
   wire                                 u_BUSY_14;
   wire                                 u_BUSY_13;
   wire                                 u_BUSY_12;
   wire                                 u_BUSY_11;
   wire                                 u_BUSY_10;
   wire                                 u_BUSY_9;
   wire                                 u_BUSY_8;
   wire                                 u_BUSY_7;
   wire                                 u_BUSY_6;
   wire                                 u_BUSY_5;
   wire                                 u_BUSY_4;
   wire                                 u_BUSY_3;
   wire                                 u_BUSY_2;
   wire                                 u_BUSY_1;
   wire                                 u_BUSY_0;
   
   

//----------------------------------------------------------------------
// Main body of code
//----------------------------------------------------------------------

    always @ (posedge clk or negedge resetn)
    begin
       if (!resetn)
         ckRdAddr[13:6] <= 8'b00000000;
       else
         ckRdAddr[13:6] <= readAddr[13:6];
    end

    //----------------------------------------------------------------------------------------
    // Assign values to various signals based on DEPTH and RAM64x16_WIDTH settings.
    // Default is to build the (byte wide) memory from RAM blocks which are configured to
    // be tall and narrow.
    //----------------------------------------------------------------------------------------

   always @ (*)
     begin
        width0  = 3'b0;
        width1  = 3'b0;
        width2  = 3'b0;
        width3  = 3'b0;
        width4  = 3'b0;
        width5  = 3'b0;
        width6  = 3'b0;
        width7  = 3'b0;
        width8  = 3'b0;
        width9  = 3'b0;
        width10 = 3'b0;
        width11 = 3'b0;
        width12 = 3'b0;
        width13 = 3'b0;
        width14 = 3'b0;
        width15 = 3'b0;
        width16 = 3'b0;
        width17 = 3'b0;
        width18 = 3'b0;
        width19 = 3'b0;
        width20 = 3'b0;
        width21 = 3'b0;
        width22 = 3'b0;
        width23 = 3'b0;
        width24 = 3'b0;
        width25 = 3'b0;
        width26 = 3'b0;
        width27 = 3'b0;
        width28 = 3'b0;
        width29 = 3'b0;
        width30 = 3'b0;
        width31 = 3'b0;
        width32 = 3'b0;
        width33 = 3'b0;
        width34 = 3'b0;
        width35 = 3'b0;
        width36 = 3'b0;
        width37 = 3'b0;
        width38 = 3'b0;
        width39 = 3'b0;
        width40 = 3'b0;
        width41 = 3'b0;
        width42 = 3'b0;
        width43 = 3'b0;
        width44 = 3'b0;
        width45 = 3'b0;
        width46 = 3'b0;
        width47 = 3'b0;
        width48 = 3'b0;
        width49 = 3'b0;
        width50 = 3'b0;
        width51 = 3'b0;
        width52 = 3'b0;
        width53 = 3'b0;
        width54 = 3'b0;
        width55 = 3'b0;
        width56 = 3'b0;
        width57 = 3'b0;
        width58 = 3'b0;
        width59 = 3'b0;
        width60 = 3'b0;
        width61 = 3'b0;
        width62 = 3'b0;
        width63 = 3'b0;
        width64 = 3'b0;
        width65 = 3'b0;
        width66 = 3'b0;
        width67 = 3'b0;
        width68 = 3'b0;
        width69 = 3'b0;
        width70 = 3'b0;
        width71 = 3'b0;

        wen_a0  = 1'b0;
        wen_a1  = 1'b0;
        wen_a2  = 1'b0;
        wen_a3  = 1'b0;
        wen_a4  = 1'b0;
        wen_a5  = 1'b0;
        wen_a6  = 1'b0;
        wen_a7  = 1'b0;
        wen_a8  = 1'b0;
        wen_a9  = 1'b0;
        wen_a10 = 1'b0;
        wen_a11 = 1'b0;
        wen_a12 = 1'b0;
        wen_a13 = 1'b0;
        wen_a14 = 1'b0;
        wen_a15 = 1'b0;
        wen_a16 = 1'b0;
        wen_a17 = 1'b0;
        wen_a18 = 1'b0;
        wen_a19 = 1'b0;
        wen_a20 = 1'b0;
        wen_a21 = 1'b0;
        wen_a22 = 1'b0;
        wen_a23 = 1'b0;
        wen_a24 = 1'b0;
        wen_a25 = 1'b0;
        wen_a26 = 1'b0;
        wen_a27 = 1'b0;
        wen_a28 = 1'b0;
        wen_a29 = 1'b0;
        wen_a30 = 1'b0;
        wen_a31 = 1'b0;
        wen_a32 = 1'b0;
        wen_a33 = 1'b0;
        wen_a34 = 1'b0;
        wen_a35 = 1'b0;
        wen_a36 = 1'b0;
        wen_a37 = 1'b0;
        wen_a38 = 1'b0;
        wen_a39 = 1'b0;
        wen_a40 = 1'b0;
        wen_a41 = 1'b0;
        wen_a42 = 1'b0;
        wen_a43 = 1'b0;
        wen_a44 = 1'b0;
        wen_a45 = 1'b0;
        wen_a46 = 1'b0;
        wen_a47 = 1'b0;
        wen_a48 = 1'b0;
        wen_a49 = 1'b0;
        wen_a50 = 1'b0;
        wen_a51 = 1'b0;
        wen_a52 = 1'b0;
        wen_a53 = 1'b0;
        wen_a54 = 1'b0;
        wen_a55 = 1'b0;
        wen_a56 = 1'b0;
        wen_a57 = 1'b0;
        wen_a58 = 1'b0;
        wen_a59 = 1'b0;
        wen_a60 = 1'b0;
        wen_a61 = 1'b0;
        wen_a62 = 1'b0;
        wen_a63 = 1'b0;
        wen_a64 = 1'b0;
        wen_a65 = 1'b0;
        wen_a66 = 1'b0;
        wen_a67 = 1'b0;
        wen_a68 = 1'b0;
        wen_a69 = 1'b0;
        wen_a70 = 1'b0;
        wen_a71 = 1'b0;

        wen_b0  = 1'b0;
        wen_b1  = 1'b0;
        wen_b2  = 1'b0;
        wen_b3  = 1'b0;
        wen_b4  = 1'b0;
        wen_b5  = 1'b0;
        wen_b6  = 1'b0;
        wen_b7  = 1'b0;
        wen_b8  = 1'b0;
        wen_b9  = 1'b0;
        wen_b10 = 1'b0;
        wen_b11 = 1'b0;
        wen_b12 = 1'b0;
        wen_b13 = 1'b0;
        wen_b14 = 1'b0;
        wen_b15 = 1'b0;
        wen_b16 = 1'b0;
        wen_b17 = 1'b0;
        wen_b18 = 1'b0;
        wen_b19 = 1'b0;
        wen_b20 = 1'b0;
        wen_b21 = 1'b0;
        wen_b22 = 1'b0;
        wen_b23 = 1'b0;
        wen_b24 = 1'b0;
        wen_b25 = 1'b0;
        wen_b26 = 1'b0;
        wen_b27 = 1'b0;
        wen_b28 = 1'b0;
        wen_b29 = 1'b0;
        wen_b30 = 1'b0;
        wen_b31 = 1'b0;
        wen_b32 = 1'b0;
        wen_b33 = 1'b0;
        wen_b34 = 1'b0;
        wen_b35 = 1'b0;
        wen_b36 = 1'b0;
        wen_b37 = 1'b0;
        wen_b38 = 1'b0;
        wen_b39 = 1'b0;
        wen_b40 = 1'b0;
        wen_b41 = 1'b0;
        wen_b42 = 1'b0;
        wen_b43 = 1'b0;
        wen_b44 = 1'b0;
        wen_b45 = 1'b0;
        wen_b46 = 1'b0;
        wen_b47 = 1'b0;
        wen_b48 = 1'b0;
        wen_b49 = 1'b0;
        wen_b50 = 1'b0;
        wen_b51 = 1'b0;
        wen_b52 = 1'b0;
        wen_b53 = 1'b0;
        wen_b54 = 1'b0;
        wen_b55 = 1'b0;
        wen_b56 = 1'b0;
        wen_b57 = 1'b0;
        wen_b58 = 1'b0;
        wen_b59 = 1'b0;
        wen_b60 = 1'b0;
        wen_b61 = 1'b0;
        wen_b62 = 1'b0;
        wen_b63 = 1'b0;
        wen_b64 = 1'b0;
        wen_b65 = 1'b0;
        wen_b66 = 1'b0;
        wen_b67 = 1'b0;
        wen_b68 = 1'b0;
        wen_b69 = 1'b0;
        wen_b70 = 1'b0;
        wen_b71 = 1'b0;

        writeData0  = 18'b0;
        writeData1  = 18'b0;
        writeData2  = 18'b0;
        writeData3  = 18'b0;
        writeData4  = 18'b0;
        writeData5  = 18'b0;
        writeData6  = 18'b0;
        writeData7  = 18'b0;
        writeData8  = 18'b0;
        writeData9  = 18'b0;
        writeData10 = 18'b0;
        writeData11 = 18'b0;
        writeData12 = 18'b0;
        writeData13 = 18'b0;
        writeData14 = 18'b0;
        writeData15 = 18'b0;
        writeData16 = 18'b0;
        writeData17 = 18'b0;
        writeData18 = 18'b0;
        writeData19 = 18'b0;
        writeData20 = 18'b0;
        writeData21 = 18'b0;
        writeData22 = 18'b0;
        writeData23 = 18'b0;
        writeData24 = 18'b0;
        writeData25 = 18'b0;
        writeData26 = 18'b0;
        writeData27 = 18'b0;
        writeData28 = 18'b0;
        writeData29 = 18'b0;
        writeData30 = 18'b0;
        writeData31 = 18'b0;
        writeData32 = 18'b0;
        writeData33 = 18'b0;
        writeData34 = 18'b0;
        writeData35 = 18'b0;
        writeData36 = 18'b0;
        writeData37 = 18'b0;
        writeData38 = 18'b0;
        writeData39 = 18'b0;
        writeData40 = 18'b0;
        writeData41 = 18'b0;
        writeData42 = 18'b0;
        writeData43 = 18'b0;
        writeData44 = 18'b0;
        writeData45 = 18'b0;
        writeData46 = 18'b0;
        writeData47 = 18'b0;
        writeData48 = 18'b0;
        writeData49 = 18'b0;
        writeData50 = 18'b0;
        writeData51 = 18'b0;
        writeData52 = 18'b0;
        writeData53 = 18'b0;
        writeData54 = 18'b0;
        writeData55 = 18'b0;
        writeData56 = 18'b0;
        writeData57 = 18'b0;
        writeData58 = 18'b0;
        writeData59 = 18'b0;
        writeData60 = 18'b0;
        writeData61 = 18'b0;
        writeData62 = 18'b0;
        writeData63 = 18'b0;
        writeData64 = 18'b0;
        writeData65 = 18'b0;
        writeData66 = 18'b0;
        writeData67 = 18'b0;
        writeData68 = 18'b0;
        writeData69 = 18'b0;
        writeData70 = 18'b0;
        writeData71 = 18'b0;

        writeAddr0  = 10'b0;
        writeAddr1  = 10'b0;
        writeAddr2  = 10'b0;
        writeAddr3  = 10'b0;
        writeAddr4  = 10'b0;
        writeAddr5  = 10'b0;
        writeAddr6  = 10'b0;
        writeAddr7  = 10'b0;
        writeAddr8  = 10'b0;
        writeAddr9  = 10'b0;
        writeAddr10 = 10'b0;
        writeAddr11 = 10'b0;
        writeAddr12 = 10'b0;
        writeAddr13 = 10'b0;
        writeAddr14 = 10'b0;
        writeAddr15 = 10'b0;
        writeAddr16 = 10'b0;
        writeAddr17 = 10'b0;
        writeAddr18 = 10'b0;
        writeAddr19 = 10'b0;
        writeAddr20 = 10'b0;
        writeAddr21 = 10'b0;
        writeAddr22 = 10'b0;
        writeAddr23 = 10'b0;
        writeAddr24 = 10'b0;
        writeAddr25 = 10'b0;
        writeAddr26 = 10'b0;
        writeAddr27 = 10'b0;
        writeAddr28 = 10'b0;
        writeAddr29 = 10'b0;
        writeAddr30 = 10'b0;
        writeAddr31 = 10'b0;
        writeAddr32 = 10'b0;
        writeAddr33 = 10'b0;
        writeAddr34 = 10'b0;
        writeAddr35 = 10'b0;
        writeAddr36 = 10'b0;
        writeAddr37 = 10'b0;
        writeAddr38 = 10'b0;
        writeAddr39 = 10'b0;
        writeAddr40 = 10'b0;
        writeAddr41 = 10'b0;
        writeAddr42 = 10'b0;
        writeAddr43 = 10'b0;
        writeAddr44 = 10'b0;
        writeAddr45 = 10'b0;
        writeAddr46 = 10'b0;
        writeAddr47 = 10'b0;
        writeAddr48 = 10'b0;
        writeAddr49 = 10'b0;
        writeAddr50 = 10'b0;
        writeAddr51 = 10'b0;
        writeAddr52 = 10'b0;
        writeAddr53 = 10'b0;
        writeAddr54 = 10'b0;
        writeAddr55 = 10'b0;
        writeAddr56 = 10'b0;
        writeAddr57 = 10'b0;
        writeAddr58 = 10'b0;
        writeAddr59 = 10'b0;
        writeAddr60 = 10'b0;
        writeAddr61 = 10'b0;
        writeAddr62 = 10'b0;
        writeAddr63 = 10'b0;
        writeAddr64 = 10'b0;
        writeAddr65 = 10'b0;
        writeAddr66 = 10'b0;
        writeAddr67 = 10'b0;
        writeAddr68 = 10'b0;
        writeAddr69 = 10'b0;
        writeAddr70 = 10'b0;
        writeAddr71 = 10'b0;

        readAddr0  = 10'b0;
        readAddr1  = 10'b0;
        readAddr2  = 10'b0;
        readAddr3  = 10'b0;
        readAddr4  = 10'b0;
        readAddr5  = 10'b0;
        readAddr6  = 10'b0;
        readAddr7  = 10'b0;
        readAddr8  = 10'b0;
        readAddr9  = 10'b0;
        readAddr10 = 10'b0;
        readAddr11 = 10'b0;
        readAddr12 = 10'b0;
        readAddr13 = 10'b0;
        readAddr14 = 10'b0;
        readAddr15 = 10'b0;
        readAddr16 = 10'b0;
        readAddr17 = 10'b0;
        readAddr18 = 10'b0;
        readAddr19 = 10'b0;
        readAddr20 = 10'b0;
        readAddr21 = 10'b0;
        readAddr22 = 10'b0;
        readAddr23 = 10'b0;
        readAddr24 = 10'b0;
        readAddr25 = 10'b0;
        readAddr26 = 10'b0;
        readAddr27 = 10'b0;
        readAddr28 = 10'b0;
        readAddr29 = 10'b0;
        readAddr30 = 10'b0;
        readAddr31 = 10'b0;
        readAddr32 = 10'b0;
        readAddr33 = 10'b0;
        readAddr34 = 10'b0;
        readAddr35 = 10'b0;
        readAddr36 = 10'b0;
        readAddr37 = 10'b0;
        readAddr38 = 10'b0;
        readAddr39 = 10'b0;
        readAddr40 = 10'b0;
        readAddr41 = 10'b0;
        readAddr42 = 10'b0;
        readAddr43 = 10'b0;
        readAddr44 = 10'b0;
        readAddr45 = 10'b0;
        readAddr46 = 10'b0;
        readAddr47 = 10'b0;
        readAddr48 = 10'b0;
        readAddr49 = 10'b0;
        readAddr50 = 10'b0;
        readAddr51 = 10'b0;
        readAddr52 = 10'b0;
        readAddr53 = 10'b0;
        readAddr54 = 10'b0;
        readAddr55 = 10'b0;
        readAddr56 = 10'b0;
        readAddr57 = 10'b0;
        readAddr58 = 10'b0;
        readAddr59 = 10'b0;
        readAddr60 = 10'b0;
        readAddr61 = 10'b0;
        readAddr62 = 10'b0;
        readAddr63 = 10'b0;
        readAddr64 = 10'b0;
        readAddr65 = 10'b0;
        readAddr66 = 10'b0;
        readAddr67 = 10'b0;
        readAddr68 = 10'b0;
        readAddr69 = 10'b0;
        readAddr70 = 10'b0;
        readAddr71 = 10'b0;

       ablk = 2'b00;
       bblk = 2'b00; 

              
       if(APB_DWIDTH == 32) begin
          //ablk = 2'b11;
          //bblk = 2'b11;

          #1 ablk = {ren,ren};
          #1 bblk = {ren,ren};
          cblk = {wen,wen};

        case (USRAM_NUM_LOCATIONS_DWIDTH32)
            64: begin  // RAM 0 and RAM 1 for 64x32 configuration

                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                wen_a1 = wen;
                wen_a0 = wen;

                readAddr1 = {readAddr[5:0], 4'b0};
                readAddr0 = {readAddr[5:0], 4'b0};

               readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  
            end

            128: begin // RAM 1 to RAM 4 for 64x32 configuration
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
                width1 = 3'b011;

                writeAddr4 = {writeAddr[6:0], 3'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[6:0], 3'b0};

                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[6:0],  3'b0};

                writeData4 = {10'b0, writeData[31:24]};
                writeData3 = {10'b0, writeData[23:16]};
                writeData2 = {10'b0, writeData[15:8]};
                writeData1 = {10'b0, writeData[7:0]};  

                wen_a4 = wen;
                wen_a3 = wen;
                wen_a2 = wen;
                wen_a1 = wen;

                readData = {readData4[7:0],readData3[7:0],readData2[7:0],readData1[7:0]};
            end

            192: begin  // RAM 0 to RAM 5 for 64x32 configuration
                width5 = 3'b011;
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr5 = {writeAddr[6:0], 3'b0};
                writeAddr4 = {writeAddr[6:0], 3'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr5  = {readAddr[6:0],  3'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};

                writeData5 = {10'b0, writeData[31:24]};
                writeData4 = {10'b0, writeData[23:16]};
                writeData3 = {10'b0, writeData[15:8]};
                writeData2 = {10'b0, writeData[7:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[7:6])
                    2'b00, 2'b01 : {wen_a5, wen_a4, wen_a3, wen_a2, wen_a1, wen_a0} = {wen,  wen,  wen,  wen,  1'b0, 1'b0};
                    2'b10: {wen_a5, wen_a4, wen_a3, wen_a2, wen_a1, wen_a0} = {1'b0, 1'b0, 1'b0, 1'b0, wen,  wen};
                    default: {wen_a5, wen_a4, wen_a3, wen_a2, wen_a1, wen_a0} = {1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0};
                endcase
                case (ckRdAddr[7:6])
                    2'b00, 2'b01: readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                    2'b10:        readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                    default: readData = 32'b0;
                endcase
            end

            256: begin
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
                width5 = 3'b010;
                width4 = 3'b010;
                width3 = 3'b010;
                width2 = 3'b010;
                width1 = 3'b010;

                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[7:0], 2'b0};
                writeAddr4 = {writeAddr[7:0], 2'b0};
                writeAddr3 = {writeAddr[7:0], 2'b0};
                writeAddr2 = {writeAddr[7:0], 2'b0};
                writeAddr1 = {writeAddr[7:0], 2'b0};

                readAddr8 = {readAddr[7:0], 2'b0};
                readAddr7 = {readAddr[7:0], 2'b0};
                readAddr6 = {readAddr[7:0], 2'b0};
                readAddr5 = {readAddr[7:0], 2'b0};
                readAddr4 = {readAddr[7:0], 2'b0};
                readAddr3 = {readAddr[7:0], 2'b0};
                readAddr2 = {readAddr[7:0], 2'b0};
                readAddr1 = {readAddr[7:0], 2'b0};


                writeData8 = {14'b0, writeData[31:28]};
                writeData7 = {14'b0, writeData[27:24]};
                writeData6 = {14'b0, writeData[23:20]};
                writeData5 = {14'b0, writeData[19:16]};
                writeData4 = {14'b0, writeData[15:12]};
                writeData3 = {14'b0, writeData[11:8]};
                writeData2 = {14'b0, writeData[7:4]};
                writeData1 = {14'b0, writeData[3:0]};  

                wen_a8 = wen;
                wen_a7 = wen;
                wen_a6 = wen;
                wen_a5 = wen;
                wen_a4 = wen;
                wen_a3 = wen;
                wen_a2 = wen;
                wen_a1 = wen;

                readData = {
                            readData8[3:0],
                            readData7[3:0],
                            readData6[3:0],
                            readData5[3:0],
                            readData4[3:0],
                            readData3[3:0],
                            readData2[3:0],
                            readData1[3:0]
                            };

            end
            320: begin
                width9 = 3'b010;
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
                width5 = 3'b010;
                width4 = 3'b010;
                width3 = 3'b010;
                width2 = 3'b010;
                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr9 = {writeAddr[7:0], 2'b0};
                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[7:0], 2'b0};
                writeAddr4 = {writeAddr[7:0], 2'b0};
                writeAddr3 = {writeAddr[7:0], 2'b0};
                writeAddr2 = {writeAddr[7:0], 2'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr9  = {readAddr[7:0],  2'b0};
                readAddr8  = {readAddr[7:0],  2'b0};
                readAddr7  = {readAddr[7:0],  2'b0};
                readAddr6  = {readAddr[7:0],  2'b0};
                readAddr5  = {readAddr[7:0],  2'b0};
                readAddr4  = {readAddr[7:0],  2'b0};
                readAddr3  = {readAddr[7:0],  2'b0};
                readAddr2  = {readAddr[7:0],  2'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};

                writeData9 = {14'b0, writeData[31:28]};
                writeData8 = {14'b0, writeData[27:24]};
                writeData7 = {14'b0, writeData[23:20]};
                writeData6 = {14'b0, writeData[19:16]};
                writeData5 = {14'b0, writeData[15:12]};
                writeData4 = {14'b0, writeData[11:8]};
                writeData3 = {14'b0, writeData[7:4]};
                writeData2 = {14'b0, writeData[3:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[8:6])
                    3'b000 , 3'b001, 3'b010, 3'b011 : begin
                        wen_a9 = wen;
                        wen_a8 = wen;
                        wen_a7 = wen;
                        wen_a6 = wen;
                        wen_a5 = wen;
                        wen_a4 = wen;
                        wen_a3 = wen;
                        wen_a2 = wen;
                        wen_a1 = 1'b0;
                        wen_a0 = 1'b0;
                    end
                    3'b100 : begin
                        wen_a9 = 1'b0;
                        wen_a8 = 1'b0;
                        wen_a7 = 1'b0;
                        wen_a6 = 1'b0;
                        wen_a5 = 1'b0;
                        wen_a4 = 1'b0;
                        wen_a3 = 1'b0;
                        wen_a2 = 1'b0;
                        wen_a1 = wen;
                        wen_a0 = wen;
                    end
                    default: begin
                        wen_a9 = 1'b0;
                        wen_a8 = 1'b0;
                        wen_a7 = 1'b0;
                        wen_a6 = 1'b0;
                        wen_a5 = 1'b0;
                        wen_a4 = 1'b0;
                        wen_a3 = 1'b0;
                        wen_a2 = 1'b0;
                        wen_a1 = 1'b0;
                        wen_a0 = 1'b0;
                    end
                endcase
                case (ckRdAddr[8:6])
                    3'b000 , 3'b001, 3'b010, 3'b011 : begin
                        readData = {
                                        readData9[3:0],
                                        readData8[3:0],
                                        readData7[3:0],
                                        readData6[3:0],
                                        readData5[3:0],
                                        readData4[3:0],
                                        readData3[3:0],
                                        readData2[3:0]
                                    };
                    end
                    3'b100 : begin
                        readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                    end
                    default : begin
                        readData = 32'b0;
                    end
                endcase
            end
            384: begin
                width12 = 3'b010;
                width11 = 3'b010;
                width10 = 3'b010;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
                width1 = 3'b011;

                writeAddr12 = {writeAddr[7:0], 2'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9 = {writeAddr[7:0], 2'b0};
                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[7:0], 2'b0};
                writeAddr4 = {writeAddr[6:0], 3'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[6:0], 3'b0};

                readAddr12 = {readAddr[7:0], 2'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9  = {readAddr[7:0], 2'b0};
                readAddr8  = {readAddr[7:0], 2'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[7:0], 2'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[6:0],  3'b0};


                writeData12 = {14'b0, writeData[31:28]};
                writeData11 = {14'b0, writeData[27:24]};
                writeData10 = {14'b0, writeData[23:20]};
                writeData9 = {14'b0, writeData[19:16]};
                writeData8 = {14'b0, writeData[15:12]};
                writeData7 = {14'b0, writeData[11:8]};
                writeData6 = {14'b0, writeData[7:4]};
                writeData5 = {14'b0, writeData[3:0]};
                writeData4 = {10'b0, writeData[31:24]};
                writeData3 = {10'b0, writeData[23:16]};
                writeData2 = {10'b0, writeData[15:8]};
                writeData1 = {10'b0, writeData[7:0]};

                case (writeAddr[8:6])
                  3'b000 , 3'b001, 3'b010, 3'b011 : begin
                     wen_a12 = wen;
                     wen_a11 = wen;
                     wen_a10 = wen;
                     wen_a9 = wen;
                     wen_a8 = wen;
                     wen_a7 = wen;
                     wen_a6 = wen;
                     wen_a5 = wen;
                     wen_a4 = 1'b0;
                     wen_a3 = 1'b0;
                     wen_a2 = 1'b0;
                     wen_a1 = 1'b0;
                    end
                  3'b100, 3'b101 : begin
                     wen_a12 = 1'b0;
                     wen_a11 = 1'b0;
                     wen_a10 = 1'b0;
                     wen_a9 = 1'b0;
                     wen_a8 = 1'b0;
                     wen_a7 = 1'b0;
                     wen_a6 = 1'b0;
                     wen_a5 = 1'b0;
                     wen_a4 = wen;
                     wen_a3 = wen;
                     wen_a2 = wen;
                     wen_a1 = wen;
                  end
                  default : begin
                     wen_a12 = 1'b0;
                     wen_a11 = 1'b0;
                     wen_a10 = 1'b0;
                     wen_a9 = 1'b0;
                     wen_a8 = 1'b0;
                     wen_a7 = 1'b0;
                     wen_a6 = 1'b0;
                     wen_a5 = 1'b0;
                     wen_a4 = 1'b0;
                     wen_a3 = 1'b0;
                     wen_a2 = 1'b0;
                     wen_a1 = 1'b0;
                    end
                endcase
                case (ckRdAddr[8:6])
                  3'b000 , 3'b001, 3'b010, 3'b011 : begin
                     readData = {readData12[3:0],readData11[3:0],readData10[3:0],readData9[3:0],readData8[3:0],readData7[3:0],readData6[3:0],readData5[3:0]};
                  end
                  3'b100, 3'b101 : begin
                     readData = {readData4[7:0],readData3[7:0],readData2[7:0],readData1[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            448: begin
                width13 = 3'b010;
                width12 = 3'b010;
                width11 = 3'b010;
                width10 = 3'b010;
                width9 = 3'b010;
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
                width5 = 3'b011;
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
                width0 = 3'b100;
                width1 = 3'b100;

                writeAddr13 = {writeAddr[7:0], 2'b0};
                writeAddr12 = {writeAddr[7:0], 2'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[6:0], 3'b0};
                writeAddr4 = {writeAddr[6:0], 3'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr13 = {readAddr[7:0], 2'b0};
                readAddr12 = {readAddr[7:0], 2'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9  = {readAddr[7:0], 2'b0};
                readAddr8  = {readAddr[7:0], 2'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[6:0],  3'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1 = {readAddr[5:0], 4'b0};
                readAddr0 = {readAddr[5:0], 4'b0};

                writeData13 = {14'b0, writeData[31:28]};
                writeData12 = {14'b0, writeData[27:24]};
                writeData11 = {14'b0, writeData[23:20]};
                writeData10 = {14'b0, writeData[19:16]};
                writeData9  = {14'b0, writeData[15:12]};
                writeData8  = {14'b0, writeData[11:8]};
                writeData7  = {14'b0, writeData[7:4]};
                writeData6  = {14'b0, writeData[3:0]};
                writeData5 = {10'b0, writeData[31:24]};
                writeData4 = {10'b0, writeData[23:16]};
                writeData3 = {10'b0, writeData[15:8]};
                writeData2 = {10'b0, writeData[7:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[8:6])
                    3'b000, 3'b001, 3'b010, 3'b011 : begin
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5 = 1'b0;
                       wen_a4 = 1'b0;
                       wen_a3 = 1'b0;
                       wen_a2 = 1'b0;
                       wen_a1 = 1'b0;
                       wen_a0 = 1'b0;
                    end
                    3'b100, 3'b101 : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    3'b110 : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase
                case (ckRdAddr[8:6])
                    3'b000, 3'b001, 3'b010, 3'b011 : begin
                       readData = {
                                   readData13[3:0],
                                   readData12[3:0],
                                   readData11[3:0],
                                   readData10[3:0],
                                   readData9[3:0],
                                   readData8[3:0],
                                   readData7[3:0],
                                   readData6[3:0]
                                   };
                    end
                    3'b100, 3'b101 : begin
                       readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                    end
                    3'b110 : begin
                       readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                    end
                    default : begin
                        readData = 32'b0;
                    end
                endcase
            end

            512: begin
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9 = 3'b001;
                width8 = 3'b001;
                width7 = 3'b001;
                width6 = 3'b001;
                width5 = 3'b001;
                width4 = 3'b001;
                width3 = 3'b001;
                width2 = 3'b001;
                width1 = 3'b001;

                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9 = {writeAddr[8:0], 1'b0};
                writeAddr8 = {writeAddr[8:0], 1'b0};
                writeAddr7 = {writeAddr[8:0], 1'b0};
                writeAddr6 = {writeAddr[8:0], 1'b0};
                writeAddr5 = {writeAddr[8:0], 1'b0};
                writeAddr4 = {writeAddr[8:0], 1'b0};
                writeAddr3 = {writeAddr[8:0], 1'b0};
                writeAddr2 = {writeAddr[8:0], 1'b0};
                writeAddr1 = {writeAddr[8:0], 1'b0};

                readAddr16  = {readAddr[8:0],  1'b0};
                readAddr15  = {readAddr[8:0],  1'b0};
                readAddr14  = {readAddr[8:0],  1'b0};
                readAddr13  = {readAddr[8:0],  1'b0};
                readAddr12  = {readAddr[8:0],  1'b0};
                readAddr11  = {readAddr[8:0],  1'b0};
                readAddr10  = {readAddr[8:0],  1'b0};
                readAddr9  = {readAddr[8:0],  1'b0};
                readAddr8  = {readAddr[8:0],  1'b0};
                readAddr7  = {readAddr[8:0],  1'b0};
                readAddr6  = {readAddr[8:0],  1'b0};
                readAddr5  = {readAddr[8:0],  1'b0};
                readAddr4  = {readAddr[8:0],  1'b0};
                readAddr3  = {readAddr[8:0],  1'b0};
                readAddr2  = {readAddr[8:0],  1'b0};
                readAddr1  = {readAddr[8:0],  1'b0};

                writeData16 = {16'b0, writeData[31:30]};
                writeData15 = {16'b0, writeData[29:28]};
                writeData14 = {16'b0, writeData[27:26]};
                writeData13 = {16'b0, writeData[25:24]};
                writeData12 = {16'b0, writeData[23:22]};
                writeData11 = {16'b0, writeData[21:20]};
                writeData10 = {16'b0, writeData[19:18]};
                writeData9  = {16'b0, writeData[17:16]};
                writeData8  = {16'b0, writeData[15:14]};
                writeData7  = {16'b0, writeData[13:12]};
                writeData6  = {16'b0, writeData[11:10]};
                writeData5  = {16'b0, writeData[9:8]};
                writeData4  = {16'b0, writeData[7:6]};
                writeData3  = {16'b0, writeData[5:4]};
                writeData2  = {16'b0, writeData[3:2]};
                writeData1  = {16'b0, writeData[1:0]};  

                wen_a16 = wen;
                wen_a15 = wen;
                wen_a14 = wen;
                wen_a13 = wen;
                wen_a12 = wen;
                wen_a11 = wen;
                wen_a10 = wen;
                wen_a9  = wen;
                wen_a8  = wen;
                wen_a7  = wen;
                wen_a6  = wen;
                wen_a5  = wen;
                wen_a4  = wen;
                wen_a3  = wen;
                wen_a2  = wen;
                wen_a1  = wen;

               readData = {
                           readData16[1:0],
                           readData15[1:0],
                           readData14[1:0],
                           readData13[1:0],
                           readData12[1:0],
                           readData11[1:0],
                           readData10[1:0],
                           readData9[1:0],
                           readData8[1:0],
                           readData7[1:0],
                           readData6[1:0],
                           readData5[1:0],
                           readData4[1:0],
                           readData3[1:0],
                           readData2[1:0],
                           readData1[1:0]
                           };

            end

            576: begin
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b001;
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10= {writeAddr[8:0], 1'b0};
                writeAddr9 = {writeAddr[8:0], 1'b0};
                writeAddr8 = {writeAddr[8:0], 1'b0};
                writeAddr7 = {writeAddr[8:0], 1'b0};
                writeAddr6 = {writeAddr[8:0], 1'b0};
                writeAddr5 = {writeAddr[8:0], 1'b0};
                writeAddr4 = {writeAddr[8:0], 1'b0};
                writeAddr3 = {writeAddr[8:0], 1'b0};
                writeAddr2 = {writeAddr[8:0], 1'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr17  = {readAddr[8:0],  1'b0};
                readAddr16  = {readAddr[8:0],  1'b0};
                readAddr15  = {readAddr[8:0],  1'b0};
                readAddr14  = {readAddr[8:0],  1'b0};
                readAddr13  = {readAddr[8:0],  1'b0};
                readAddr12  = {readAddr[8:0],  1'b0};
                readAddr11  = {readAddr[8:0],  1'b0};
                readAddr10 = {readAddr[8:0],  1'b0};
                readAddr9  = {readAddr[8:0],  1'b0};
                readAddr8  = {readAddr[8:0],  1'b0};
                readAddr7  = {readAddr[8:0],  1'b0};
                readAddr6  = {readAddr[8:0],  1'b0};
                readAddr5  = {readAddr[8:0],  1'b0};
                readAddr4  = {readAddr[8:0],  1'b0};
                readAddr3  = {readAddr[8:0],  1'b0};
                readAddr2  = {readAddr[8:0],  1'b0};
                readAddr1 = {readAddr[5:0], 4'b0};
                readAddr0 = {readAddr[5:0], 4'b0};

                writeData17 = {16'b0, writeData[31:30]};
                writeData16 = {16'b0, writeData[29:28]};
                writeData15 = {16'b0, writeData[27:26]};
                writeData14 = {16'b0, writeData[25:24]};
                writeData13 = {16'b0, writeData[23:22]};
                writeData12 = {16'b0, writeData[21:20]};
                writeData11 = {16'b0, writeData[19:18]};
                writeData10= {16'b0, writeData[17:16]};
                writeData9 = {16'b0, writeData[15:14]};
                writeData8 = {16'b0, writeData[13:12]};
                writeData7 = {16'b0, writeData[11:10]};
                writeData6 = {16'b0, writeData[9:8]};
                writeData5 = {16'b0, writeData[7:6]};
                writeData4 = {16'b0, writeData[5:4]};
                writeData3 = {16'b0, writeData[3:2]};
                writeData2 = {16'b0, writeData[1:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    4'b1000 : begin
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

               case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0]
                                 };
                     
                  end
                  4'b1000 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

          640: begin
             //512x2   
             width19 = 3'b001;    
             width18 = 3'b001;
             width17 = 3'b001;
             width16 = 3'b001;
             width15 = 3'b001;
             width14 = 3'b001;
             width13 = 3'b001;
             width12 = 3'b001;
             width11 = 3'b001;
             width10 = 3'b001;
             width9  = 3'b001;
             width8  = 3'b001;
             width7  = 3'b001;
             width6  = 3'b001;
             width5  = 3'b001;
             width4  = 3'b001;
             // 128x8
             width3  = 3'b011;
             width2  = 3'b011;
             width1  = 3'b011;
             width0  = 3'b011;

             writeAddr19 = {writeAddr[8:0], 1'b0};
             writeAddr18 = {writeAddr[8:0], 1'b0};
             writeAddr17 = {writeAddr[8:0], 1'b0};
             writeAddr16 = {writeAddr[8:0], 1'b0};
             writeAddr15 = {writeAddr[8:0], 1'b0};
             writeAddr14 = {writeAddr[8:0], 1'b0};
             writeAddr13 = {writeAddr[8:0], 1'b0};
             writeAddr12 = {writeAddr[8:0], 1'b0};
             writeAddr11 = {writeAddr[8:0], 1'b0};
             writeAddr10= {writeAddr[8:0], 1'b0};
             writeAddr9 = {writeAddr[8:0], 1'b0};
             writeAddr8 = {writeAddr[8:0], 1'b0};
             writeAddr7 = {writeAddr[8:0], 1'b0};
             writeAddr6 = {writeAddr[8:0], 1'b0};
             writeAddr5 = {writeAddr[8:0], 1'b0};
             writeAddr4 = {writeAddr[8:0], 1'b0};
             writeAddr3 = {writeAddr[6:0], 3'b0};
             writeAddr2 = {writeAddr[6:0], 3'b0};
             writeAddr1 = {writeAddr[6:0], 3'b0};
             writeAddr0 = {writeAddr[6:0], 3'b0};

             readAddr19  = {readAddr[8:0],  1'b0};
             readAddr18  = {readAddr[8:0],  1'b0};
             readAddr17  = {readAddr[8:0],  1'b0};
             readAddr16  = {readAddr[8:0],  1'b0};
             readAddr15  = {readAddr[8:0],  1'b0};
             readAddr14  = {readAddr[8:0],  1'b0};
             readAddr13  = {readAddr[8:0],  1'b0};
             readAddr12  = {readAddr[8:0],  1'b0};
             readAddr11  = {readAddr[8:0],  1'b0};
             readAddr10 = {readAddr[8:0],  1'b0};
             readAddr9  = {readAddr[8:0],  1'b0};
             readAddr8  = {readAddr[8:0],  1'b0};
             readAddr7  = {readAddr[8:0],  1'b0};
             readAddr6  = {readAddr[8:0],  1'b0};
             readAddr5  = {readAddr[8:0],  1'b0};
             readAddr4  = {readAddr[8:0],  1'b0};
             readAddr3  = {readAddr[6:0],  3'b0};
             readAddr2  = {readAddr[6:0],  3'b0};
             readAddr1 = {readAddr[6:0], 3'b0};
             readAddr0 = {readAddr[6:0], 3'b0};

             writeData19 = {16'b0, writeData[31:30]};
             writeData18 = {16'b0, writeData[29:28]};
             writeData17 = {16'b0, writeData[27:26]};
             writeData16 = {16'b0, writeData[25:24]};
             writeData15 = {16'b0, writeData[23:22]};
             writeData14 = {16'b0, writeData[21:20]};
             writeData13 = {16'b0, writeData[19:18]};
             writeData12= {16'b0, writeData[17:16]};
             writeData11 = {16'b0, writeData[15:14]};
             writeData10 = {16'b0, writeData[13:12]};
             writeData9 = {16'b0, writeData[11:10]};
             writeData8 = {16'b0, writeData[9:8]};
             writeData7 = {16'b0, writeData[7:6]};
             writeData6 = {16'b0, writeData[5:4]};
             writeData5 = {16'b0, writeData[3:2]};
             writeData4 = {16'b0, writeData[1:0]};
             writeData3 = {10'b0, writeData[31:24]};
             writeData2 = {10'b0, writeData[23:16]};
             writeData1 = {10'b0, writeData[15:8]};
             writeData0 = {10'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    4'b1000, 4'b1001 : begin
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

               case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0]
                                 };
                     
                  end
                    4'b1000, 4'b1001 : begin
                       readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            704: begin
             //512x2   
             width21 = 3'b001;    
             width20 = 3'b001;
             width19 = 3'b001;
             width18 = 3'b001;
             width17 = 3'b001;
             width16 = 3'b001;
             width15 = 3'b001;
             width14 = 3'b001;
             width13 = 3'b001;
             width12 = 3'b001;
             width11 = 3'b001;
             width10 = 3'b001;
             width9  = 3'b001;
             width8  = 3'b001;
             width7  = 3'b001;
             width6  = 3'b001;
             // 128x8
             width5  = 3'b011;
             width4  = 3'b011;
             width3  = 3'b011;
             width2  = 3'b011;
             // 64x16
             width1  = 3'b100;
             width0  = 3'b100;
               
             writeAddr21 = {writeAddr[8:0], 1'b0};
             writeAddr20 = {writeAddr[8:0], 1'b0};
             writeAddr19 = {writeAddr[8:0], 1'b0};
             writeAddr18 = {writeAddr[8:0], 1'b0};
             writeAddr17 = {writeAddr[8:0], 1'b0};
             writeAddr16 = {writeAddr[8:0], 1'b0};
             writeAddr15 = {writeAddr[8:0], 1'b0};
             writeAddr14 = {writeAddr[8:0], 1'b0};
             writeAddr13 = {writeAddr[8:0], 1'b0};
             writeAddr12= {writeAddr[8:0], 1'b0};
             writeAddr11= {writeAddr[8:0], 1'b0};
             writeAddr10= {writeAddr[8:0], 1'b0};
             writeAddr9 = {writeAddr[8:0], 1'b0};
             writeAddr8 = {writeAddr[8:0], 1'b0};
             writeAddr7 = {writeAddr[8:0], 1'b0};
             writeAddr6 = {writeAddr[8:0], 1'b0};
             writeAddr5 = {writeAddr[6:0], 3'b0};
             writeAddr4 = {writeAddr[6:0], 3'b0};
             writeAddr3 = {writeAddr[6:0], 3'b0};
             writeAddr2 = {writeAddr[6:0], 3'b0};
             writeAddr1 = {writeAddr[5:0], 4'b0};
             writeAddr0 = {writeAddr[5:0], 4'b0};

             readAddr21  = {readAddr[8:0],  1'b0};
             readAddr20  = {readAddr[8:0],  1'b0};
             readAddr19  = {readAddr[8:0],  1'b0};
             readAddr18  = {readAddr[8:0],  1'b0};
             readAddr17  = {readAddr[8:0],  1'b0};
             readAddr16  = {readAddr[8:0],  1'b0};
             readAddr15  = {readAddr[8:0],  1'b0};
             readAddr14  = {readAddr[8:0],  1'b0};
             readAddr13  = {readAddr[8:0],  1'b0};
             readAddr12 = {readAddr[8:0],  1'b0};
             readAddr11 = {readAddr[8:0],  1'b0};
             readAddr10 = {readAddr[8:0],  1'b0};
             readAddr9  = {readAddr[8:0],  1'b0};
             readAddr8  = {readAddr[8:0],  1'b0};
             readAddr7  = {readAddr[8:0],  1'b0};
             readAddr6  = {readAddr[8:0],  1'b0};
             readAddr5  = {readAddr[6:0],  3'b0};
             readAddr4  = {readAddr[6:0],  3'b0};
             readAddr3  = {readAddr[6:0], 3'b0};
             readAddr2  = {readAddr[6:0], 3'b0};
             readAddr1 = {readAddr[5:0], 4'b0};
             readAddr0 = {readAddr[5:0], 4'b0};
               
             writeData21 = {16'b0, writeData[31:30]};
             writeData20 = {16'b0, writeData[29:28]};
             writeData19 = {16'b0, writeData[27:26]};
             writeData18 = {16'b0, writeData[25:24]};
             writeData17 = {16'b0, writeData[23:22]};
             writeData16 = {16'b0, writeData[21:20]};
             writeData15 = {16'b0, writeData[19:18]};
             writeData14 = {16'b0, writeData[17:16]};
             writeData13 = {16'b0, writeData[15:14]};
             writeData12 = {16'b0, writeData[13:12]};
             writeData11= {16'b0, writeData[11:10]};
             writeData10= {16'b0, writeData[9:8]};
             writeData9 = {16'b0, writeData[7:6]};
             writeData8 = {16'b0, writeData[5:4]};
             writeData7 = {16'b0, writeData[3:2]};
             writeData6 = {16'b0, writeData[1:0]};
             writeData5 = {10'b0, writeData[31:24]};
             writeData4 = {10'b0, writeData[23:16]};
             writeData3 = {10'b0, writeData[15:8]};
             writeData2 = {10'b0, writeData[7:0]};
             writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
             writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;

                    end
                    4'b1000, 4'b1001 : begin
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    4'b1010 : begin
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

               case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0]
                                 };
                     
                  end
                 4'b1000, 4'b1001 : begin
                    readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                 end
                 4'b1010 : begin
                    readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end


          768: begin
             //512x2   
             width23 = 3'b001;    
             width22 = 3'b001;
             width21 = 3'b001;    
             width20 = 3'b001;
             width19 = 3'b001;
             width18 = 3'b001;
             width17 = 3'b001;
             width16 = 3'b001;
             width15 = 3'b001;
             width14 = 3'b001;
             width13 = 3'b001;
             width12 = 3'b001;
             width11 = 3'b001;
             width10 = 3'b001;
             width9  = 3'b001;
             width8  = 3'b001;
             width7  = 3'b010;
             width6  = 3'b010;
             width5  = 3'b010;
             width4  = 3'b010;
             width3  = 3'b010;
             width2  = 3'b010;
             width1  = 3'b010;
             width0  = 3'b010;

             writeAddr23 = {writeAddr[8:0], 1'b0};
             writeAddr22 = {writeAddr[8:0], 1'b0};
             writeAddr21 = {writeAddr[8:0], 1'b0};
             writeAddr20 = {writeAddr[8:0], 1'b0};
             writeAddr19 = {writeAddr[8:0], 1'b0};
             writeAddr18 = {writeAddr[8:0], 1'b0};
             writeAddr17 = {writeAddr[8:0], 1'b0};
             writeAddr16 = {writeAddr[8:0], 1'b0};
             writeAddr15 = {writeAddr[8:0], 1'b0};
             writeAddr14 = {writeAddr[8:0], 1'b0};
             writeAddr13 = {writeAddr[8:0], 1'b0};
             writeAddr12 = {writeAddr[8:0], 1'b0};
             writeAddr11 = {writeAddr[8:0], 1'b0};
             writeAddr10 = {writeAddr[8:0], 1'b0};
             writeAddr9  = {writeAddr[8:0], 1'b0};
             writeAddr8  = {writeAddr[8:0], 1'b0};
             writeAddr7 = {writeAddr[7:0], 2'b0};
             writeAddr6 = {writeAddr[7:0], 2'b0};
             writeAddr5 = {writeAddr[7:0], 2'b0};
             writeAddr4 = {writeAddr[7:0], 2'b0};
             writeAddr3 = {writeAddr[7:0], 2'b0};
             writeAddr2 = {writeAddr[7:0], 2'b0};
             writeAddr1 = {writeAddr[7:0], 2'b0};
             writeAddr0 = {writeAddr[7:0], 2'b0};
             
             readAddr23 = {readAddr[8:0],  1'b0};
             readAddr22 = {readAddr[8:0],  1'b0};
             readAddr21 = {readAddr[8:0],  1'b0};
             readAddr20 = {readAddr[8:0],  1'b0};
             readAddr19 = {readAddr[8:0],  1'b0};
             readAddr18 = {readAddr[8:0],  1'b0};
             readAddr17 = {readAddr[8:0],  1'b0};
             readAddr16 = {readAddr[8:0],  1'b0};
             readAddr15 = {readAddr[8:0],  1'b0};
             readAddr14 = {readAddr[8:0],  1'b0};
             readAddr13 = {readAddr[8:0],  1'b0};
             readAddr12 = {readAddr[8:0],  1'b0};
             readAddr11 = {readAddr[8:0],  1'b0};
             readAddr10 = {readAddr[8:0],  1'b0};
             readAddr9  = {readAddr[8:0],  1'b0};
             readAddr8  = {readAddr[8:0],  1'b0};
             readAddr7  = {readAddr[7:0], 2'b0};
             readAddr6  = {readAddr[7:0], 2'b0};
             readAddr5  = {readAddr[7:0], 2'b0};
             readAddr4  = {readAddr[7:0], 2'b0};
             readAddr3  = {readAddr[7:0], 2'b0};
             readAddr2  = {readAddr[7:0], 2'b0};
             readAddr1  = {readAddr[7:0], 2'b0};
             readAddr0  = {readAddr[7:0], 2'b0};


             writeData23 = {16'b0, writeData[31:30]};
             writeData22 = {16'b0, writeData[29:28]};
             writeData21 = {16'b0, writeData[27:26]};
             writeData20 = {16'b0, writeData[25:24]};
             writeData19 = {16'b0, writeData[23:22]};
             writeData18 = {16'b0, writeData[21:20]};
             writeData17 = {16'b0, writeData[19:18]};
             writeData16= {16'b0, writeData[17:16]};
             writeData15= {16'b0, writeData[15:14]};
             writeData14= {16'b0, writeData[13:12]};
             writeData13= {16'b0, writeData[11:10]};
             writeData12= {16'b0, writeData[9:8]};
             writeData11= {16'b0, writeData[7:6]};
             writeData10= {16'b0, writeData[5:4]};
             writeData9 = {16'b0, writeData[3:2]};
             writeData8 = {16'b0, writeData[1:0]};
             writeData7 = {14'b0, writeData[31:28]};
             writeData6 = {14'b0, writeData[27:24]};
             writeData5 = {14'b0, writeData[23:20]};
             writeData4 = {14'b0, writeData[19:16]};
             writeData3 = {14'b0, writeData[15:12]};
             writeData2 = {14'b0, writeData[11:8]};
             writeData1 = {14'b0, writeData[7:4]};
             writeData0 = {14'b0, writeData[3:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

             case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11 [1:0],
                                 readData10 [1:0],
                                 readData9  [1:0],
                                 readData8  [1:0]
                                 };
                     
                  end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData7[3:0],readData6[3:0],readData5[3:0],readData4[3:0],readData3[3:0],readData2[3:0],readData1[3:0],readData0[3:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

            832: begin
               //512x2
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18= 3'b001;
                width17= 3'b001;
                width16= 3'b001;
                width15= 3'b001;
                width14= 3'b001;
                width13= 3'b001;
                width12= 3'b001;
                width11= 3'b001;
                width10= 3'b001;
               //256x4
                width9 = 3'b010;
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
                width5 = 3'b010;
                width4 = 3'b010;
                width3 = 3'b010;
                width2 = 3'b010;
               //64x16
                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18= {writeAddr[8:0], 1'b0};
                writeAddr17= {writeAddr[8:0], 1'b0};
                writeAddr16= {writeAddr[8:0], 1'b0};
                writeAddr15= {writeAddr[8:0], 1'b0};
                writeAddr14= {writeAddr[8:0], 1'b0};
                writeAddr13= {writeAddr[8:0], 1'b0};
                writeAddr12= {writeAddr[8:0], 1'b0};
                writeAddr11= {writeAddr[8:0], 1'b0};
                writeAddr10= {writeAddr[8:0], 1'b0};
                writeAddr9 = {writeAddr[7:0], 2'b0};
                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[7:0], 2'b0};
                writeAddr4 = {writeAddr[7:0], 2'b0};
                writeAddr3 = {writeAddr[7:0], 2'b0};
                writeAddr2 = {writeAddr[7:0], 2'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18= {readAddr[8:0], 1'b0};
                readAddr17= {readAddr[8:0], 1'b0};
                readAddr16= {readAddr[8:0], 1'b0};
                readAddr15= {readAddr[8:0], 1'b0};
                readAddr14= {readAddr[8:0], 1'b0};
                readAddr13= {readAddr[8:0], 1'b0};
                readAddr12= {readAddr[8:0], 1'b0};
                readAddr11= {readAddr[8:0], 1'b0};
                readAddr10= {readAddr[8:0], 1'b0};
                readAddr9 = {readAddr[7:0], 2'b0};
                readAddr8 = {readAddr[7:0], 2'b0};
                readAddr7 = {readAddr[7:0], 2'b0};
                readAddr6 = {readAddr[7:0], 2'b0};
                readAddr5 = {readAddr[7:0], 2'b0};
                readAddr4 = {readAddr[7:0], 2'b0};
                readAddr3 = {readAddr[7:0], 2'b0};
                readAddr2 = {readAddr[7:0], 2'b0};
                readAddr1 = {readAddr[5:0], 4'b0};
                readAddr0 = {readAddr[5:0], 4'b0};

                writeData25 = {16'b0, writeData[31:30]};
                writeData24 = {16'b0, writeData[29:28]};
                writeData23 = {16'b0, writeData[27:26]};
                writeData22 = {16'b0, writeData[25:24]};
                writeData21 = {16'b0, writeData[23:22]};
                writeData20 = {16'b0, writeData[21:20]};
                writeData19 = {16'b0, writeData[19:18]};
                writeData18 = {16'b0, writeData[17:16]};
                writeData17 = {16'b0, writeData[15:14]};
                writeData16 = {16'b0, writeData[13:12]};
                writeData15 = {16'b0, writeData[11:10]};
                writeData14 = {16'b0, writeData[9:8]};
                writeData13 = {16'b0, writeData[7:6]};
                writeData12 = {16'b0, writeData[5:4]};
                writeData11 = {16'b0, writeData[3:2]};
                writeData10 = {16'b0, writeData[1:0]};
                writeData9  = {14'b0, writeData[31:28]};
                writeData8  = {14'b0, writeData[27:24]};
                writeData7  = {14'b0, writeData[23:20]};
                writeData6  = {14'b0, writeData[19:16]};
                writeData5  = {14'b0, writeData[15:12]};
                writeData4  = {14'b0, writeData[11:8]};
                writeData3  = {14'b0, writeData[7:4]};
                writeData2  = {14'b0, writeData[3:0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               4'b1100 : begin
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

             case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0]
                                 };
                     
                  end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData9[3:0],readData8[3:0],readData7[3:0],readData6[3:0],readData5[3:0],readData4[3:0],readData3[3:0],readData2[3:0]};
                 end
                 4'b1100 : begin
                    readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
             endcase               
            end

            896: begin
               //512x2
                width27 = 3'b001;
                width26 = 3'b001;
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18= 3'b001;
                width17= 3'b001;
                width16= 3'b001;
                width15= 3'b001;
                width14= 3'b001;
                width13= 3'b001;
                width12= 3'b001;
               //256x4
                width11= 3'b010;
                width10= 3'b010;
                width9 = 3'b010;
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
                width5 = 3'b010;
                width4 = 3'b010;
               //128x8
                width3 = 3'b011;
                width2 = 3'b011;
                width1 = 3'b011;
                width0 = 3'b011;

                writeAddr27 = {writeAddr[8:0], 1'b0};
                writeAddr26 = {writeAddr[8:0], 1'b0};
                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18= {writeAddr[8:0], 1'b0};
                writeAddr17= {writeAddr[8:0], 1'b0};
                writeAddr16= {writeAddr[8:0], 1'b0};
                writeAddr15= {writeAddr[8:0], 1'b0};
                writeAddr14= {writeAddr[8:0], 1'b0};
                writeAddr13= {writeAddr[8:0], 1'b0};
                writeAddr12= {writeAddr[8:0], 1'b0};
                writeAddr11= {writeAddr[7:0], 2'b0};
                writeAddr10= {writeAddr[7:0], 2'b0};
                writeAddr9 = {writeAddr[7:0], 2'b0};
                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[7:0], 2'b0};
                writeAddr4 = {writeAddr[7:0], 2'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[6:0], 3'b0};
                writeAddr0 = {writeAddr[6:0], 3'b0};

                readAddr27 = {readAddr[8:0], 1'b0};
                readAddr26 = {readAddr[8:0], 1'b0};
                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9 = {readAddr[7:0], 2'b0};
                readAddr8 = {readAddr[7:0], 2'b0};
                readAddr7 = {readAddr[7:0], 2'b0};
                readAddr6 = {readAddr[7:0], 2'b0};
                readAddr5 = {readAddr[7:0], 2'b0};
                readAddr4 = {readAddr[7:0], 2'b0};
                readAddr3 = {readAddr[6:0], 3'b0};
                readAddr2 = {readAddr[6:0], 3'b0};
                readAddr1 = {readAddr[6:0], 3'b0};
                readAddr0 = {readAddr[6:0], 3'b0};

                writeData27 = {16'b0, writeData[31:30]};
                writeData26 = {16'b0, writeData[29:28]};
                writeData25 = {16'b0, writeData[27:26]};
                writeData24 = {16'b0, writeData[25:24]};
                writeData23 = {16'b0, writeData[23:22]};
                writeData22 = {16'b0, writeData[21:20]};
                writeData21 = {16'b0, writeData[19:18]};
                writeData20 = {16'b0, writeData[17:16]};
                writeData19 = {16'b0, writeData[15:14]};
                writeData18 = {16'b0, writeData[13:12]};
                writeData17 = {16'b0, writeData[11:10]};
                writeData16 = {16'b0, writeData[9:8]};
                writeData15 = {16'b0, writeData[7:6]};
                writeData14 = {16'b0, writeData[5:4]};
                writeData13 = {16'b0, writeData[3:2]};
                writeData12 = {16'b0, writeData[1:0]};
                writeData11 = {14'b0, writeData[31:28]};
                writeData10 = {14'b0, writeData[27:24]};
                writeData9  = {14'b0, writeData[23:20]};
                writeData8  = {14'b0, writeData[19:16]};
                writeData7  = {14'b0, writeData[15:12]};
                writeData6  = {14'b0, writeData[11:8]};
                writeData5  = {14'b0, writeData[7:4]};
                writeData4  = {14'b0, writeData[3:0]};
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]};
                writeData0  = {10'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               4'b1100, 4'b1101 : begin
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

             case (ckRdAddr[9:6])
                  4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                     readData = {
                                 readData27[1:0],
                                 readData26[1:0],
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0]
                                 };                     
                  end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData11[3:0],readData10[3:0],readData9[3:0],readData8[3:0],readData7[3:0],readData6[3:0],readData5[3:0],readData4[3:0]};
                 end
                 4'b1100, 4'b1101 : begin
                    readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
             endcase
            end

            960: begin
               //512x2
                width29 = 3'b001;
                width28 = 3'b001;
                width27 = 3'b001;
                width26 = 3'b001;
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
               //256x4
                width13= 3'b010;
                width12= 3'b010;
                width11= 3'b010;
                width10= 3'b010;
                width9 = 3'b010;
                width8 = 3'b010;
                width7 = 3'b010;
                width6 = 3'b010;
               //128x8
                width5 = 3'b011;
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
               //64x16
                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr29 = {writeAddr[8:0], 1'b0};
                writeAddr28 = {writeAddr[8:0], 1'b0};
                writeAddr27 = {writeAddr[8:0], 1'b0};
                writeAddr26 = {writeAddr[8:0], 1'b0};
                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[7:0], 2'b0};
                writeAddr12 = {writeAddr[7:0], 2'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9 = {writeAddr[7:0], 2'b0};
                writeAddr8 = {writeAddr[7:0], 2'b0};
                writeAddr7 = {writeAddr[7:0], 2'b0};
                writeAddr6 = {writeAddr[7:0], 2'b0};
                writeAddr5 = {writeAddr[6:0], 3'b0};
                writeAddr4 = {writeAddr[6:0], 3'b0};
                writeAddr3 = {writeAddr[6:0], 3'b0};
                writeAddr2 = {writeAddr[6:0], 3'b0};
                writeAddr1 = {writeAddr[5:0], 4'b0};
                writeAddr0 = {writeAddr[5:0], 4'b0};

                readAddr29 = {readAddr[8:0], 1'b0};
                readAddr28 = {readAddr[8:0], 1'b0};
                readAddr27 = {readAddr[8:0], 1'b0};
                readAddr26 = {readAddr[8:0], 1'b0};
                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[7:0], 2'b0};
                readAddr12 = {readAddr[7:0], 2'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9 = {readAddr[7:0], 2'b0};
                readAddr8 = {readAddr[7:0], 2'b0};
                readAddr7 = {readAddr[7:0], 2'b0};
                readAddr6 = {readAddr[7:0], 2'b0};
                readAddr5 = {readAddr[6:0], 3'b0};
                readAddr4 = {readAddr[6:0], 3'b0};
                readAddr3 = {readAddr[6:0], 3'b0};
                readAddr2 = {readAddr[6:0], 3'b0};
                readAddr1 = {readAddr[5:0], 4'b0};
                readAddr0 = {readAddr[5:0], 4'b0};

                writeData29 = {16'b0, writeData[31:30]};
                writeData28 = {16'b0, writeData[29:28]};
                writeData27 = {16'b0, writeData[27:26]};
                writeData26 = {16'b0, writeData[25:24]};
                writeData25 = {16'b0, writeData[23:22]};
                writeData24 = {16'b0, writeData[21:20]};
                writeData23 = {16'b0, writeData[19:18]};
                writeData22 = {16'b0, writeData[17:16]};
                writeData21 = {16'b0, writeData[15:14]};
                writeData20 = {16'b0, writeData[13:12]};
                writeData19 = {16'b0, writeData[11:10]};
                writeData18 = {16'b0, writeData[9:8]};
                writeData17 = {16'b0, writeData[7:6]};
                writeData16 = {16'b0, writeData[5:4]};
                writeData15 = {16'b0, writeData[3:2]};
                writeData14 = {16'b0, writeData[1:0]};
                writeData13 = {14'b0, writeData[31:28]};
                writeData12 = {14'b0, writeData[27:24]};
                writeData11 = {14'b0, writeData[23:20]};
                writeData10 = {14'b0, writeData[19:16]};
                writeData9 = {14'b0, writeData[15:12]};
                writeData8 = {14'b0, writeData[11:8]};
                writeData7 = {14'b0, writeData[7:4]};
                writeData6 = {14'b0, writeData[3:0]};
                writeData5 = {10'b0, writeData[31:24]};
                writeData4 = {10'b0, writeData[23:16]};
                writeData3 = {10'b0, writeData[15:8]};
                writeData2 = {10'b0, writeData[7:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

             case (writeAddr[9:6])
                    4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
               4'b1000, 4'b1001, 4'b1010, 4'b1011 : begin
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               4'b1100, 4'b1101 : begin
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               4'b1110 : begin
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
               default : begin
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
             endcase

               case (ckRdAddr[9:6])
                 4'b0000 ,4'b0001, 4'b0010, 4'b0011, 4'b0100, 4'b0101, 4'b0110, 4'b0111 : begin
                    readData = {
                                 readData29[1:0],
                                 readData28[1:0],
                                 readData27[1:0],
                                 readData26[1:0],
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0]
                                };                     
                 end
                 4'b1000, 4'b1001,4'b1010, 4'b1011 : begin
                    readData = {readData13[3:0],readData12[3:0],readData11[3:0],readData10[3:0],readData9[3:0],readData8[3:0],readData7[3:0],readData6[3:0]};
                 end
                 4'b1100, 4'b1101 : begin
                    readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                 end
                 4'b1110 : begin
                    readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

            1024: begin
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0  = writeAddr[9:0];

                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0  = readAddr[9:0]; 

                writeData31 = {17'b0, writeData[31]};
                writeData30 = {17'b0, writeData[30]};
                writeData29 = {17'b0, writeData[29]};
                writeData28 = {17'b0, writeData[28]};
                writeData27 = {17'b0, writeData[27]};
                writeData26 = {17'b0, writeData[26]};
                writeData25 = {17'b0, writeData[25]};
                writeData24 = {17'b0, writeData[24]};
                writeData23 = {17'b0, writeData[23]};
                writeData22 = {17'b0, writeData[22]};
                writeData21 = {17'b0, writeData[21]};
                writeData20 = {17'b0, writeData[20]};
                writeData19 = {17'b0, writeData[19]};
                writeData18 = {17'b0, writeData[18]};
                writeData17 = {17'b0, writeData[17]};
                writeData16 = {17'b0, writeData[16]};
                writeData15 = {17'b0, writeData[15]};
                writeData14 = {17'b0, writeData[14]};
                writeData13 = {17'b0, writeData[13]};
                writeData12 = {17'b0, writeData[12]};
                writeData11 = {17'b0, writeData[11]};
                writeData10 = {17'b0, writeData[10]};
                writeData9  = {17'b0, writeData[9]};
                writeData8  = {17'b0, writeData[8]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               wen_a31 = wen;
               wen_a30 = wen;
               wen_a29 = wen;
               wen_a28 = wen;
               wen_a27 = wen;
               wen_a26 = wen;
               wen_a25 = wen;
               wen_a24 = wen;
               wen_a23 = wen;
               wen_a22 = wen;
               wen_a21 = wen;
               wen_a20 = wen;
               wen_a19 = wen;
               wen_a18 = wen;
               wen_a17 = wen;
               wen_a16 = wen;
               wen_a15 = wen;
               wen_a14 = wen;
               wen_a13 = wen;
               wen_a12 = wen;
               wen_a11 = wen;
               wen_a10 = wen;
               wen_a9  = wen;
               wen_a8  = wen;
               wen_a7  = wen;
               wen_a6  = wen;
               wen_a5  = wen;
               wen_a4  = wen;
               wen_a3  = wen;
               wen_a2  = wen;
               wen_a1  = wen;
               wen_a0  = wen;

               readData = {
                           readData31[0],
                           readData30[0],
                           readData29[0],
                           readData28[0],
                           readData27[0],
                           readData26[0],
                           readData25[0],
                           readData24[0],
                           readData23[0],
                           readData22[0],
                           readData21[0],
                           readData20[0],
                           readData19[0],
                           readData18[0],
                           readData17[0],
                           readData16[0],
                           readData15[0],
                           readData14[0],
                           readData13[0],
                           readData12[0],
                           readData11[0],
                           readData10[0],
                           readData9[0],
                           readData8[0],
                           readData7[0],
                           readData6[0],
                           readData5[0],
                           readData4[0],
                           readData3[0],
                           readData2[0],
                           readData1[0],
                           readData0[0]
                           };
            end

            1088: begin
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = {writeAddr[5:0],  4'b0};
                writeAddr0  = {writeAddr[5:0],  4'b0};

                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};               

                writeData33 = {17'b0, writeData[31]};
                writeData32 = {17'b0, writeData[30]};
                writeData31 = {17'b0, writeData[29]};
                writeData30 = {17'b0, writeData[28]};
                writeData29 = {17'b0, writeData[27]};
                writeData28 = {17'b0, writeData[26]};
                writeData27 = {17'b0, writeData[25]};
                writeData26= {17'b0, writeData[24]};
                writeData25= {17'b0, writeData[23]};
                writeData24= {17'b0, writeData[22]};
                writeData23= {17'b0, writeData[21]};
                writeData22= {17'b0, writeData[20]};
                writeData21= {17'b0, writeData[19]};
                writeData20= {17'b0, writeData[18]};
                writeData19= {17'b0, writeData[17]};
                writeData18= {17'b0, writeData[16]};
                writeData17 = {17'b0, writeData[15]};
                writeData16 = {17'b0, writeData[14]};
                writeData15 = {17'b0, writeData[13]};
                writeData14 = {17'b0, writeData[12]};
                writeData13 = {17'b0, writeData[11]};
                writeData12 = {17'b0, writeData[10]};
                writeData11 = {17'b0, writeData[9]};
                writeData10 = {17'b0, writeData[8]};
                writeData9  = {17'b0, writeData[7]};
                writeData8  = {17'b0, writeData[6]};
                writeData7  = {17'b0, writeData[5]};
                writeData6  = {17'b0, writeData[4]};
                writeData5  = {17'b0, writeData[3]};
                writeData4  = {17'b0, writeData[2]};
                writeData3  = {17'b0, writeData[1]};
                writeData2  = {17'b0, writeData[0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000 : begin
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0],
                                   readData3[0],
                                   readData2[0]
                                   };
                    end
                  5'b10000 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end


            1152: begin
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[6:0], 3'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[6:0],  3'b0};
                readAddr0  = {readAddr[6:0],  3'b0};               

                writeData35 = {17'b0, writeData[31]};
                writeData34 = {17'b0, writeData[30]};
                writeData33 = {17'b0, writeData[29]};
                writeData32 = {17'b0, writeData[28]};
                writeData31 = {17'b0, writeData[27]};
                writeData30 = {17'b0, writeData[26]};
                writeData29 = {17'b0, writeData[25]};
                writeData28 = {17'b0, writeData[24]};
                writeData27 = {17'b0, writeData[23]};
                writeData26 = {17'b0, writeData[22]};
                writeData25 = {17'b0, writeData[21]};
                writeData24 = {17'b0, writeData[20]};
                writeData23 = {17'b0, writeData[19]};
                writeData22 = {17'b0, writeData[18]};
                writeData21 = {17'b0, writeData[17]};
                writeData20 = {17'b0, writeData[16]};
                writeData19 = {17'b0, writeData[15]};
                writeData18 = {17'b0, writeData[14]};
                writeData17 = {17'b0, writeData[13]};
                writeData16 = {17'b0, writeData[12]};
                writeData15 = {17'b0, writeData[11]};
                writeData14 = {17'b0, writeData[10]};
                writeData13 = {17'b0, writeData[9]};
                writeData12 = {17'b0, writeData[8]};
                writeData11 = {17'b0, writeData[7]};
                writeData10 = {17'b0, writeData[6]};
                writeData9  = {17'b0, writeData[5]};
                writeData8  = {17'b0, writeData[4]};
                writeData7  = {17'b0, writeData[3]};
                writeData6  = {17'b0, writeData[2]};
                writeData5  = {17'b0, writeData[1]};
                writeData4  = {17'b0, writeData[0]};
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]};
                writeData0  = {10'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001 : begin
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0],
                                   readData5[0],
                                   readData4[0]
                                   };
                    end
                  5'b10000, 5'b10001 : begin
                     readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1216: begin
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5 = 3'b011;
                width4 = 3'b011;
                width3 = 3'b011;
                width2 = 3'b011;
                width1 = 3'b100;
                width0 = 3'b100;

                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = {writeAddr[6:0], 3'b0};
                writeAddr4  = {writeAddr[6:0], 3'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = {readAddr[6:0],  3'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};               

                writeData37 = {17'b0, writeData[31]};
                writeData36 = {17'b0, writeData[30]};
                writeData35 = {17'b0, writeData[29]};
                writeData34 = {17'b0, writeData[28]};
                writeData33 = {17'b0, writeData[27]};
                writeData32 = {17'b0, writeData[26]};
                writeData31 = {17'b0, writeData[25]};
                writeData30 = {17'b0, writeData[24]};
                writeData29 = {17'b0, writeData[23]};
                writeData28 = {17'b0, writeData[22]};
                writeData27 = {17'b0, writeData[21]};
                writeData26 = {17'b0, writeData[20]};
                writeData25 = {17'b0, writeData[19]};
                writeData24 = {17'b0, writeData[18]};
                writeData23 = {17'b0, writeData[17]};
                writeData22 = {17'b0, writeData[16]};
                writeData21 = {17'b0, writeData[15]};
                writeData20 = {17'b0, writeData[14]};
                writeData19 = {17'b0, writeData[13]};
                writeData18 = {17'b0, writeData[12]};
                writeData17 = {17'b0, writeData[11]};
                writeData16 = {17'b0, writeData[10]};
                writeData15 = {17'b0, writeData[9]};
                writeData14 = {17'b0, writeData[8]};
                writeData13 = {17'b0, writeData[7]};
                writeData12 = {17'b0, writeData[6]};
                writeData11 = {17'b0, writeData[5]};
                writeData10 = {17'b0, writeData[4]};
                writeData9  = {17'b0, writeData[3]};
                writeData8  = {17'b0, writeData[2]};
                writeData7  = {17'b0, writeData[1]};
                writeData6  = {17'b0, writeData[0]};
                writeData5  = {10'b0, writeData[31:24]};
                writeData4  = {10'b0, writeData[23:16]};
                writeData3  = {10'b0, writeData[15:8]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001 : begin
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10010 : begin
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0],
                                   readData7[0],
                                   readData6[0]
                                   };
                    end
                  5'b10000, 5'b10001 : begin
                     readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                  end
                  5'b10010 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1280: begin
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b010;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b010;

                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[7:0], 2'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[7:0], 2'b0};

                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = {readAddr[7:0],  2'b0};
                readAddr6  = {readAddr[7:0],  2'b0};
                readAddr5  = {readAddr[7:0],  2'b0};
                readAddr4  = {readAddr[7:0],  2'b0};
                readAddr3  = {readAddr[7:0],  2'b0};
                readAddr2  = {readAddr[7:0],  2'b0};
                readAddr1  = {readAddr[7:0],  2'b0};
                readAddr0  = {readAddr[7:0],  2'b0};               

                writeData39 = {17'b0, writeData[31]};
                writeData38 = {17'b0, writeData[30]};
                writeData37 = {17'b0, writeData[29]};
                writeData36 = {17'b0, writeData[28]};
                writeData35 = {17'b0, writeData[27]};
                writeData34 = {17'b0, writeData[26]};
                writeData33 = {17'b0, writeData[25]};
                writeData32 = {17'b0, writeData[24]};
                writeData31 = {17'b0, writeData[23]};
                writeData30 = {17'b0, writeData[22]};
                writeData29 = {17'b0, writeData[21]};
                writeData28 = {17'b0, writeData[20]};
                writeData27 = {17'b0, writeData[19]};
                writeData26 = {17'b0, writeData[18]};
                writeData25 = {17'b0, writeData[17]};
                writeData24 = {17'b0, writeData[16]};
                writeData23 = {17'b0, writeData[15]};
                writeData22 = {17'b0, writeData[14]};
                writeData21 = {17'b0, writeData[13]};
                writeData20 = {17'b0, writeData[12]};
                writeData19 = {17'b0, writeData[11]};
                writeData18 = {17'b0, writeData[10]};
                writeData17 = {17'b0, writeData[9]};
                writeData16 = {17'b0, writeData[8]};
                writeData15 = {17'b0, writeData[7]};
                writeData14 = {17'b0, writeData[6]};
                writeData13 = {17'b0, writeData[5]};
                writeData12 = {17'b0, writeData[4]};
                writeData11 = {17'b0, writeData[3]};
                writeData10 = {17'b0, writeData[2]};
                writeData9  = {17'b0, writeData[1]};
                writeData8  = {17'b0, writeData[0]};
                writeData7  = {14'b0, writeData[31:28]}; 
                writeData6  = {14'b0, writeData[27:24]}; 
                writeData5  = {14'b0, writeData[23:20]}; 
                writeData4  = {14'b0, writeData[19:16]}; 
                writeData3  = {14'b0, writeData[15:12]}; 
                writeData2  = {14'b0, writeData[11:8]};  
                writeData1  = {14'b0, writeData[7:4]};   
                writeData0  = {14'b0, writeData[3:0]};   

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0],
                                   readData9[0],
                                   readData8[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = {
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0],
                                 readData3[3:0],
                                 readData2[3:0],
                                 readData1[3:0],
                                 readData0[3:0]
                                 };
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1344: begin
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b010;
                width2  = 3'b010;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[7:0], 2'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = {readAddr[7:0],  2'b0};
                readAddr8  = {readAddr[7:0],  2'b0};
                readAddr7  = {readAddr[7:0],  2'b0};
                readAddr6  = {readAddr[7:0],  2'b0};
                readAddr5  = {readAddr[7:0],  2'b0};
                readAddr4  = {readAddr[7:0],  2'b0};
                readAddr3  = {readAddr[7:0],  2'b0};
                readAddr2  = {readAddr[7:0],  2'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};               

                writeData41 = {17'b0, writeData[31]};
                writeData40 = {17'b0, writeData[30]};
                writeData39 = {17'b0, writeData[29]};
                writeData38 = {17'b0, writeData[28]};
                writeData37 = {17'b0, writeData[27]};
                writeData36 = {17'b0, writeData[26]};
                writeData35 = {17'b0, writeData[25]};
                writeData34 = {17'b0, writeData[24]};
                writeData33 = {17'b0, writeData[23]};
                writeData32 = {17'b0, writeData[22]};
                writeData31 = {17'b0, writeData[21]};
                writeData30 = {17'b0, writeData[20]};
                writeData29 = {17'b0, writeData[19]};
                writeData28 = {17'b0, writeData[18]};
                writeData27 = {17'b0, writeData[17]};
                writeData26 = {17'b0, writeData[16]};
                writeData25 = {17'b0, writeData[15]};
                writeData24 = {17'b0, writeData[14]};
                writeData23 = {17'b0, writeData[13]};
                writeData22 = {17'b0, writeData[12]};
                writeData21 = {17'b0, writeData[11]};
                writeData20 = {17'b0, writeData[10]};
                writeData19 = {17'b0, writeData[9]};
                writeData18 = {17'b0, writeData[8]};
                writeData17 = {17'b0, writeData[7]};
                writeData16 = {17'b0, writeData[6]};
                writeData15 = {17'b0, writeData[5]};
                writeData14 = {17'b0, writeData[4]};
                writeData13 = {17'b0, writeData[3]};
                writeData12 = {17'b0, writeData[2]};
                writeData11 = {17'b0, writeData[1]};
                writeData10 = {17'b0, writeData[0]};
                writeData9  = {14'b0, writeData[31:28]}; 
                writeData8  = {14'b0, writeData[27:24]}; 
                writeData7  = {14'b0, writeData[23:20]}; 
                writeData6  = {14'b0, writeData[19:16]}; 
                writeData5  = {14'b0, writeData[15:12]}; 
                writeData4  = {14'b0, writeData[11:8]};  
                writeData3  = {14'b0, writeData[7:4]};   
                writeData2  = {14'b0, writeData[3:0]};   
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10100 : begin
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0],
                                   readData11[0],
                                   readData10[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = {
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0],
                                 readData3[3:0],
                                 readData2[3:0]
                                 };
                  end
                  5'b10100 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end


            1408: begin
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b010;
                width10 = 3'b010;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[6:0], 3'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = {readAddr[7:0],  2'b0};
                readAddr10 = {readAddr[7:0],  2'b0};
                readAddr9  = {readAddr[7:0],  2'b0};
                readAddr8  = {readAddr[7:0],  2'b0};
                readAddr7  = {readAddr[7:0],  2'b0};
                readAddr6  = {readAddr[7:0],  2'b0};
                readAddr5  = {readAddr[7:0],  2'b0};
                readAddr4  = {readAddr[7:0],  2'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[6:0],  3'b0};
                readAddr0  = {readAddr[6:0],  3'b0};               

                writeData43 = {17'b0, writeData[31]};
                writeData42 = {17'b0, writeData[30]};
                writeData41 = {17'b0, writeData[29]};
                writeData40 = {17'b0, writeData[28]};
                writeData39 = {17'b0, writeData[27]};
                writeData38 = {17'b0, writeData[26]};
                writeData37 = {17'b0, writeData[25]};
                writeData36 = {17'b0, writeData[24]};
                writeData35 = {17'b0, writeData[23]};
                writeData34 = {17'b0, writeData[22]};
                writeData33 = {17'b0, writeData[21]};
                writeData32 = {17'b0, writeData[20]};
                writeData31 = {17'b0, writeData[19]};
                writeData30 = {17'b0, writeData[18]};
                writeData29 = {17'b0, writeData[17]};
                writeData28 = {17'b0, writeData[16]};
                writeData27 = {17'b0, writeData[15]};
                writeData26 = {17'b0, writeData[14]};
                writeData25 = {17'b0, writeData[13]};
                writeData24 = {17'b0, writeData[12]};
                writeData23 = {17'b0, writeData[11]};
                writeData22 = {17'b0, writeData[10]};
                writeData21 = {17'b0, writeData[9]};
                writeData20 = {17'b0, writeData[8]};
                writeData19 = {17'b0, writeData[7]};
                writeData18 = {17'b0, writeData[6]};
                writeData17 = {17'b0, writeData[5]};
                writeData16 = {17'b0, writeData[4]};
                writeData15 = {17'b0, writeData[3]};
                writeData14 = {17'b0, writeData[2]};
                writeData13 = {17'b0, writeData[1]};
                writeData12 = {17'b0, writeData[0]};
                writeData11 = {14'b0, writeData[31:28]}; 
                writeData10 = {14'b0, writeData[27:24]}; 
                writeData9  = {14'b0, writeData[23:20]}; 
                writeData8  = {14'b0, writeData[19:16]}; 
                writeData7  = {14'b0, writeData[15:12]}; 
                writeData6  = {14'b0, writeData[11:8]};  
                writeData5  = {14'b0, writeData[7:4]};   
                writeData4  = {14'b0, writeData[3:0]};   
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]}; 
                writeData0  = {10'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10100, 5'b10101 : begin
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0],
                                   readData13[0],
                                   readData12[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = {
                                 readData11[3:0],
                                 readData10[3:0],
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0]
                                 };
                  end
                  5'b10100, 5'b10101 : begin
                     readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end


            1472: begin
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b010;
                width12 = 3'b010;
                width11 = 3'b010;
                width10 = 3'b010;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = {writeAddr[7:0], 2'b0};
                writeAddr12 = {writeAddr[7:0], 2'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[6:0], 3'b0};
                writeAddr4  = {writeAddr[6:0], 3'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = {readAddr[7:0],  2'b0};
                readAddr12 = {readAddr[7:0],  2'b0};
                readAddr11 = {readAddr[7:0],  2'b0};
                readAddr10 = {readAddr[7:0],  2'b0};
                readAddr9  = {readAddr[7:0],  2'b0};
                readAddr8  = {readAddr[7:0],  2'b0};
                readAddr7  = {readAddr[7:0],  2'b0};
                readAddr6  = {readAddr[7:0],  2'b0};
                readAddr5  = {readAddr[6:0],  3'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};               

                writeData45 = {17'b0, writeData[31]};
                writeData44 = {17'b0, writeData[30]};
                writeData43 = {17'b0, writeData[29]};
                writeData42 = {17'b0, writeData[28]};
                writeData41 = {17'b0, writeData[27]};
                writeData40 = {17'b0, writeData[26]};
                writeData39 = {17'b0, writeData[25]};
                writeData38 = {17'b0, writeData[24]};
                writeData37 = {17'b0, writeData[23]};
                writeData36 = {17'b0, writeData[22]};
                writeData35 = {17'b0, writeData[21]};
                writeData34 = {17'b0, writeData[20]};
                writeData33 = {17'b0, writeData[19]};
                writeData32 = {17'b0, writeData[18]};
                writeData31 = {17'b0, writeData[17]};
                writeData30 = {17'b0, writeData[16]};
                writeData29 = {17'b0, writeData[15]};
                writeData28 = {17'b0, writeData[14]};
                writeData27 = {17'b0, writeData[13]};
                writeData26 = {17'b0, writeData[12]};
                writeData25 = {17'b0, writeData[11]};
                writeData24 = {17'b0, writeData[10]};
                writeData23 = {17'b0, writeData[9]};
                writeData22 = {17'b0, writeData[8]};
                writeData21 = {17'b0, writeData[7]};
                writeData20 = {17'b0, writeData[6]};
                writeData19 = {17'b0, writeData[5]};
                writeData18 = {17'b0, writeData[4]};
                writeData17 = {17'b0, writeData[3]};
                writeData16 = {17'b0, writeData[2]};
                writeData15 = {17'b0, writeData[1]};
                writeData14 = {17'b0, writeData[0]};
                writeData13 = {14'b0, writeData[31:28]}; 
                writeData12 = {14'b0, writeData[27:24]}; 
                writeData11 = {14'b0, writeData[23:20]}; 
                writeData10 = {14'b0, writeData[19:16]}; 
                writeData9  = {14'b0, writeData[15:12]}; 
                writeData8  = {14'b0, writeData[11:8]};  
                writeData7  = {14'b0, writeData[7:4]};   
                writeData6  = {14'b0, writeData[3:0]};   
                writeData5  = {10'b0, writeData[31:24]};
                writeData4  = {10'b0, writeData[23:16]};
                writeData3  = {10'b0, writeData[15:8]}; 
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10100, 5'b10101 : begin
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10110 : begin
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0],
                                   readData15[0],
                                   readData14[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011 : begin
                     readData = {
                                 readData13[3:0],
                                 readData12[3:0],
                                 readData11[3:0],
                                 readData10[3:0],
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0]
                                 };
                  end
                  5'b10100, 5'b10101 : begin
                     readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                  end
                  5'b10110 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end


            1536: begin
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b001;
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b001;
                width0  = 3'b001;

                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[8:0], 1'b0};
                writeAddr8  = {writeAddr[8:0], 1'b0};
                writeAddr7  = {writeAddr[8:0], 1'b0};
                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[8:0], 1'b0};
                writeAddr1  = {writeAddr[8:0], 1'b0};
                writeAddr0  = {writeAddr[8:0], 1'b0};

                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[8:0], 1'b0};
                readAddr8  = {readAddr[8:0], 1'b0};
                readAddr7  = {readAddr[8:0], 1'b0};
                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[8:0], 1'b0};
                readAddr1  = {readAddr[8:0], 1'b0};
                readAddr0  = {readAddr[8:0], 1'b0};

                writeData47 = {17'b0, writeData[31]};
                writeData46 = {17'b0, writeData[30]};
                writeData45 = {17'b0, writeData[29]};
                writeData44 = {17'b0, writeData[28]};
                writeData43 = {17'b0, writeData[27]};
                writeData42 = {17'b0, writeData[26]};
                writeData41 = {17'b0, writeData[25]};
                writeData40 = {17'b0, writeData[24]};
                writeData39 = {17'b0, writeData[23]};
                writeData38 = {17'b0, writeData[22]};
                writeData37 = {17'b0, writeData[21]};
                writeData36 = {17'b0, writeData[20]};
                writeData35 = {17'b0, writeData[19]};
                writeData34 = {17'b0, writeData[18]};
                writeData33 = {17'b0, writeData[17]};
                writeData32 = {17'b0, writeData[16]};
                writeData31 = {17'b0, writeData[15]};
                writeData30 = {17'b0, writeData[14]};
                writeData29 = {17'b0, writeData[13]};
                writeData28 = {17'b0, writeData[12]};
                writeData27 = {17'b0, writeData[11]};
                writeData26 = {17'b0, writeData[10]};
                writeData25 = {17'b0, writeData[9]};
                writeData24 = {17'b0, writeData[8]};
                writeData23 = {17'b0, writeData[7]};
                writeData22 = {17'b0, writeData[6]};
                writeData21 = {17'b0, writeData[5]};
                writeData20 = {17'b0, writeData[4]};
                writeData19 = {17'b0, writeData[3]};
                writeData18 = {17'b0, writeData[2]};
                writeData17 = {17'b0, writeData[1]};
                writeData16 = {17'b0, writeData[0]};
                writeData15 = {16'b0, writeData[31:30]};
                writeData14 = {16'b0, writeData[29:28]};
                writeData13 = {16'b0, writeData[27:26]};
                writeData12 = {16'b0, writeData[25:24]};
                writeData11 = {16'b0, writeData[23:22]};
                writeData10 = {16'b0, writeData[21:20]};
                writeData9  = {16'b0, writeData[19:18]};
                writeData8  = {16'b0, writeData[17:16]};
                writeData7  = {16'b0, writeData[15:14]};
                writeData6  = {16'b0, writeData[13:12]};
                writeData5  = {16'b0, writeData[11:10]};
                writeData4  = {16'b0, writeData[9:8]};  
                writeData3  = {16'b0, writeData[7:6]};  
                writeData2  = {16'b0, writeData[5:4]};  
                writeData1  = {16'b0, writeData[3:2]};  
                writeData0  = {16'b0, writeData[1:0]};  

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0],
                                   readData17[0],
                                   readData16[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0],
                                 readData1[1:0],
                                 readData0[1:0]
                                 };                     
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1600: begin
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b001;
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b001;
                width2  = 3'b001;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[8:0], 1'b0};
                writeAddr8  = {writeAddr[8:0], 1'b0};
                writeAddr7  = {writeAddr[8:0], 1'b0};
                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[8:0], 1'b0};
                writeAddr2  = {writeAddr[8:0], 1'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[8:0], 1'b0};
                readAddr8  = {readAddr[8:0], 1'b0};
                readAddr7  = {readAddr[8:0], 1'b0};
                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[8:0], 1'b0};
                readAddr2  = {readAddr[8:0], 1'b0};
                readAddr1  = {readAddr[5:0], 4'b0};
                readAddr0  = {readAddr[5:0], 4'b0};

                writeData49 = {17'b0, writeData[31]};
                writeData48 = {17'b0, writeData[30]};
                writeData47 = {17'b0, writeData[29]};
                writeData46 = {17'b0, writeData[28]};
                writeData45 = {17'b0, writeData[27]};
                writeData44 = {17'b0, writeData[26]};
                writeData43 = {17'b0, writeData[25]};
                writeData42 = {17'b0, writeData[24]};
                writeData41 = {17'b0, writeData[23]};
                writeData40 = {17'b0, writeData[22]};
                writeData39 = {17'b0, writeData[21]};
                writeData38 = {17'b0, writeData[20]};
                writeData37 = {17'b0, writeData[19]};
                writeData36 = {17'b0, writeData[18]};
                writeData35 = {17'b0, writeData[17]};
                writeData34 = {17'b0, writeData[16]};
                writeData33 = {17'b0, writeData[15]};
                writeData32 = {17'b0, writeData[14]};
                writeData31 = {17'b0, writeData[13]};
                writeData30 = {17'b0, writeData[12]};
                writeData29 = {17'b0, writeData[11]};
                writeData28 = {17'b0, writeData[10]};
                writeData27 = {17'b0, writeData[9]};
                writeData26 = {17'b0, writeData[8]};
                writeData25 = {17'b0, writeData[7]};
                writeData24 = {17'b0, writeData[6]};
                writeData23 = {17'b0, writeData[5]};
                writeData22 = {17'b0, writeData[4]};
                writeData21 = {17'b0, writeData[3]};
                writeData20 = {17'b0, writeData[2]};
                writeData19 = {17'b0, writeData[1]};
                writeData18 = {17'b0, writeData[0]};
                writeData17 = {16'b0, writeData[31:30]};
                writeData16 = {16'b0, writeData[29:28]};
                writeData15 = {16'b0, writeData[27:26]};
                writeData14 = {16'b0, writeData[25:24]};
                writeData13 = {16'b0, writeData[23:22]};
                writeData12 = {16'b0, writeData[21:20]};
                writeData11 = {16'b0, writeData[19:18]};
                writeData10 = {16'b0, writeData[17:16]};
                writeData9  = {16'b0, writeData[15:14]};
                writeData8  = {16'b0, writeData[13:12]};
                writeData7  = {16'b0, writeData[11:10]};
                writeData6  = {16'b0, writeData[9:8]};  
                writeData5  = {16'b0, writeData[7:6]};  
                writeData4  = {16'b0, writeData[5:4]};  
                writeData3  = {16'b0, writeData[3:2]};  
                writeData2  = {16'b0, writeData[1:0]};  
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000 : begin
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0],
                                   readData19[0],
                                   readData18[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0],
                                 readData3[1:0],
                                 readData2[1:0]
                                 };                     
                  end
                  5'b11000 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1664: begin
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b001;
                width6  = 3'b001;
                width5  = 3'b001;
                width4  = 3'b001;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[8:0], 1'b0};
                writeAddr8  = {writeAddr[8:0], 1'b0};
                writeAddr7  = {writeAddr[8:0], 1'b0};
                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[8:0], 1'b0};
                writeAddr4  = {writeAddr[8:0], 1'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[6:0], 3'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[8:0], 1'b0};
                readAddr8  = {readAddr[8:0], 1'b0};
                readAddr7  = {readAddr[8:0], 1'b0};
                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[8:0], 1'b0};
                readAddr4  = {readAddr[8:0], 1'b0};
                readAddr3  = {readAddr[6:0], 3'b0};
                readAddr2  = {readAddr[6:0], 3'b0};
                readAddr1  = {readAddr[6:0], 3'b0};
                readAddr0  = {readAddr[6:0], 3'b0};

                writeData51 = {17'b0, writeData[31]};
                writeData50 = {17'b0, writeData[30]};
                writeData49 = {17'b0, writeData[29]};
                writeData48 = {17'b0, writeData[28]};
                writeData47 = {17'b0, writeData[27]};
                writeData46 = {17'b0, writeData[26]};
                writeData45 = {17'b0, writeData[25]};
                writeData44 = {17'b0, writeData[24]};
                writeData43 = {17'b0, writeData[23]};
                writeData42 = {17'b0, writeData[22]};
                writeData41 = {17'b0, writeData[21]};
                writeData40 = {17'b0, writeData[20]};
                writeData39 = {17'b0, writeData[19]};
                writeData38 = {17'b0, writeData[18]};
                writeData37 = {17'b0, writeData[17]};
                writeData36 = {17'b0, writeData[16]};
                writeData35 = {17'b0, writeData[15]};
                writeData34 = {17'b0, writeData[14]};
                writeData33 = {17'b0, writeData[13]};
                writeData32 = {17'b0, writeData[12]};
                writeData31 = {17'b0, writeData[11]};
                writeData30 = {17'b0, writeData[10]};
                writeData29 = {17'b0, writeData[9]};
                writeData28 = {17'b0, writeData[8]};
                writeData27 = {17'b0, writeData[7]};
                writeData26 = {17'b0, writeData[6]};
                writeData25 = {17'b0, writeData[5]};
                writeData24 = {17'b0, writeData[4]};
                writeData23 = {17'b0, writeData[3]};
                writeData22 = {17'b0, writeData[2]};
                writeData21 = {17'b0, writeData[1]};
                writeData20 = {17'b0, writeData[0]};
                writeData19 = {16'b0, writeData[31:30]};
                writeData18 = {16'b0, writeData[29:28]};
                writeData17 = {16'b0, writeData[27:26]};
                writeData16 = {16'b0, writeData[25:24]};
                writeData15 = {16'b0, writeData[23:22]};
                writeData14 = {16'b0, writeData[21:20]};
                writeData13 = {16'b0, writeData[19:18]};
                writeData12 = {16'b0, writeData[17:16]};
                writeData11 = {16'b0, writeData[15:14]};
                writeData10 = {16'b0, writeData[13:12]};
                writeData9  = {16'b0, writeData[11:10]};
                writeData8  = {16'b0, writeData[9:8]};  
                writeData7  = {16'b0, writeData[7:6]};  
                writeData6  = {16'b0, writeData[5:4]};  
                writeData5  = {16'b0, writeData[3:2]};  
                writeData4  = {16'b0, writeData[1:0]};  
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]};
                writeData0  = {10'b0, writeData[7:0]};  


                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001 : begin
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0],
                                   readData21[0],
                                   readData20[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0],
                                 readData5[1:0],
                                 readData4[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001: begin
                     readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1728: begin
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b001;
                width6  = 3'b001;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[8:0], 1'b0};
                writeAddr8  = {writeAddr[8:0], 1'b0};
                writeAddr7  = {writeAddr[8:0], 1'b0};
                writeAddr6  = {writeAddr[8:0], 1'b0};
                writeAddr5  = {writeAddr[6:0], 3'b0};
                writeAddr4  = {writeAddr[6:0], 3'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[8:0], 1'b0};
                readAddr8  = {readAddr[8:0], 1'b0};
                readAddr7  = {readAddr[8:0], 1'b0};
                readAddr6  = {readAddr[8:0], 1'b0};
                readAddr5  = {readAddr[6:0], 3'b0};
                readAddr4  = {readAddr[6:0], 3'b0};
                readAddr3  = {readAddr[6:0], 3'b0};
                readAddr2  = {readAddr[6:0], 3'b0};
                readAddr1  = {readAddr[5:0], 4'b0};
                readAddr0  = {readAddr[5:0], 4'b0};

                writeData53 = {17'b0, writeData[31]};
                writeData52 = {17'b0, writeData[30]};
                writeData51 = {17'b0, writeData[29]};
                writeData50 = {17'b0, writeData[28]};
                writeData49 = {17'b0, writeData[27]};
                writeData48 = {17'b0, writeData[26]};
                writeData47 = {17'b0, writeData[25]};
                writeData46 = {17'b0, writeData[24]};
                writeData45 = {17'b0, writeData[23]};
                writeData44 = {17'b0, writeData[22]};
                writeData43 = {17'b0, writeData[21]};
                writeData42 = {17'b0, writeData[20]};
                writeData41 = {17'b0, writeData[19]};
                writeData40 = {17'b0, writeData[18]};
                writeData39 = {17'b0, writeData[17]};
                writeData38 = {17'b0, writeData[16]};
                writeData37 = {17'b0, writeData[15]};
                writeData36 = {17'b0, writeData[14]};
                writeData35 = {17'b0, writeData[13]};
                writeData34 = {17'b0, writeData[12]};
                writeData33 = {17'b0, writeData[11]};
                writeData32 = {17'b0, writeData[10]};
                writeData31 = {17'b0, writeData[9]};
                writeData30 = {17'b0, writeData[8]};
                writeData29 = {17'b0, writeData[7]};
                writeData28 = {17'b0, writeData[6]};
                writeData27 = {17'b0, writeData[5]};
                writeData26 = {17'b0, writeData[4]};
                writeData25 = {17'b0, writeData[3]};
                writeData24 = {17'b0, writeData[2]};
                writeData23 = {17'b0, writeData[1]};
                writeData22 = {17'b0, writeData[0]};
                writeData21 = {16'b0, writeData[31:30]};
                writeData20 = {16'b0, writeData[29:28]};
                writeData19 = {16'b0, writeData[27:26]};
                writeData18 = {16'b0, writeData[25:24]};
                writeData17 = {16'b0, writeData[23:22]};
                writeData16 = {16'b0, writeData[21:20]};
                writeData15 = {16'b0, writeData[19:18]};
                writeData14 = {16'b0, writeData[17:16]};
                writeData13 = {16'b0, writeData[15:14]};
                writeData12 = {16'b0, writeData[13:12]};
                writeData11 = {16'b0, writeData[11:10]};
                writeData10 = {16'b0, writeData[9:8]};  
                writeData9  = {16'b0, writeData[7:6]};  
                writeData8  = {16'b0, writeData[5:4]};  
                writeData7  = {16'b0, writeData[3:2]};  
                writeData6  = {16'b0, writeData[1:0]};  
                writeData5  = {10'b0, writeData[31:24]};
                writeData4  = {10'b0, writeData[23:16]};
                writeData3  = {10'b0, writeData[15:8]};
                writeData2  = {10'b0, writeData[7:0]};  
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};


                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a53 = wen;
                       wen_a52 = wen;
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001 : begin
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11010 : begin
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData53[0],
                                   readData52[0],
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0],
                                   readData23[0],
                                   readData22[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0],
                                 readData7[1:0],
                                 readData6[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001: begin
                     readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                  end
                  5'b11010: begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1792: begin
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b001;
                width8  = 3'b001;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b010;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b010;

                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[8:0], 1'b0};
                writeAddr8  = {writeAddr[8:0], 1'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[7:0], 2'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[7:0], 2'b0};

                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[8:0], 1'b0};
                readAddr8  = {readAddr[8:0], 1'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[7:0], 2'b0};
                readAddr4  = {readAddr[7:0], 2'b0};
                readAddr3  = {readAddr[7:0], 2'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[7:0], 2'b0};
                readAddr0  = {readAddr[7:0], 2'b0};

                writeData55 = {17'b0, writeData[31]};
                writeData54 = {17'b0, writeData[30]};
                writeData53 = {17'b0, writeData[29]};
                writeData52 = {17'b0, writeData[28]};
                writeData51 = {17'b0, writeData[27]};
                writeData50 = {17'b0, writeData[26]};
                writeData49 = {17'b0, writeData[25]};
                writeData48 = {17'b0, writeData[24]};
                writeData47 = {17'b0, writeData[23]};
                writeData46 = {17'b0, writeData[22]};
                writeData45 = {17'b0, writeData[21]};
                writeData44 = {17'b0, writeData[20]};
                writeData43 = {17'b0, writeData[19]};
                writeData42 = {17'b0, writeData[18]};
                writeData41 = {17'b0, writeData[17]};
                writeData40 = {17'b0, writeData[16]};
                writeData39 = {17'b0, writeData[15]};
                writeData38 = {17'b0, writeData[14]};
                writeData37 = {17'b0, writeData[13]};
                writeData36 = {17'b0, writeData[12]};
                writeData35 = {17'b0, writeData[11]};
                writeData34 = {17'b0, writeData[10]};
                writeData33 = {17'b0, writeData[9]};
                writeData32 = {17'b0, writeData[8]};
                writeData31 = {17'b0, writeData[7]};
                writeData30 = {17'b0, writeData[6]};
                writeData29 = {17'b0, writeData[5]};
                writeData28 = {17'b0, writeData[4]};
                writeData27 = {17'b0, writeData[3]};
                writeData26 = {17'b0, writeData[2]};
                writeData25 = {17'b0, writeData[1]};
                writeData24 = {17'b0, writeData[0]};
                writeData23 = {16'b0, writeData[31:30]};
                writeData22 = {16'b0, writeData[29:28]};
                writeData21 = {16'b0, writeData[27:26]};
                writeData20 = {16'b0, writeData[25:24]};
                writeData19 = {16'b0, writeData[23:22]};
                writeData18 = {16'b0, writeData[21:20]};
                writeData17 = {16'b0, writeData[19:18]};
                writeData16 = {16'b0, writeData[17:16]};
                writeData15 = {16'b0, writeData[15:14]};
                writeData14 = {16'b0, writeData[13:12]};
                writeData13 = {16'b0, writeData[11:10]};
                writeData12 = {16'b0, writeData[9:8]};  
                writeData11 = {16'b0, writeData[7:6]};  
                writeData10 = {16'b0, writeData[5:4]};  
                writeData9  = {16'b0, writeData[3:2]};  
                writeData8  = {16'b0, writeData[1:0]};  
                writeData7  = {14'b0, writeData[31:28]};
                writeData6  = {14'b0, writeData[27:24]};
                writeData5  = {14'b0, writeData[23:20]};
                writeData4  = {14'b0, writeData[19:16]};
                writeData3  = {14'b0, writeData[15:12]};
                writeData2  = {14'b0, writeData[11:8]}; 
                writeData1  = {14'b0, writeData[7:4]};
                writeData0  = {14'b0, writeData[3:0]};

                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a55 = wen;
                       wen_a54 = wen;
                       wen_a53 = wen;
                       wen_a52 = wen;
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData55[0],
                                   readData54[0],
                                   readData53[0],
                                   readData52[0],
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0],
                                   readData25[0],
                                   readData24[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData23[1:0],
                                 readData22[1:0],                                
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0],
                                 readData9[1:0],
                                 readData8[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = {
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0],
                                 readData3[3:0],
                                 readData2[3:0],
                                 readData1[3:0],
                                 readData0[3:0]
                                 };
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1856: begin
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b001;
                width10 = 3'b001;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b010;
                width2  = 3'b010;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[8:0], 1'b0};
                writeAddr10 = {writeAddr[8:0], 1'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[7:0], 2'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[8:0], 1'b0};
                readAddr10 = {readAddr[8:0], 1'b0};
                readAddr9  = {readAddr[7:0], 2'b0};
                readAddr8  = {readAddr[7:0], 2'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[7:0], 2'b0};
                readAddr4  = {readAddr[7:0], 2'b0};
                readAddr3  = {readAddr[7:0], 2'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[5:0], 4'b0};
                readAddr0  = {readAddr[5:0], 4'b0};

                writeData57 = {17'b0, writeData[31]};
                writeData56 = {17'b0, writeData[30]};
                writeData55 = {17'b0, writeData[29]};
                writeData54 = {17'b0, writeData[28]};
                writeData53 = {17'b0, writeData[27]};
                writeData52 = {17'b0, writeData[26]};
                writeData51 = {17'b0, writeData[25]};
                writeData50 = {17'b0, writeData[24]};
                writeData49 = {17'b0, writeData[23]};
                writeData48 = {17'b0, writeData[22]};
                writeData47 = {17'b0, writeData[21]};
                writeData46 = {17'b0, writeData[20]};
                writeData45 = {17'b0, writeData[19]};
                writeData44 = {17'b0, writeData[18]};
                writeData43 = {17'b0, writeData[17]};
                writeData42 = {17'b0, writeData[16]};
                writeData41 = {17'b0, writeData[15]};
                writeData40 = {17'b0, writeData[14]};
                writeData39 = {17'b0, writeData[13]};
                writeData38 = {17'b0, writeData[12]};
                writeData37 = {17'b0, writeData[11]};
                writeData36 = {17'b0, writeData[10]};
                writeData35 = {17'b0, writeData[9]};
                writeData34 = {17'b0, writeData[8]};
                writeData33 = {17'b0, writeData[7]};
                writeData32 = {17'b0, writeData[6]};
                writeData31 = {17'b0, writeData[5]};
                writeData30 = {17'b0, writeData[4]};
                writeData29 = {17'b0, writeData[3]};
                writeData28 = {17'b0, writeData[2]};
                writeData27 = {17'b0, writeData[1]};
                writeData26 = {17'b0, writeData[0]};
                writeData25 = {16'b0, writeData[31:30]};
                writeData24 = {16'b0, writeData[29:28]};
                writeData23 = {16'b0, writeData[27:26]};
                writeData22 = {16'b0, writeData[25:24]};
                writeData21 = {16'b0, writeData[23:22]};
                writeData20 = {16'b0, writeData[21:20]};
                writeData19 = {16'b0, writeData[19:18]};
                writeData18 = {16'b0, writeData[17:16]};
                writeData17 = {16'b0, writeData[15:14]};
                writeData16 = {16'b0, writeData[13:12]};
                writeData15 = {16'b0, writeData[11:10]};
                writeData14 = {16'b0, writeData[9:8]};  
                writeData13 = {16'b0, writeData[7:6]};  
                writeData12 = {16'b0, writeData[5:4]};  
                writeData11 = {16'b0, writeData[3:2]};  
                writeData10 = {16'b0, writeData[1:0]};  
                writeData9  = {14'b0, writeData[31:28]};
                writeData8  = {14'b0, writeData[27:24]};
                writeData7  = {14'b0, writeData[23:20]};
                writeData6  = {14'b0, writeData[19:16]};
                writeData5  = {14'b0, writeData[15:12]};
                writeData4  = {14'b0, writeData[11:8]}; 
                writeData3  = {14'b0, writeData[7:4]};
                writeData2  = {14'b0, writeData[3:0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};


                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a57 = wen;
                       wen_a56 = wen;
                       wen_a55 = wen;
                       wen_a54 = wen;
                       wen_a53 = wen;
                       wen_a52 = wen;
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11100 : begin
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData57[0],
                                   readData56[0],
                                   readData55[0],
                                   readData54[0],
                                   readData53[0],
                                   readData52[0],
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0],
                                   readData27[0],
                                   readData26[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0],
                                 readData11[1:0],
                                 readData10[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = {
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0],
                                 readData3[3:0],
                                 readData2[3:0]
                                 };
                  end
                  5'b11100 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1920: begin
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b001;
                width26 = 3'b001;
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b001;
                width12 = 3'b001;
                width11 = 3'b010;
                width10 = 3'b010;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = {writeAddr[8:0], 1'b0};
                writeAddr26 = {writeAddr[8:0], 1'b0};
                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[8:0], 1'b0};
                writeAddr12 = {writeAddr[8:0], 1'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[6:0], 3'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = {readAddr[8:0], 1'b0};
                readAddr26 = {readAddr[8:0], 1'b0};
                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[8:0], 1'b0};
                readAddr12 = {readAddr[8:0], 1'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9  = {readAddr[7:0], 2'b0};
                readAddr8  = {readAddr[7:0], 2'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[7:0], 2'b0};
                readAddr4  = {readAddr[7:0], 2'b0};
                readAddr3  = {readAddr[6:0], 3'b0};
                readAddr2  = {readAddr[6:0], 3'b0};
                readAddr1  = {readAddr[6:0], 3'b0};
                readAddr0  = {readAddr[6:0], 3'b0};

                writeData59 = {17'b0, writeData[31]};
                writeData58 = {17'b0, writeData[30]};
                writeData57 = {17'b0, writeData[29]};
                writeData56 = {17'b0, writeData[28]};
                writeData55 = {17'b0, writeData[27]};
                writeData54 = {17'b0, writeData[26]};
                writeData53 = {17'b0, writeData[25]};
                writeData52 = {17'b0, writeData[24]};
                writeData51 = {17'b0, writeData[23]};
                writeData50 = {17'b0, writeData[22]};
                writeData49 = {17'b0, writeData[21]};
                writeData48 = {17'b0, writeData[20]};
                writeData47 = {17'b0, writeData[19]};
                writeData46 = {17'b0, writeData[18]};
                writeData45 = {17'b0, writeData[17]};
                writeData44 = {17'b0, writeData[16]};
                writeData43 = {17'b0, writeData[15]};
                writeData42 = {17'b0, writeData[14]};
                writeData41 = {17'b0, writeData[13]};
                writeData40 = {17'b0, writeData[12]};
                writeData39 = {17'b0, writeData[11]};
                writeData38 = {17'b0, writeData[10]};
                writeData37 = {17'b0, writeData[9]};
                writeData36 = {17'b0, writeData[8]};
                writeData35 = {17'b0, writeData[7]};
                writeData34 = {17'b0, writeData[6]};
                writeData33 = {17'b0, writeData[5]};
                writeData32 = {17'b0, writeData[4]};
                writeData31 = {17'b0, writeData[3]};
                writeData30 = {17'b0, writeData[2]};
                writeData29 = {17'b0, writeData[1]};
                writeData28 = {17'b0, writeData[0]};
                writeData27 = {16'b0, writeData[31:30]};
                writeData26 = {16'b0, writeData[29:28]};
                writeData25 = {16'b0, writeData[27:26]};
                writeData24 = {16'b0, writeData[25:24]};
                writeData23 = {16'b0, writeData[23:22]};
                writeData22 = {16'b0, writeData[21:20]};
                writeData21 = {16'b0, writeData[19:18]};
                writeData20 = {16'b0, writeData[17:16]};
                writeData19 = {16'b0, writeData[15:14]};
                writeData18 = {16'b0, writeData[13:12]};
                writeData17 = {16'b0, writeData[11:10]};
                writeData16 = {16'b0, writeData[9:8]};  
                writeData15 = {16'b0, writeData[7:6]};  
                writeData14 = {16'b0, writeData[5:4]};  
                writeData13 = {16'b0, writeData[3:2]};  
                writeData12 = {16'b0, writeData[1:0]};  
                writeData11 = {14'b0, writeData[31:28]};
                writeData10 = {14'b0, writeData[27:24]};
                writeData9  = {14'b0, writeData[23:20]};
                writeData8  = {14'b0, writeData[19:16]};
                writeData7  = {14'b0, writeData[15:12]};
                writeData6  = {14'b0, writeData[11:8]}; 
                writeData5  = {14'b0, writeData[7:4]};
                writeData4  = {14'b0, writeData[3:0]};
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]};
                writeData0  = {10'b0, writeData[7:0]};  



                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a59 = wen;
                       wen_a58 = wen;
                       wen_a57 = wen;
                       wen_a56 = wen;
                       wen_a55 = wen;
                       wen_a54 = wen;
                       wen_a53 = wen;
                       wen_a52 = wen;
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11100, 5'b11101 : begin
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData59[0],
                                   readData58[0],
                                   readData57[0],
                                   readData56[0],
                                   readData55[0],
                                   readData54[0],
                                   readData53[0],
                                   readData52[0],
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0],
                                   readData29[0],
                                   readData28[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData27[1:0],
                                 readData26[1:0],
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0],
                                 readData13[1:0],
                                 readData12[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = {
                                 readData11[3:0],
                                 readData10[3:0],
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0],
                                 readData5[3:0],
                                 readData4[3:0]
                                 };
                  end
                  5'b11100, 5'b11101 : begin
                     readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            1984: begin
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b001;
                width28 = 3'b001;
                width27 = 3'b001;
                width26 = 3'b001;
                width25 = 3'b001;
                width24 = 3'b001;
                width23 = 3'b001;
                width22 = 3'b001;
                width21 = 3'b001;
                width20 = 3'b001;
                width19 = 3'b001;
                width18 = 3'b001;
                width17 = 3'b001;
                width16 = 3'b001;
                width15 = 3'b001;
                width14 = 3'b001;
                width13 = 3'b010;
                width12 = 3'b010;
                width11 = 3'b010;
                width10 = 3'b010;
                width9  = 3'b010;
                width8  = 3'b010;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = {writeAddr[8:0], 1'b0};
                writeAddr28 = {writeAddr[8:0], 1'b0};
                writeAddr27 = {writeAddr[8:0], 1'b0};
                writeAddr26 = {writeAddr[8:0], 1'b0};
                writeAddr25 = {writeAddr[8:0], 1'b0};
                writeAddr24 = {writeAddr[8:0], 1'b0};
                writeAddr23 = {writeAddr[8:0], 1'b0};
                writeAddr22 = {writeAddr[8:0], 1'b0};
                writeAddr21 = {writeAddr[8:0], 1'b0};
                writeAddr20 = {writeAddr[8:0], 1'b0};
                writeAddr19 = {writeAddr[8:0], 1'b0};
                writeAddr18 = {writeAddr[8:0], 1'b0};
                writeAddr17 = {writeAddr[8:0], 1'b0};
                writeAddr16 = {writeAddr[8:0], 1'b0};
                writeAddr15 = {writeAddr[8:0], 1'b0};
                writeAddr14 = {writeAddr[8:0], 1'b0};
                writeAddr13 = {writeAddr[7:0], 2'b0};
                writeAddr12 = {writeAddr[7:0], 2'b0};
                writeAddr11 = {writeAddr[7:0], 2'b0};
                writeAddr10 = {writeAddr[7:0], 2'b0};
                writeAddr9  = {writeAddr[7:0], 2'b0};
                writeAddr8  = {writeAddr[7:0], 2'b0};
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[6:0], 3'b0};
                writeAddr4  = {writeAddr[6:0], 3'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = {readAddr[8:0], 1'b0};
                readAddr28 = {readAddr[8:0], 1'b0};
                readAddr27 = {readAddr[8:0], 1'b0};
                readAddr26 = {readAddr[8:0], 1'b0};
                readAddr25 = {readAddr[8:0], 1'b0};
                readAddr24 = {readAddr[8:0], 1'b0};
                readAddr23 = {readAddr[8:0], 1'b0};
                readAddr22 = {readAddr[8:0], 1'b0};
                readAddr21 = {readAddr[8:0], 1'b0};
                readAddr20 = {readAddr[8:0], 1'b0};
                readAddr19 = {readAddr[8:0], 1'b0};
                readAddr18 = {readAddr[8:0], 1'b0};
                readAddr17 = {readAddr[8:0], 1'b0};
                readAddr16 = {readAddr[8:0], 1'b0};
                readAddr15 = {readAddr[8:0], 1'b0};
                readAddr14 = {readAddr[8:0], 1'b0};
                readAddr13 = {readAddr[7:0], 2'b0};
                readAddr12 = {readAddr[7:0], 2'b0};
                readAddr11 = {readAddr[7:0], 2'b0};
                readAddr10 = {readAddr[7:0], 2'b0};
                readAddr9  = {readAddr[7:0], 2'b0};
                readAddr8  = {readAddr[7:0], 2'b0};
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[6:0], 3'b0};
                readAddr4  = {readAddr[6:0], 3'b0};
                readAddr3  = {readAddr[6:0], 3'b0};
                readAddr2  = {readAddr[6:0], 3'b0};
                readAddr1  = {readAddr[5:0], 4'b0};
                readAddr0  = {readAddr[5:0], 4'b0};

                writeData61 = {17'b0, writeData[31]};
                writeData60 = {17'b0, writeData[30]};
                writeData59 = {17'b0, writeData[29]};
                writeData58 = {17'b0, writeData[28]};
                writeData57 = {17'b0, writeData[27]};
                writeData56 = {17'b0, writeData[26]};
                writeData55 = {17'b0, writeData[25]};
                writeData54 = {17'b0, writeData[24]};
                writeData53 = {17'b0, writeData[23]};
                writeData52 = {17'b0, writeData[22]};
                writeData51 = {17'b0, writeData[21]};
                writeData50 = {17'b0, writeData[20]};
                writeData49 = {17'b0, writeData[19]};
                writeData48 = {17'b0, writeData[18]};
                writeData47 = {17'b0, writeData[17]};
                writeData46 = {17'b0, writeData[16]};
                writeData45 = {17'b0, writeData[15]};
                writeData44 = {17'b0, writeData[14]};
                writeData43 = {17'b0, writeData[13]};
                writeData42 = {17'b0, writeData[12]};
                writeData41 = {17'b0, writeData[11]};
                writeData40 = {17'b0, writeData[10]};
                writeData39 = {17'b0, writeData[9]};
                writeData38 = {17'b0, writeData[8]};
                writeData37 = {17'b0, writeData[7]};
                writeData36 = {17'b0, writeData[6]};
                writeData35 = {17'b0, writeData[5]};
                writeData34 = {17'b0, writeData[4]};
                writeData33 = {17'b0, writeData[3]};
                writeData32 = {17'b0, writeData[2]};
                writeData31 = {17'b0, writeData[1]};
                writeData30 = {17'b0, writeData[0]};
                writeData29 = {16'b0, writeData[31:30]};
                writeData28 = {16'b0, writeData[29:28]};
                writeData27 = {16'b0, writeData[27:26]};
                writeData26 = {16'b0, writeData[25:24]};
                writeData25 = {16'b0, writeData[23:22]};
                writeData24 = {16'b0, writeData[21:20]};
                writeData23 = {16'b0, writeData[19:18]};
                writeData22 = {16'b0, writeData[17:16]};
                writeData21 = {16'b0, writeData[15:14]};
                writeData20 = {16'b0, writeData[13:12]};
                writeData19 = {16'b0, writeData[11:10]};
                writeData18 = {16'b0, writeData[9:8]};  
                writeData17 = {16'b0, writeData[7:6]};  
                writeData16 = {16'b0, writeData[5:4]};  
                writeData15 = {16'b0, writeData[3:2]};  
                writeData14 = {16'b0, writeData[1:0]};  
                writeData13 = {14'b0, writeData[31:28]};
                writeData12 = {14'b0, writeData[27:24]};
                writeData11 = {14'b0, writeData[23:20]};
                writeData10 = {14'b0, writeData[19:16]};
                writeData9  = {14'b0, writeData[15:12]};
                writeData8  = {14'b0, writeData[11:8]}; 
                writeData7  = {14'b0, writeData[7:4]};
                writeData6  = {14'b0, writeData[3:0]};
                writeData5  = {10'b0, writeData[31:24]};
                writeData4  = {10'b0, writeData[23:16]};
                writeData3  = {10'b0, writeData[15:8]};
                writeData2  = {10'b0, writeData[7:0]};  
                writeData1 = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0 = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};



                case (writeAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100,
                    5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001,
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110,
                    5'b01111 : begin
                       wen_a61 = wen;
                       wen_a60 = wen;
                       wen_a59 = wen;
                       wen_a58 = wen;
                       wen_a57 = wen;
                       wen_a56 = wen;
                       wen_a55 = wen;
                       wen_a54 = wen;
                       wen_a53 = wen;
                       wen_a52 = wen;
                       wen_a51 = wen;
                       wen_a50 = wen;
                       wen_a49 = wen;
                       wen_a48 = wen;
                       wen_a47 = wen;
                       wen_a46 = wen;
                       wen_a45 = wen;
                       wen_a44 = wen;
                       wen_a43 = wen;
                       wen_a42 = wen;
                       wen_a41 = wen;
                       wen_a40 = wen;
                       wen_a39 = wen;
                       wen_a38 = wen;
                       wen_a37 = wen;
                       wen_a36 = wen;
                       wen_a35 = wen;
                       wen_a34 = wen;
                       wen_a33 = wen;
                       wen_a32 = wen;
                       wen_a31 = wen;
                       wen_a30 = wen;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                       wen_a61 = 1'b0;
                       wen_a60 = 1'b0;
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = wen;
                       wen_a28 = wen;
                       wen_a27 = wen;
                       wen_a26 = wen;
                       wen_a25 = wen;
                       wen_a24 = wen;
                       wen_a23 = wen;
                       wen_a22 = wen;
                       wen_a21 = wen;
                       wen_a20 = wen;
                       wen_a19 = wen;
                       wen_a18 = wen;
                       wen_a17 = wen;
                       wen_a16 = wen;
                       wen_a15 = wen;
                       wen_a14 = wen;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11000, 5'b11001, 5'b11010, 5'b11011 : begin
                       wen_a61 = 1'b0;
                       wen_a60 = 1'b0;
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = wen;
                       wen_a12 = wen;
                       wen_a11 = wen;
                       wen_a10 = wen;
                       wen_a9  = wen;
                       wen_a8  = wen;
                       wen_a7  = wen;
                       wen_a6  = wen;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11100, 5'b11101 : begin
                       wen_a61 = 1'b0;
                       wen_a60 = 1'b0;
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = wen;
                       wen_a4  = wen;
                       wen_a3  = wen;
                       wen_a2  = wen;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                    5'b11110 : begin
                       wen_a61 = 1'b0;
                       wen_a60 = 1'b0;
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = wen;
                       wen_a0  = wen;
                    end
                    default : begin
                       wen_a61 = 1'b0;
                       wen_a60 = 1'b0;
                       wen_a59 = 1'b0;
                       wen_a58 = 1'b0;
                       wen_a57 = 1'b0;
                       wen_a56 = 1'b0;
                       wen_a55 = 1'b0;
                       wen_a54 = 1'b0;
                       wen_a53 = 1'b0;
                       wen_a52 = 1'b0;
                       wen_a51 = 1'b0;
                       wen_a50 = 1'b0;
                       wen_a49 = 1'b0;
                       wen_a48 = 1'b0;
                       wen_a47 = 1'b0;
                       wen_a46 = 1'b0;
                       wen_a45 = 1'b0;
                       wen_a44 = 1'b0;
                       wen_a43 = 1'b0;
                       wen_a42 = 1'b0;
                       wen_a41 = 1'b0;
                       wen_a40 = 1'b0;
                       wen_a39 = 1'b0;
                       wen_a38 = 1'b0;
                       wen_a37 = 1'b0;
                       wen_a36 = 1'b0;
                       wen_a35 = 1'b0;
                       wen_a34 = 1'b0;
                       wen_a33 = 1'b0;
                       wen_a32 = 1'b0;
                       wen_a31 = 1'b0;
                       wen_a30 = 1'b0;
                       wen_a29 = 1'b0;
                       wen_a28 = 1'b0;
                       wen_a27 = 1'b0;
                       wen_a26 = 1'b0;
                       wen_a25 = 1'b0;
                       wen_a24 = 1'b0;
                       wen_a23 = 1'b0;
                       wen_a22 = 1'b0;
                       wen_a21 = 1'b0;
                       wen_a20 = 1'b0;
                       wen_a19 = 1'b0;
                       wen_a18 = 1'b0;
                       wen_a17 = 1'b0;
                       wen_a16 = 1'b0;
                       wen_a15 = 1'b0;
                       wen_a14 = 1'b0;
                       wen_a13 = 1'b0;
                       wen_a12 = 1'b0;
                       wen_a11 = 1'b0;
                       wen_a10 = 1'b0;
                       wen_a9  = 1'b0;
                       wen_a8  = 1'b0;
                       wen_a7  = 1'b0;
                       wen_a6  = 1'b0;
                       wen_a5  = 1'b0;
                       wen_a4  = 1'b0;
                       wen_a3  = 1'b0;
                       wen_a2  = 1'b0;
                       wen_a1  = 1'b0;
                       wen_a0  = 1'b0;
                    end
                endcase

                case (ckRdAddr[10:6])
                  5'b00000, 5'b00001,5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b00110,5'b00111, 5'b01000, 5'b01001, 
                    5'b01010, 5'b01011,5'b01100, 5'b01101, 5'b01110, 5'b01111 : begin                       

                       readData = {
                                   readData61[0],
                                   readData60[0],
                                   readData59[0],
                                   readData58[0],
                                   readData57[0],
                                   readData56[0],
                                   readData55[0],
                                   readData54[0],
                                   readData53[0],
                                   readData52[0],
                                   readData51[0],
                                   readData50[0],
                                   readData49[0],
                                   readData48[0],
                                   readData47[0],
                                   readData46[0],
                                   readData45[0],
                                   readData44[0],
                                   readData43[0],
                                   readData42[0],
                                   readData41[0],
                                   readData40[0],
                                   readData39[0],
                                   readData38[0],
                                   readData37[0],
                                   readData36[0],
                                   readData35[0],
                                   readData34[0],
                                   readData33[0],
                                   readData32[0],
                                   readData31[0],
                                   readData30[0]
                                   };
                    end
                  5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101, 5'b10110, 5'b10111 : begin
                     readData = {
                                 readData29[1:0],
                                 readData28[1:0],
                                 readData27[1:0],
                                 readData26[1:0],
                                 readData25[1:0],
                                 readData24[1:0],
                                 readData23[1:0],
                                 readData22[1:0],
                                 readData21[1:0],
                                 readData20[1:0],
                                 readData19[1:0],
                                 readData18[1:0],
                                 readData17[1:0],
                                 readData16[1:0],
                                 readData15[1:0],
                                 readData14[1:0]
                                 };                     
                  end
                  5'b11000, 5'b11001, 5'b11010, 5'b11011: begin
                     readData = {
                                 readData13[3:0],
                                 readData12[3:0],
                                 readData11[3:0],
                                 readData10[3:0],
                                 readData9[3:0],
                                 readData8[3:0],
                                 readData7[3:0],
                                 readData6[3:0]
                                 };
                  end
                  5'b11100, 5'b11101 : begin
                     readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                  end
                  5'b11110 : begin
                     readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                  end
                  default : begin
                     readData = 32'b0;
                  end
                endcase
            end

            2048: begin
                width63 = 3'b000;
                width62 = 3'b000;
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b000;
                width0  = 3'b000;

                writeAddr63 = writeAddr[9:0];
                writeAddr62 = writeAddr[9:0];
                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = writeAddr[9:0];
                writeAddr0  = writeAddr[9:0];

                readAddr63 = readAddr[9:0];
                readAddr62 = readAddr[9:0];
                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = readAddr[9:0];
                readAddr0  = readAddr[9:0];

                writeData63 = {17'b0, writeData[31]};
                writeData62 = {17'b0, writeData[30]};
                writeData61 = {17'b0, writeData[29]};
                writeData60 = {17'b0, writeData[28]};
                writeData59 = {17'b0, writeData[27]};
                writeData58 = {17'b0, writeData[26]};
                writeData57 = {17'b0, writeData[25]};
                writeData56 = {17'b0, writeData[24]};
                writeData55 = {17'b0, writeData[23]};
                writeData54 = {17'b0, writeData[22]};
                writeData53 = {17'b0, writeData[21]};
                writeData52 = {17'b0, writeData[20]};
                writeData51 = {17'b0, writeData[19]};
                writeData50 = {17'b0, writeData[18]};
                writeData49 = {17'b0, writeData[17]};
                writeData48 = {17'b0, writeData[16]};
                writeData47 = {17'b0, writeData[15]};
                writeData46 = {17'b0, writeData[14]};
                writeData45 = {17'b0, writeData[13]};
                writeData44 = {17'b0, writeData[12]};
                writeData43 = {17'b0, writeData[11]};
                writeData42 = {17'b0, writeData[10]};
                writeData41 = {17'b0, writeData[9]};
                writeData40 = {17'b0, writeData[8]};
                writeData39 = {17'b0, writeData[7]};
                writeData38 = {17'b0, writeData[6]};
                writeData37 = {17'b0, writeData[5]};
                writeData36 = {17'b0, writeData[4]};
                writeData35 = {17'b0, writeData[3]};
                writeData34 = {17'b0, writeData[2]};
                writeData33 = {17'b0, writeData[1]};
                writeData32 = {17'b0, writeData[0]};
                writeData31 = {17'b0, writeData[31]};
                writeData30 = {17'b0, writeData[30]};
                writeData29 = {17'b0, writeData[29]};
                writeData28 = {17'b0, writeData[28]};
                writeData27 = {17'b0, writeData[27]};
                writeData26 = {17'b0, writeData[26]};
                writeData25 = {17'b0, writeData[25]};
                writeData24 = {17'b0, writeData[24]};
                writeData23 = {17'b0, writeData[23]};
                writeData22 = {17'b0, writeData[22]};
                writeData21 = {17'b0, writeData[21]};
                writeData20 = {17'b0, writeData[20]};
                writeData19 = {17'b0, writeData[19]};
                writeData18 = {17'b0, writeData[18]};
                writeData17 = {17'b0, writeData[17]};
                writeData16 = {17'b0, writeData[16]};
                writeData15 = {17'b0, writeData[15]};
                writeData14 = {17'b0, writeData[14]};
                writeData13 = {17'b0, writeData[13]};
                writeData12 = {17'b0, writeData[12]};
                writeData11 = {17'b0, writeData[11]};
                writeData10 = {17'b0, writeData[10]};
                writeData9  = {17'b0, writeData[9]};
                writeData8  = {17'b0, writeData[8]};
                writeData7  = {17'b0, writeData[7]};
                writeData6  = {17'b0, writeData[6]};
                writeData5  = {17'b0, writeData[5]};
                writeData4  = {17'b0, writeData[4]};
                writeData3  = {17'b0, writeData[3]};
                writeData2  = {17'b0, writeData[2]};
                writeData1  = {17'b0, writeData[1]};
                writeData0  = {17'b0, writeData[0]};

               case (writeAddr[11:6])
               6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
               6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                  wen_a63 = wen;
                  wen_a62 = wen;
                  wen_a61 = wen;
                  wen_a60 = wen;
                  wen_a59 = wen;
                  wen_a58 = wen;
                  wen_a57 = wen;
                  wen_a56 = wen;
                  wen_a55 = wen;
                  wen_a54 = wen;
                  wen_a53 = wen;
                  wen_a52 = wen;
                  wen_a51 = wen;
                  wen_a50 = wen;
                  wen_a49 = wen;
                  wen_a48 = wen;
                  wen_a47 = wen;
                  wen_a46 = wen;
                  wen_a45 = wen;
                  wen_a44 = wen;
                  wen_a43 = wen;
                  wen_a42 = wen;
                  wen_a41 = wen;
                  wen_a40 = wen;
                  wen_a39 = wen;
                  wen_a38 = wen;
                  wen_a37 = wen;
                  wen_a36 = wen;
                  wen_a35 = wen;
                  wen_a34 = wen;
                  wen_a33 = wen;
                  wen_a32 = wen;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
               
               6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = wen;
                  wen_a30 = wen;
                  wen_a29 = wen;
                  wen_a28 = wen;
                  wen_a27 = wen;
                  wen_a26 = wen;
                  wen_a25 = wen;
                  wen_a24 = wen;
                  wen_a23 = wen;
                  wen_a22 = wen;
                  wen_a21 = wen;
                  wen_a20 = wen;
                  wen_a19 = wen;
                  wen_a18 = wen;
                  wen_a17 = wen;
                  wen_a16 = wen;
                  wen_a15 = wen;
                  wen_a14 = wen;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
                 default :  begin
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;                   
                 end // case: default
               endcase // case (writeAddr[11:6])
               
  
                 case (ckRdAddr[11:6])
                   6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
                     6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                        readData = {
                                  readData63[0],
                                  readData62[0],
                                  readData61[0],
                                  readData60[0],
                                  readData59[0],
                                  readData58[0],
                                  readData57[0],
                                  readData56[0],
                                  readData55[0],
                                  readData54[0],
                                  readData53[0],
                                  readData52[0],
                                  readData51[0],
                                  readData50[0],
                                  readData49[0],
                                  readData48[0],
                                  readData47[0],
                                  readData46[0],
                                  readData45[0],
                                  readData44[0],
                                  readData43[0],
                                  readData42[0],
                                  readData41[0],
                                  readData40[0],
                                  readData39[0],
                                  readData38[0],
                                  readData37[0],
                                  readData36[0],
                                  readData35[0],
                                  readData34[0],
                                  readData33[0],
                                  readData32[0] 
                                    };
                     end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
                   6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
                   6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                   
                      readData = {

                                    readData31[0],
                                    readData30[0],
                                    readData29[0],
                                    readData28[0],
                                    readData27[0],
                                    readData26[0],
                                    readData25[0],
                                    readData24[0],
                                    readData23[0],
                                    readData22[0],
                                    readData21[0],
                                    readData20[0],
                                    readData19[0],
                                    readData18[0],
                                    readData17[0],
                                    readData16[0],
                                    readData15[0],
                                    readData14[0],
                                    readData13[0],
                                    readData12[0],
                                    readData11[0],
                                    readData10[0],
                                    readData9[0], 
                                    readData8[0], 
                                    readData7[0], 
                                    readData6[0], 
                                    readData5[0], 
                                    readData4[0], 
                                    readData3[0], 
                                    readData2[0], 
                                    readData1[0], 
                                    readData0[0]
                                  };
                   end // case: 6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001,...
                   default : begin
                      readData = 32'b0;                      
                   end
                 endcase // case (ckRdAddr[10:6])
            end // case: 2048
          

            2112: begin
                width65 = 3'b000;
                width64 = 3'b000;
                width63 = 3'b000;
                width62 = 3'b000;
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b000;
                width2  = 3'b000;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr65 = writeAddr[9:0];
                writeAddr64 = writeAddr[9:0];
                writeAddr63 = writeAddr[9:0];
                writeAddr62 = writeAddr[9:0];
                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = writeAddr[9:0];
                writeAddr2  = writeAddr[9:0];
                writeAddr1  = {writeAddr[5:0],4'b0};
                writeAddr0  = {writeAddr[5:0],4'b0};

                readAddr65 = readAddr[9:0];
                readAddr64 = readAddr[9:0];
                readAddr63 = readAddr[9:0];
                readAddr62 = readAddr[9:0];
                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = readAddr[9:0];
                readAddr2  = readAddr[9:0];
                readAddr1  = {readAddr[5:0],4'b0};
                readAddr0  = {readAddr[5:0],4'b0};

                writeData65 = {17'b0, writeData[31]};
                writeData64 = {17'b0, writeData[30]};
                writeData63 = {17'b0, writeData[29]};
                writeData62 = {17'b0, writeData[28]};
                writeData61 = {17'b0, writeData[27]};
                writeData60 = {17'b0, writeData[26]};
                writeData59 = {17'b0, writeData[25]};
                writeData58 = {17'b0, writeData[24]};
                writeData57 = {17'b0, writeData[23]};
                writeData56 = {17'b0, writeData[22]};
                writeData55 = {17'b0, writeData[21]};
                writeData54 = {17'b0, writeData[20]};
                writeData53 = {17'b0, writeData[19]};
                writeData52 = {17'b0, writeData[18]};
                writeData51 = {17'b0, writeData[17]};
                writeData50 = {17'b0, writeData[16]};
                writeData49 = {17'b0, writeData[15]};
                writeData48 = {17'b0, writeData[14]};
                writeData47 = {17'b0, writeData[13]};
                writeData46 = {17'b0, writeData[12]};
                writeData45 = {17'b0, writeData[11]};
                writeData44 = {17'b0, writeData[10]};
                writeData43 = {17'b0, writeData[9]};
                writeData42 = {17'b0, writeData[8]};
                writeData41 = {17'b0, writeData[7]};
                writeData40 = {17'b0, writeData[6]};
                writeData39 = {17'b0, writeData[5]};
                writeData38 = {17'b0, writeData[4]};
                writeData37 = {17'b0, writeData[3]};
                writeData36 = {17'b0, writeData[2]};
                writeData35 = {17'b0, writeData[1]};
                writeData34 = {17'b0, writeData[0]};
                writeData33 = {17'b0, writeData[31]};
                writeData32 = {17'b0, writeData[30]};
                writeData31 = {17'b0, writeData[29]};
                writeData30 = {17'b0, writeData[28]};
                writeData29 = {17'b0, writeData[27]};
                writeData28 = {17'b0, writeData[26]};
                writeData27 = {17'b0, writeData[25]};
                writeData26 = {17'b0, writeData[24]};
                writeData25 = {17'b0, writeData[23]};
                writeData24 = {17'b0, writeData[22]};
                writeData23 = {17'b0, writeData[21]};
                writeData22 = {17'b0, writeData[20]};
                writeData21 = {17'b0, writeData[19]};
                writeData20 = {17'b0, writeData[18]};
                writeData19 = {17'b0, writeData[17]};
                writeData18 = {17'b0, writeData[16]};
                writeData17 = {17'b0, writeData[15]};
                writeData16 = {17'b0, writeData[14]};
                writeData15 = {17'b0, writeData[13]};
                writeData14 = {17'b0, writeData[12]};
                writeData13 = {17'b0, writeData[11]};
                writeData12 = {17'b0, writeData[10]};
                writeData11 = {17'b0, writeData[9]};
                writeData10 = {17'b0, writeData[8]};
                writeData9  = {17'b0, writeData[7]};
                writeData8  = {17'b0, writeData[6]};
                writeData7  = {17'b0, writeData[5]};
                writeData6  = {17'b0, writeData[4]};
                writeData5  = {17'b0, writeData[3]};
                writeData4  = {17'b0, writeData[2]};
                writeData3  = {17'b0, writeData[1]};
                writeData2  = {17'b0, writeData[0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};


               case (writeAddr[11:6])
               6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
               6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                  wen_a65 = wen;
                  wen_a64 = wen;
                  wen_a63 = wen;
                  wen_a62 = wen;
                  wen_a61 = wen;
                  wen_a60 = wen;
                  wen_a59 = wen;
                  wen_a58 = wen;
                  wen_a57 = wen;
                  wen_a56 = wen;
                  wen_a55 = wen;
                  wen_a54 = wen;
                  wen_a53 = wen;
                  wen_a52 = wen;
                  wen_a51 = wen;
                  wen_a50 = wen;
                  wen_a49 = wen;
                  wen_a48 = wen;
                  wen_a47 = wen;
                  wen_a46 = wen;
                  wen_a45 = wen;
                  wen_a44 = wen;
                  wen_a43 = wen;
                  wen_a42 = wen;
                  wen_a41 = wen;
                  wen_a40 = wen;
                  wen_a39 = wen;
                  wen_a38 = wen;
                  wen_a37 = wen;
                  wen_a36 = wen;
                  wen_a35 = wen;
                  wen_a34 = wen;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
               
               6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = wen;
                  wen_a32 = wen;
                  wen_a31 = wen;
                  wen_a30 = wen;
                  wen_a29 = wen;
                  wen_a28 = wen;
                  wen_a27 = wen;
                  wen_a26 = wen;
                  wen_a25 = wen;
                  wen_a24 = wen;
                  wen_a23 = wen;
                  wen_a22 = wen;
                  wen_a21 = wen;
                  wen_a20 = wen;
                  wen_a19 = wen;
                  wen_a18 = wen;
                  wen_a17 = wen;
                  wen_a16 = wen;
                  wen_a15 = wen;
                  wen_a14 = wen;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               6'b100000 : begin
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
                 default :  begin
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;                   
                 end // case: default
               endcase // case (writeAddr[11:6])
               
  
               case (ckRdAddr[11:6])
                 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
                 6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                    readData = {
                                  readData65[0],
                                  readData64[0],
                                  readData63[0],
                                  readData62[0],
                                  readData61[0],
                                  readData60[0],
                                  readData59[0],
                                  readData58[0],
                                  readData57[0],
                                  readData56[0],
                                  readData55[0],
                                  readData54[0],
                                  readData53[0],
                                  readData52[0],
                                  readData51[0],
                                  readData50[0],
                                  readData49[0],
                                  readData48[0],
                                  readData47[0],
                                  readData46[0],
                                  readData45[0],
                                  readData44[0],
                                  readData43[0],
                                  readData42[0],
                                  readData41[0],
                                  readData40[0],
                                  readData39[0],
                                  readData38[0],
                                  readData37[0],
                                  readData36[0],
                                  readData35[0],
                                  readData34[0]
                                };
                     end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
                   6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
                   6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin                   
                      readData = {
                                    readData33[0],
                                    readData32[0],
                                    readData31[0],
                                    readData30[0],
                                    readData29[0],
                                    readData28[0],
                                    readData27[0],
                                    readData26[0],
                                    readData25[0],
                                    readData24[0],
                                    readData23[0],
                                    readData22[0],
                                    readData21[0],
                                    readData20[0],
                                    readData19[0],
                                    readData18[0],
                                    readData17[0],
                                    readData16[0],
                                    readData15[0],
                                    readData14[0],
                                    readData13[0],
                                    readData12[0],
                                    readData11[0],
                                    readData10[0],
                                    readData9[0], 
                                    readData8[0], 
                                    readData7[0], 
                                    readData6[0], 
                                    readData5[0], 
                                    readData4[0], 
                                    readData3[0], 
                                    readData2[0]
                                  };
                 end                 
                 6'b100000 : begin
                    readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

            2176: begin
                width67 = 3'b000;
                width66 = 3'b000;
                width65 = 3'b000;
                width64 = 3'b000;
                width63 = 3'b000;
                width62 = 3'b000;
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b000;
                width4  = 3'b000;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b011;
                width0  = 3'b011;

                writeAddr67 = writeAddr[9:0];
                writeAddr66 = writeAddr[9:0];
                writeAddr65 = writeAddr[9:0];
                writeAddr64 = writeAddr[9:0];
                writeAddr63 = writeAddr[9:0];
                writeAddr62 = writeAddr[9:0];
                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = writeAddr[9:0];
                writeAddr4  = writeAddr[9:0];
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[6:0], 3'b0};
                writeAddr0  = {writeAddr[6:0], 3'b0};

                readAddr67 = readAddr[9:0];
                readAddr66 = readAddr[9:0];
                readAddr65 = readAddr[9:0];
                readAddr64 = readAddr[9:0];
                readAddr63 = readAddr[9:0];
                readAddr62 = readAddr[9:0];
                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = readAddr[9:0];
                readAddr4  = readAddr[9:0];
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[6:0],  3'b0};
                readAddr0  = {readAddr[6:0],  3'b0};

                writeData67 = {17'b0, writeData[31]};
                writeData66 = {17'b0, writeData[30]};
                writeData65 = {17'b0, writeData[29]};
                writeData64 = {17'b0, writeData[28]};
                writeData63 = {17'b0, writeData[27]};
                writeData62 = {17'b0, writeData[26]};
                writeData61 = {17'b0, writeData[25]};
                writeData60 = {17'b0, writeData[24]};
                writeData59 = {17'b0, writeData[23]};
                writeData58 = {17'b0, writeData[22]};
                writeData57 = {17'b0, writeData[21]};
                writeData56 = {17'b0, writeData[20]};
                writeData55 = {17'b0, writeData[19]};
                writeData54 = {17'b0, writeData[18]};
                writeData53 = {17'b0, writeData[17]};
                writeData52 = {17'b0, writeData[16]};
                writeData51 = {17'b0, writeData[15]};
                writeData50 = {17'b0, writeData[14]};
                writeData49 = {17'b0, writeData[13]};
                writeData48 = {17'b0, writeData[12]};
                writeData47 = {17'b0, writeData[11]};
                writeData46 = {17'b0, writeData[10]};
                writeData45 = {17'b0, writeData[9]};
                writeData44 = {17'b0, writeData[8]};
                writeData43 = {17'b0, writeData[7]};
                writeData42 = {17'b0, writeData[6]};
                writeData41 = {17'b0, writeData[5]};
                writeData40 = {17'b0, writeData[4]};
                writeData39 = {17'b0, writeData[3]};
                writeData38 = {17'b0, writeData[2]};
                writeData37 = {17'b0, writeData[1]};
                writeData36 = {17'b0, writeData[0]};
                writeData35 = {17'b0, writeData[31]};
                writeData34 = {17'b0, writeData[30]};
                writeData33 = {17'b0, writeData[29]};
                writeData32 = {17'b0, writeData[28]};
                writeData31 = {17'b0, writeData[27]};
                writeData30 = {17'b0, writeData[26]};
                writeData29 = {17'b0, writeData[25]};
                writeData28 = {17'b0, writeData[24]};
                writeData27 = {17'b0, writeData[23]};
                writeData26 = {17'b0, writeData[22]};
                writeData25 = {17'b0, writeData[21]};
                writeData24 = {17'b0, writeData[20]};
                writeData23 = {17'b0, writeData[19]};
                writeData22 = {17'b0, writeData[18]};
                writeData21 = {17'b0, writeData[17]};
                writeData20 = {17'b0, writeData[16]};
                writeData19 = {17'b0, writeData[15]};
                writeData18 = {17'b0, writeData[14]};
                writeData17 = {17'b0, writeData[13]};
                writeData16 = {17'b0, writeData[12]};
                writeData15 = {17'b0, writeData[11]};
                writeData14 = {17'b0, writeData[10]};
                writeData13 = {17'b0, writeData[9]};
                writeData12 = {17'b0, writeData[8]};
                writeData11 = {17'b0, writeData[7]};
                writeData10 = {17'b0, writeData[6]};
                writeData9  = {17'b0, writeData[5]};
                writeData8  = {17'b0, writeData[4]};
                writeData7  = {17'b0, writeData[3]};
                writeData6  = {17'b0, writeData[2]};
                writeData5  = {17'b0, writeData[1]};
                writeData4  = {17'b0, writeData[0]};
                writeData3  = {10'b0, writeData[31:24]};
                writeData2  = {10'b0, writeData[23:16]};
                writeData1  = {10'b0, writeData[15:8]};
                writeData0  = {10'b0, writeData[7:0]};



               case (writeAddr[11:6])
               6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
               6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                  wen_a67 = wen;
                  wen_a66 = wen;
                  wen_a65 = wen;
                  wen_a64 = wen;
                  wen_a63 = wen;
                  wen_a62 = wen;
                  wen_a61 = wen;
                  wen_a60 = wen;
                  wen_a59 = wen;
                  wen_a58 = wen;
                  wen_a57 = wen;
                  wen_a56 = wen;
                  wen_a55 = wen;
                  wen_a54 = wen;
                  wen_a53 = wen;
                  wen_a52 = wen;
                  wen_a51 = wen;
                  wen_a50 = wen;
                  wen_a49 = wen;
                  wen_a48 = wen;
                  wen_a47 = wen;
                  wen_a46 = wen;
                  wen_a45 = wen;
                  wen_a44 = wen;
                  wen_a43 = wen;
                  wen_a42 = wen;
                  wen_a41 = wen;
                  wen_a40 = wen;
                  wen_a39 = wen;
                  wen_a38 = wen;
                  wen_a37 = wen;
                  wen_a36 = wen;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
               
               6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = wen;
                  wen_a34 = wen;
                  wen_a33 = wen;
                  wen_a32 = wen;
                  wen_a31 = wen;
                  wen_a30 = wen;
                  wen_a29 = wen;
                  wen_a28 = wen;
                  wen_a27 = wen;
                  wen_a26 = wen;
                  wen_a25 = wen;
                  wen_a24 = wen;
                  wen_a23 = wen;
                  wen_a22 = wen;
                  wen_a21 = wen;
                  wen_a20 = wen;
                  wen_a19 = wen;
                  wen_a18 = wen;
                  wen_a17 = wen;
                  wen_a16 = wen;
                  wen_a15 = wen;
                  wen_a14 = wen;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               6'b100000, 6'b100001 : begin
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
                 default :  begin
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;                   
                 end // case: default
               endcase // case (writeAddr[11:6])
               
  
               case (ckRdAddr[11:6])
                 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
                 6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                    readData = {
                                  readData67[0],
                                  readData66[0],
                                  readData65[0],
                                  readData64[0],
                                  readData63[0],
                                  readData62[0],
                                  readData61[0],
                                  readData60[0],
                                  readData59[0],
                                  readData58[0],
                                  readData57[0],
                                  readData56[0],
                                  readData55[0],
                                  readData54[0],
                                  readData53[0],
                                  readData52[0],
                                  readData51[0],
                                  readData50[0],
                                  readData49[0],
                                  readData48[0],
                                  readData47[0],
                                  readData46[0],
                                  readData45[0],
                                  readData44[0],
                                  readData43[0],
                                  readData42[0],
                                  readData41[0],
                                  readData40[0],
                                  readData39[0],
                                  readData38[0],
                                  readData37[0],
                                  readData36[0]
                                };
                     end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
                   6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
                   6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin                   
                      readData = {
                                    readData35[0],
                                    readData34[0],
                                    readData33[0],
                                    readData32[0],
                                    readData31[0],
                                    readData30[0],
                                    readData29[0],
                                    readData28[0],
                                    readData27[0],
                                    readData26[0],
                                    readData25[0],
                                    readData24[0],
                                    readData23[0],
                                    readData22[0],
                                    readData21[0],
                                    readData20[0],
                                    readData19[0],
                                    readData18[0],
                                    readData17[0],
                                    readData16[0],
                                    readData15[0],
                                    readData14[0],
                                    readData13[0],
                                    readData12[0],
                                    readData11[0],
                                    readData10[0],
                                    readData9[0], 
                                    readData8[0], 
                                    readData7[0], 
                                    readData6[0], 
                                    readData5[0], 
                                    readData4[0]
                                  };
                 end                 
                 6'b100000, 6'b100001 : begin
                    readData = {readData3[7:0],readData2[7:0],readData1[7:0],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

            2240: begin
                width69 = 3'b000;
                width68 = 3'b000;
                width67 = 3'b000;
                width66 = 3'b000;
                width65 = 3'b000;
                width64 = 3'b000;
                width63 = 3'b000;
                width62 = 3'b000;
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b000;
                width6  = 3'b000;
                width5  = 3'b011;
                width4  = 3'b011;
                width3  = 3'b011;
                width2  = 3'b011;
                width1  = 3'b100;
                width0  = 3'b100;

                writeAddr69 = writeAddr[9:0];
                writeAddr68 = writeAddr[9:0];
                writeAddr67 = writeAddr[9:0];
                writeAddr66 = writeAddr[9:0];
                writeAddr65 = writeAddr[9:0];
                writeAddr64 = writeAddr[9:0];
                writeAddr63 = writeAddr[9:0];
                writeAddr62 = writeAddr[9:0];
                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = writeAddr[9:0];
                writeAddr6  = writeAddr[9:0];
                writeAddr5  = {writeAddr[6:0], 3'b0};
                writeAddr4  = {writeAddr[6:0], 3'b0};
                writeAddr3  = {writeAddr[6:0], 3'b0};
                writeAddr2  = {writeAddr[6:0], 3'b0};
                writeAddr1  = {writeAddr[5:0], 4'b0};
                writeAddr0  = {writeAddr[5:0], 4'b0};

                readAddr69 = readAddr[9:0];
                readAddr68 = readAddr[9:0];
                readAddr67 = readAddr[9:0];
                readAddr66 = readAddr[9:0];
                readAddr65 = readAddr[9:0];
                readAddr64 = readAddr[9:0];
                readAddr63 = readAddr[9:0];
                readAddr62 = readAddr[9:0];
                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = readAddr[9:0];
                readAddr6  = readAddr[9:0];
                readAddr5  = {readAddr[6:0],  3'b0};
                readAddr4  = {readAddr[6:0],  3'b0};
                readAddr3  = {readAddr[6:0],  3'b0};
                readAddr2  = {readAddr[6:0],  3'b0};
                readAddr1  = {readAddr[5:0],  4'b0};
                readAddr0  = {readAddr[5:0],  4'b0};

                writeData69 = {17'b0, writeData[31]};
                writeData68 = {17'b0, writeData[30]};
                writeData67 = {17'b0, writeData[29]};
                writeData66 = {17'b0, writeData[28]};
                writeData65 = {17'b0, writeData[27]};
                writeData64 = {17'b0, writeData[26]};
                writeData63 = {17'b0, writeData[25]};
                writeData62 = {17'b0, writeData[24]};
                writeData61 = {17'b0, writeData[23]};
                writeData60 = {17'b0, writeData[22]};
                writeData59 = {17'b0, writeData[21]};
                writeData58 = {17'b0, writeData[20]};
                writeData57 = {17'b0, writeData[19]};
                writeData56 = {17'b0, writeData[18]};
                writeData55 = {17'b0, writeData[17]};
                writeData54 = {17'b0, writeData[16]};
                writeData53 = {17'b0, writeData[15]};
                writeData52 = {17'b0, writeData[14]};
                writeData51 = {17'b0, writeData[13]};
                writeData50 = {17'b0, writeData[12]};
                writeData49 = {17'b0, writeData[11]};
                writeData48 = {17'b0, writeData[10]};
                writeData47 = {17'b0, writeData[9]};
                writeData46 = {17'b0, writeData[8]};
                writeData45 = {17'b0, writeData[7]};
                writeData44 = {17'b0, writeData[6]};
                writeData43 = {17'b0, writeData[5]};
                writeData42 = {17'b0, writeData[4]};
                writeData41 = {17'b0, writeData[3]};
                writeData40 = {17'b0, writeData[2]};
                writeData39 = {17'b0, writeData[1]};
                writeData38 = {17'b0, writeData[0]};
                writeData37 = {17'b0, writeData[31]};
                writeData36 = {17'b0, writeData[30]};
                writeData35 = {17'b0, writeData[29]};
                writeData34 = {17'b0, writeData[28]};
                writeData33 = {17'b0, writeData[27]};
                writeData32 = {17'b0, writeData[26]};
                writeData31 = {17'b0, writeData[25]};
                writeData30 = {17'b0, writeData[24]};
                writeData29 = {17'b0, writeData[23]};
                writeData28 = {17'b0, writeData[22]};
                writeData27 = {17'b0, writeData[21]};
                writeData26 = {17'b0, writeData[20]};
                writeData25 = {17'b0, writeData[19]};
                writeData24 = {17'b0, writeData[18]};
                writeData23 = {17'b0, writeData[17]};
                writeData22 = {17'b0, writeData[16]};
                writeData21 = {17'b0, writeData[15]};
                writeData20 = {17'b0, writeData[14]};
                writeData19 = {17'b0, writeData[13]};
                writeData18 = {17'b0, writeData[12]};
                writeData17 = {17'b0, writeData[11]};
                writeData16 = {17'b0, writeData[10]};
                writeData15 = {17'b0, writeData[9]};
                writeData14 = {17'b0, writeData[8]};
                writeData13 = {17'b0, writeData[7]};
                writeData12 = {17'b0, writeData[6]};
                writeData11 = {17'b0, writeData[5]};
                writeData10 = {17'b0, writeData[4]};
                writeData9  = {17'b0, writeData[3]};
                writeData8  = {17'b0, writeData[2]};
                writeData7  = {17'b0, writeData[1]};
                writeData6  = {17'b0, writeData[0]};
                writeData5  = {10'b0, writeData[31:24]};
                writeData4  = {10'b0, writeData[23:16]};
                writeData3  = {10'b0, writeData[15:8]};
                writeData2  = {10'b0, writeData[7:0]};
                writeData1  = {1'b0, writeData[31:24], 1'b0, writeData[23:16]};
                writeData0  = {1'b0, writeData[15:8], 1'b0, writeData[7:0]};



               case (writeAddr[11:6])
               6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
               6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                  wen_a69 = wen;
                  wen_a68 = wen;
                  wen_a67 = wen;
                  wen_a66 = wen;
                  wen_a65 = wen;
                  wen_a64 = wen;
                  wen_a63 = wen;
                  wen_a62 = wen;
                  wen_a61 = wen;
                  wen_a60 = wen;
                  wen_a59 = wen;
                  wen_a58 = wen;
                  wen_a57 = wen;
                  wen_a56 = wen;
                  wen_a55 = wen;
                  wen_a54 = wen;
                  wen_a53 = wen;
                  wen_a52 = wen;
                  wen_a51 = wen;
                  wen_a50 = wen;
                  wen_a49 = wen;
                  wen_a48 = wen;
                  wen_a47 = wen;
                  wen_a46 = wen;
                  wen_a45 = wen;
                  wen_a44 = wen;
                  wen_a43 = wen;
                  wen_a42 = wen;
                  wen_a41 = wen;
                  wen_a40 = wen;
                  wen_a39 = wen;
                  wen_a38 = wen;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
               
               6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = wen;
                  wen_a36 = wen;
                  wen_a35 = wen;
                  wen_a34 = wen;
                  wen_a33 = wen;
                  wen_a32 = wen;
                  wen_a31 = wen;
                  wen_a30 = wen;
                  wen_a29 = wen;
                  wen_a28 = wen;
                  wen_a27 = wen;
                  wen_a26 = wen;
                  wen_a25 = wen;
                  wen_a24 = wen;
                  wen_a23 = wen;
                  wen_a22 = wen;
                  wen_a21 = wen;
                  wen_a20 = wen;
                  wen_a19 = wen;
                  wen_a18 = wen;
                  wen_a17 = wen;
                  wen_a16 = wen;
                  wen_a15 = wen;
                  wen_a14 = wen;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               6'b100000, 6'b100001 : begin
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               6'b100010 : begin
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
                 default :  begin
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;                   
                 end // case: default
               endcase // case (writeAddr[11:6])
               
  
               case (ckRdAddr[11:6])
                 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
                 6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                    readData = {
                                  readData69[0],
                                  readData68[0],
                                  readData67[0],
                                  readData66[0],
                                  readData65[0],
                                  readData64[0],
                                  readData63[0],
                                  readData62[0],
                                  readData61[0],
                                  readData60[0],
                                  readData59[0],
                                  readData58[0],
                                  readData57[0],
                                  readData56[0],
                                  readData55[0],
                                  readData54[0],
                                  readData53[0],
                                  readData52[0],
                                  readData51[0],
                                  readData50[0],
                                  readData49[0],
                                  readData48[0],
                                  readData47[0],
                                  readData46[0],
                                  readData45[0],
                                  readData44[0],
                                  readData43[0],
                                  readData42[0],
                                  readData41[0],
                                  readData40[0],
                                  readData39[0],
                                  readData38[0]
                                };
                     end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
                   6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
                   6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin                   
                      readData = {
                                    readData37[0],
                                    readData36[0],
                                    readData35[0],
                                    readData34[0],
                                    readData33[0],
                                    readData32[0],
                                    readData31[0],
                                    readData30[0],
                                    readData29[0],
                                    readData28[0],
                                    readData27[0],
                                    readData26[0],
                                    readData25[0],
                                    readData24[0],
                                    readData23[0],
                                    readData22[0],
                                    readData21[0],
                                    readData20[0],
                                    readData19[0],
                                    readData18[0],
                                    readData17[0],
                                    readData16[0],
                                    readData15[0],
                                    readData14[0],
                                    readData13[0],
                                    readData12[0],
                                    readData11[0],
                                    readData10[0],
                                    readData9[0], 
                                    readData8[0], 
                                    readData7[0], 
                                    readData6[0]
                                  };
                 end                 
                 6'b100000, 6'b100001 : begin
                    readData = {readData5[7:0],readData4[7:0],readData3[7:0],readData2[7:0]};
                 end
                 6'b100010 : begin
                    readData = {readData1[16:9],readData1[7:0],readData0[16:9],readData0[7:0]};
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

            2304: begin
                width71 = 3'b000;
                width70 = 3'b000;
                width69 = 3'b000;
                width68 = 3'b000;
                width67 = 3'b000;
                width66 = 3'b000;
                width65 = 3'b000;
                width64 = 3'b000;
                width63 = 3'b000;
                width62 = 3'b000;
                width61 = 3'b000;
                width60 = 3'b000;
                width59 = 3'b000;
                width58 = 3'b000;
                width57 = 3'b000;
                width56 = 3'b000;
                width55 = 3'b000;
                width54 = 3'b000;
                width53 = 3'b000;
                width52 = 3'b000;
                width51 = 3'b000;
                width50 = 3'b000;
                width49 = 3'b000;
                width48 = 3'b000;
                width47 = 3'b000;
                width46 = 3'b000;
                width45 = 3'b000;
                width44 = 3'b000;
                width43 = 3'b000;
                width42 = 3'b000;
                width41 = 3'b000;
                width40 = 3'b000;
                width39 = 3'b000;
                width38 = 3'b000;
                width37 = 3'b000;
                width36 = 3'b000;
                width35 = 3'b000;
                width34 = 3'b000;
                width33 = 3'b000;
                width32 = 3'b000;
                width31 = 3'b000;
                width30 = 3'b000;
                width29 = 3'b000;
                width28 = 3'b000;
                width27 = 3'b000;
                width26 = 3'b000;
                width25 = 3'b000;
                width24 = 3'b000;
                width23 = 3'b000;
                width22 = 3'b000;
                width21 = 3'b000;
                width20 = 3'b000;
                width19 = 3'b000;
                width18 = 3'b000;
                width17 = 3'b000;
                width16 = 3'b000;
                width15 = 3'b000;
                width14 = 3'b000;
                width13 = 3'b000;
                width12 = 3'b000;
                width11 = 3'b000;
                width10 = 3'b000;
                width9  = 3'b000;
                width8  = 3'b000;
                width7  = 3'b010;
                width6  = 3'b010;
                width5  = 3'b010;
                width4  = 3'b010;
                width3  = 3'b010;
                width2  = 3'b010;
                width1  = 3'b010;
                width0  = 3'b010;

                writeAddr71 = writeAddr[9:0];
                writeAddr70 = writeAddr[9:0];
                writeAddr69 = writeAddr[9:0];
                writeAddr68 = writeAddr[9:0];
                writeAddr67 = writeAddr[9:0];
                writeAddr66 = writeAddr[9:0];
                writeAddr65 = writeAddr[9:0];
                writeAddr64 = writeAddr[9:0];
                writeAddr63 = writeAddr[9:0];
                writeAddr62 = writeAddr[9:0];
                writeAddr61 = writeAddr[9:0];
                writeAddr60 = writeAddr[9:0];
                writeAddr59 = writeAddr[9:0];
                writeAddr58 = writeAddr[9:0];
                writeAddr57 = writeAddr[9:0];
                writeAddr56 = writeAddr[9:0];
                writeAddr55 = writeAddr[9:0];
                writeAddr54 = writeAddr[9:0];
                writeAddr53 = writeAddr[9:0];
                writeAddr52 = writeAddr[9:0];
                writeAddr51 = writeAddr[9:0];
                writeAddr50 = writeAddr[9:0];
                writeAddr49 = writeAddr[9:0];
                writeAddr48 = writeAddr[9:0];
                writeAddr47 = writeAddr[9:0];
                writeAddr46 = writeAddr[9:0];
                writeAddr45 = writeAddr[9:0];
                writeAddr44 = writeAddr[9:0];
                writeAddr43 = writeAddr[9:0];
                writeAddr42 = writeAddr[9:0];
                writeAddr41 = writeAddr[9:0];
                writeAddr40 = writeAddr[9:0];
                writeAddr39 = writeAddr[9:0];
                writeAddr38 = writeAddr[9:0];
                writeAddr37 = writeAddr[9:0];
                writeAddr36 = writeAddr[9:0];
                writeAddr35 = writeAddr[9:0];
                writeAddr34 = writeAddr[9:0];
                writeAddr33 = writeAddr[9:0];
                writeAddr32 = writeAddr[9:0];
                writeAddr31 = writeAddr[9:0];
                writeAddr30 = writeAddr[9:0];
                writeAddr29 = writeAddr[9:0];
                writeAddr28 = writeAddr[9:0];
                writeAddr27 = writeAddr[9:0];
                writeAddr26 = writeAddr[9:0];
                writeAddr25 = writeAddr[9:0];
                writeAddr24 = writeAddr[9:0];
                writeAddr23 = writeAddr[9:0];
                writeAddr22 = writeAddr[9:0];
                writeAddr21 = writeAddr[9:0];
                writeAddr20 = writeAddr[9:0];
                writeAddr19 = writeAddr[9:0];
                writeAddr18 = writeAddr[9:0];
                writeAddr17 = writeAddr[9:0];
                writeAddr16 = writeAddr[9:0];
                writeAddr15 = writeAddr[9:0];
                writeAddr14 = writeAddr[9:0];
                writeAddr13 = writeAddr[9:0];
                writeAddr12 = writeAddr[9:0];
                writeAddr11 = writeAddr[9:0];
                writeAddr10 = writeAddr[9:0];
                writeAddr9  = writeAddr[9:0];
                writeAddr8  = writeAddr[9:0];
                writeAddr7  = {writeAddr[7:0], 2'b0};
                writeAddr6  = {writeAddr[7:0], 2'b0};
                writeAddr5  = {writeAddr[7:0], 2'b0};
                writeAddr4  = {writeAddr[7:0], 2'b0};
                writeAddr3  = {writeAddr[7:0], 2'b0};
                writeAddr2  = {writeAddr[7:0], 2'b0};
                writeAddr1  = {writeAddr[7:0], 2'b0};
                writeAddr0  = {writeAddr[7:0], 2'b0};

                readAddr71 = readAddr[9:0];
                readAddr70 = readAddr[9:0];
                readAddr69 = readAddr[9:0];
                readAddr68 = readAddr[9:0];
                readAddr67 = readAddr[9:0];
                readAddr66 = readAddr[9:0];
                readAddr65 = readAddr[9:0];
                readAddr64 = readAddr[9:0];
                readAddr63 = readAddr[9:0];
                readAddr62 = readAddr[9:0];
                readAddr61 = readAddr[9:0];
                readAddr60 = readAddr[9:0];
                readAddr59 = readAddr[9:0];
                readAddr58 = readAddr[9:0];
                readAddr57 = readAddr[9:0];
                readAddr56 = readAddr[9:0];
                readAddr55 = readAddr[9:0];
                readAddr54 = readAddr[9:0];
                readAddr53 = readAddr[9:0];
                readAddr52 = readAddr[9:0];
                readAddr51 = readAddr[9:0];
                readAddr50 = readAddr[9:0];
                readAddr49 = readAddr[9:0];
                readAddr48 = readAddr[9:0];
                readAddr47 = readAddr[9:0];
                readAddr46 = readAddr[9:0];
                readAddr45 = readAddr[9:0];
                readAddr44 = readAddr[9:0];
                readAddr43 = readAddr[9:0];
                readAddr42 = readAddr[9:0];
                readAddr41 = readAddr[9:0];
                readAddr40 = readAddr[9:0];
                readAddr39 = readAddr[9:0];
                readAddr38 = readAddr[9:0];
                readAddr37 = readAddr[9:0];
                readAddr36 = readAddr[9:0];
                readAddr35 = readAddr[9:0];
                readAddr34 = readAddr[9:0];
                readAddr33 = readAddr[9:0];
                readAddr32 = readAddr[9:0];
                readAddr31 = readAddr[9:0];
                readAddr30 = readAddr[9:0];
                readAddr29 = readAddr[9:0];
                readAddr28 = readAddr[9:0];
                readAddr27 = readAddr[9:0];
                readAddr26 = readAddr[9:0];
                readAddr25 = readAddr[9:0];
                readAddr24 = readAddr[9:0];
                readAddr23 = readAddr[9:0];
                readAddr22 = readAddr[9:0];
                readAddr21 = readAddr[9:0];
                readAddr20 = readAddr[9:0];
                readAddr19 = readAddr[9:0];
                readAddr18 = readAddr[9:0];
                readAddr17 = readAddr[9:0];
                readAddr16 = readAddr[9:0];
                readAddr15 = readAddr[9:0];
                readAddr14 = readAddr[9:0];
                readAddr13 = readAddr[9:0];
                readAddr12 = readAddr[9:0];
                readAddr11 = readAddr[9:0];
                readAddr10 = readAddr[9:0];
                readAddr9  = readAddr[9:0];
                readAddr8  = readAddr[9:0];
                readAddr7  = {readAddr[7:0], 2'b0};
                readAddr6  = {readAddr[7:0], 2'b0};
                readAddr5  = {readAddr[7:0], 2'b0};
                readAddr4  = {readAddr[7:0], 2'b0};
                readAddr3  = {readAddr[7:0], 2'b0};
                readAddr2  = {readAddr[7:0], 2'b0};
                readAddr1  = {readAddr[7:0], 2'b0};
                readAddr0  = {readAddr[7:0], 2'b0};


                writeData71 = {17'b0, writeData[31]};
                writeData70 = {17'b0, writeData[30]};
                writeData69 = {17'b0, writeData[29]};
                writeData68 = {17'b0, writeData[28]};
                writeData67 = {17'b0, writeData[27]};
                writeData66 = {17'b0, writeData[26]};
                writeData65 = {17'b0, writeData[25]};
                writeData64 = {17'b0, writeData[24]};
                writeData63 = {17'b0, writeData[23]};
                writeData62 = {17'b0, writeData[22]};
                writeData61 = {17'b0, writeData[21]};
                writeData60 = {17'b0, writeData[20]};
                writeData59 = {17'b0, writeData[19]};
                writeData58 = {17'b0, writeData[18]};
                writeData57 = {17'b0, writeData[17]};
                writeData56 = {17'b0, writeData[16]};
                writeData55 = {17'b0, writeData[15]};
                writeData54 = {17'b0, writeData[14]};
                writeData53 = {17'b0, writeData[13]};
                writeData52 = {17'b0, writeData[12]};
                writeData51 = {17'b0, writeData[11]};
                writeData50 = {17'b0, writeData[10]};
                writeData49 = {17'b0, writeData[9]};
                writeData48 = {17'b0, writeData[8]};
                writeData47 = {17'b0, writeData[7]};
                writeData46 = {17'b0, writeData[6]};
                writeData45 = {17'b0, writeData[5]};
                writeData44 = {17'b0, writeData[4]};
                writeData43 = {17'b0, writeData[3]};
                writeData42 = {17'b0, writeData[2]};
                writeData41 = {17'b0, writeData[1]};
                writeData40 = {17'b0, writeData[0]};
                writeData39 = {17'b0, writeData[31]};
                writeData38 = {17'b0, writeData[30]};
                writeData37 = {17'b0, writeData[29]};
                writeData36 = {17'b0, writeData[28]};
                writeData35 = {17'b0, writeData[27]};
                writeData34 = {17'b0, writeData[26]};
                writeData33 = {17'b0, writeData[25]};
                writeData32 = {17'b0, writeData[24]};
                writeData31 = {17'b0, writeData[23]};
                writeData30 = {17'b0, writeData[22]};
                writeData29 = {17'b0, writeData[21]};
                writeData28 = {17'b0, writeData[20]};
                writeData27 = {17'b0, writeData[19]};
                writeData26 = {17'b0, writeData[18]};
                writeData25 = {17'b0, writeData[17]};
                writeData24 = {17'b0, writeData[16]};
                writeData23 = {17'b0, writeData[15]};
                writeData22 = {17'b0, writeData[14]};
                writeData21 = {17'b0, writeData[13]};
                writeData20 = {17'b0, writeData[12]};
                writeData19 = {17'b0, writeData[11]};
                writeData18 = {17'b0, writeData[10]};
                writeData17 = {17'b0, writeData[9]};
                writeData16 = {17'b0, writeData[8]};
                writeData15 = {17'b0, writeData[7]};
                writeData14 = {17'b0, writeData[6]};
                writeData13 = {17'b0, writeData[5]};
                writeData12 = {17'b0, writeData[4]};
                writeData11 = {17'b0, writeData[3]};
                writeData10 = {17'b0, writeData[2]};
                writeData9  = {17'b0, writeData[1]};
                writeData8  = {17'b0, writeData[0]};
                writeData7  = {14'b0, writeData[31:28]};
                writeData6  = {14'b0, writeData[27:24]};
                writeData5  = {14'b0, writeData[23:20]};
                writeData4  = {14'b0, writeData[19:16]};
                writeData3  = {14'b0, writeData[15:12]};
                writeData2  = {14'b0, writeData[11:8]};
                writeData1  = {14'b0, writeData[7:4]};
                writeData0  = {14'b0, writeData[3:0]};



               case (writeAddr[11:6])
               6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
               6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                  wen_a71 = wen;
                  wen_a70 = wen;
                  wen_a69 = wen;
                  wen_a68 = wen;
                  wen_a67 = wen;
                  wen_a66 = wen;
                  wen_a65 = wen;
                  wen_a64 = wen;
                  wen_a63 = wen;
                  wen_a62 = wen;
                  wen_a61 = wen;
                  wen_a60 = wen;
                  wen_a59 = wen;
                  wen_a58 = wen;
                  wen_a57 = wen;
                  wen_a56 = wen;
                  wen_a55 = wen;
                  wen_a54 = wen;
                  wen_a53 = wen;
                  wen_a52 = wen;
                  wen_a51 = wen;
                  wen_a50 = wen;
                  wen_a49 = wen;
                  wen_a48 = wen;
                  wen_a47 = wen;
                  wen_a46 = wen;
                  wen_a45 = wen;
                  wen_a44 = wen;
                  wen_a43 = wen;
                  wen_a42 = wen;
                  wen_a41 = wen;
                  wen_a40 = wen;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
               
               6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
               6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin
                  wen_a71 = 1'b0;
                  wen_a70 = 1'b0;
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = wen;
                  wen_a38 = wen;
                  wen_a37 = wen;
                  wen_a36 = wen;
                  wen_a35 = wen;
                  wen_a34 = wen;
                  wen_a33 = wen;
                  wen_a32 = wen;
                  wen_a31 = wen;
                  wen_a30 = wen;
                  wen_a29 = wen;
                  wen_a28 = wen;
                  wen_a27 = wen;
                  wen_a26 = wen;
                  wen_a25 = wen;
                  wen_a24 = wen;
                  wen_a23 = wen;
                  wen_a22 = wen;
                  wen_a21 = wen;
                  wen_a20 = wen;
                  wen_a19 = wen;
                  wen_a18 = wen;
                  wen_a17 = wen;
                  wen_a16 = wen;
                  wen_a15 = wen;
                  wen_a14 = wen;
                  wen_a13 = wen;
                  wen_a12 = wen;
                  wen_a11 = wen;
                  wen_a10 = wen;
                  wen_a9  = wen;
                  wen_a8  = wen;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;
               end
               6'b100000, 6'b100001, 6'b100010, 6'b100011 : begin
                  wen_a71 = 1'b0;
                  wen_a70 = 1'b0;
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = wen;
                  wen_a6  = wen;
                  wen_a5  = wen;
                  wen_a4  = wen;
                  wen_a3  = wen;
                  wen_a2  = wen;
                  wen_a1  = wen;
                  wen_a0  = wen;
               end
                 default :  begin
                  wen_a71 = 1'b0;
                  wen_a70 = 1'b0;
                  wen_a69 = 1'b0;
                  wen_a68 = 1'b0;
                  wen_a67 = 1'b0;
                  wen_a66 = 1'b0;
                  wen_a65 = 1'b0;
                  wen_a64 = 1'b0;
                  wen_a63 = 1'b0;
                  wen_a62 = 1'b0;
                  wen_a61 = 1'b0;
                  wen_a60 = 1'b0;
                  wen_a59 = 1'b0;
                  wen_a58 = 1'b0;
                  wen_a57 = 1'b0;
                  wen_a56 = 1'b0;
                  wen_a55 = 1'b0;
                  wen_a54 = 1'b0;
                  wen_a53 = 1'b0;
                  wen_a52 = 1'b0;
                  wen_a51 = 1'b0;
                  wen_a50 = 1'b0;
                  wen_a49 = 1'b0;
                  wen_a48 = 1'b0;
                  wen_a47 = 1'b0;
                  wen_a46 = 1'b0;
                  wen_a45 = 1'b0;
                  wen_a44 = 1'b0;
                  wen_a43 = 1'b0;
                  wen_a42 = 1'b0;
                  wen_a41 = 1'b0;
                  wen_a40 = 1'b0;
                  wen_a39 = 1'b0;
                  wen_a38 = 1'b0;
                  wen_a37 = 1'b0;
                  wen_a36 = 1'b0;
                  wen_a35 = 1'b0;
                  wen_a34 = 1'b0;
                  wen_a33 = 1'b0;
                  wen_a32 = 1'b0;
                  wen_a31 = 1'b0;
                  wen_a30 = 1'b0;
                  wen_a29 = 1'b0;
                  wen_a28 = 1'b0;
                  wen_a27 = 1'b0;
                  wen_a26 = 1'b0;
                  wen_a25 = 1'b0;
                  wen_a24 = 1'b0;
                  wen_a23 = 1'b0;
                  wen_a22 = 1'b0;
                  wen_a21 = 1'b0;
                  wen_a20 = 1'b0;
                  wen_a19 = 1'b0;
                  wen_a18 = 1'b0;
                  wen_a17 = 1'b0;
                  wen_a16 = 1'b0;
                  wen_a15 = 1'b0;
                  wen_a14 = 1'b0;
                  wen_a13 = 1'b0;
                  wen_a12 = 1'b0;
                  wen_a11 = 1'b0;
                  wen_a10 = 1'b0;
                  wen_a9  = 1'b0;
                  wen_a8  = 1'b0;
                  wen_a7  = 1'b0;
                  wen_a6  = 1'b0;
                  wen_a5  = 1'b0;
                  wen_a4  = 1'b0;
                  wen_a3  = 1'b0;
                  wen_a2  = 1'b0;
                  wen_a1  = 1'b0;
                  wen_a0  = 1'b0;                   
                 end // case: default
               endcase // case (writeAddr[11:6])
               
  
               case (ckRdAddr[11:6])
                 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001, 
                 6'b001010, 6'b001011, 6'b001100, 6'b001101, 6'b001110, 6'b001111 : begin
                    readData = {
                                  readData71[0],
                                  readData70[0],
                                  readData69[0],
                                  readData68[0],
                                  readData67[0],
                                  readData66[0],
                                  readData65[0],
                                  readData64[0],
                                  readData63[0],
                                  readData62[0],
                                  readData61[0],
                                  readData60[0],
                                  readData59[0],
                                  readData58[0],
                                  readData57[0],
                                  readData56[0],
                                  readData55[0],
                                  readData54[0],
                                  readData53[0],
                                  readData52[0],
                                  readData51[0],
                                  readData50[0],
                                  readData49[0],
                                  readData48[0],
                                  readData47[0],
                                  readData46[0],
                                  readData45[0],
                                  readData44[0],
                                  readData43[0],
                                  readData42[0],
                                  readData41[0],
                                  readData40[0]
                                };
                     end // case: 6'b000000, 6'b000001, 6'b000010, 6'b000011, 6'b000100, 6'b000101,6'b000110, 6'b000111, 6'b001000, 6'b001001,...
                   6'b010000, 6'b010001, 6'b010010, 6'b010011, 6'b010100, 6'b010101,6'b010110, 6'b010111, 6'b011000, 6'b011001, 
                   6'b011010, 6'b011011, 6'b011100, 6'b011101, 6'b011110, 6'b011111 : begin                   
                      readData = {
                                    readData39[0],
                                    readData38[0],
                                    readData37[0],
                                    readData36[0],
                                    readData35[0],
                                    readData34[0],
                                    readData33[0],
                                    readData32[0],
                                    readData31[0],
                                    readData30[0],
                                    readData29[0],
                                    readData28[0],
                                    readData27[0],
                                    readData26[0],
                                    readData25[0],
                                    readData24[0],
                                    readData23[0],
                                    readData22[0],
                                    readData21[0],
                                    readData20[0],
                                    readData19[0],
                                    readData18[0],
                                    readData17[0],
                                    readData16[0],
                                    readData15[0],
                                    readData14[0],
                                    readData13[0],
                                    readData12[0],
                                    readData11[0],
                                    readData10[0],
                                    readData9[0],
                                    readData8[0]
                                  };
                 end                 
                 6'b100000, 6'b100001, 6'b100010, 6'b100011 : begin
                    readData = {
                                readData7[3:0],
                                readData6[3:0],
                                readData5[3:0],
                                readData4[3:0],
                                readData3[3:0],
                                readData2[3:0],
                                readData1[3:0],
                                readData0[3:0]
                                };
                 end
                 default : begin
                    readData = 32'b0;
                 end
               endcase
            end

        endcase // case (USRAM_NUM_LOCATIONS_DWIDTH32)
    end //       if(APB_DWIDTH == 32) begin
   end // always @ (*)
   
    //----------------------------------------------------------------------------------------
    // RAM64x18 blocks
    //----------------------------------------------------------------------------------------

 
 RAM64x18 block_71(
                    .A_DOUT(readData71),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr71),            .B_ADDR(readAddr71),
                    .A_WIDTH(width71),              .B_WIDTH(width71),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr71),
                    .C_DIN(writeData71),            .C_WEN(wen_a71),
                    .C_BLK(cblk),                 .C_WIDTH(width71),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_71)
                   );

 RAM64x18 block_70(
                    .A_DOUT(readData70),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr70),            .B_ADDR(readAddr70),
                    .A_WIDTH(width70),              .B_WIDTH(width70),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr70),
                    .C_DIN(writeData70),            .C_WEN(wen_a70),
                    .C_BLK(cblk),                 .C_WIDTH(width70),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_70)
                   );

 RAM64x18 block_69(
                    .A_DOUT(readData69),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr69),            .B_ADDR(readAddr69),
                    .A_WIDTH(width69),              .B_WIDTH(width69),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr69),
                    .C_DIN(writeData69),            .C_WEN(wen_a69),
                    .C_BLK(cblk),                 .C_WIDTH(width69),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_69)
                   );
   
  RAM64x18 block_68(
                    .A_DOUT(readData68),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr68),            .B_ADDR(readAddr68),
                    .A_WIDTH(width68),              .B_WIDTH(width68),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr68),
                    .C_DIN(writeData68),            .C_WEN(wen_a68),
                    .C_BLK(cblk),                 .C_WIDTH(width68),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_68)
                   );

 RAM64x18 block_67(
                    .A_DOUT(readData67),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr67),            .B_ADDR(readAddr67),
                    .A_WIDTH(width67),              .B_WIDTH(width67),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr67),
                    .C_DIN(writeData67),            .C_WEN(wen_a67),
                    .C_BLK(cblk),                 .C_WIDTH(width67),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_67)
                   );

 RAM64x18 block_66(
                    .A_DOUT(readData66),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr66),            .B_ADDR(readAddr66),
                    .A_WIDTH(width66),              .B_WIDTH(width66),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr66),
                    .C_DIN(writeData66),            .C_WEN(wen_a66),
                    .C_BLK(cblk),                 .C_WIDTH(width66),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_66)
                   );

 RAM64x18 block_65(
                    .A_DOUT(readData65),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr65),            .B_ADDR(readAddr65),
                    .A_WIDTH(width65),              .B_WIDTH(width65),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr65),
                    .C_DIN(writeData65),            .C_WEN(wen_a65),
                    .C_BLK(cblk),                 .C_WIDTH(width65),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_65)
                   );
   
 RAM64x18 block_64(
                    .A_DOUT(readData64),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr64),            .B_ADDR(readAddr64),
                    .A_WIDTH(width64),              .B_WIDTH(width64),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr64),
                    .C_DIN(writeData64),            .C_WEN(wen_a64),
                    .C_BLK(cblk),                 .C_WIDTH(width64),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_64)
                   );

 RAM64x18 block_63(
                    .A_DOUT(readData63),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr63),            .B_ADDR(readAddr63),
                    .A_WIDTH(width63),              .B_WIDTH(width63),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr63),
                    .C_DIN(writeData63),            .C_WEN(wen_a63),
                    .C_BLK(cblk),                 .C_WIDTH(width63),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_63)
                   );

 RAM64x18 block_62(
                    .A_DOUT(readData62),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr62),            .B_ADDR(readAddr62),
                    .A_WIDTH(width62),              .B_WIDTH(width62),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr62),
                    .C_DIN(writeData62),            .C_WEN(wen_a62),
                    .C_BLK(cblk),                 .C_WIDTH(width62),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_62)
                   );


 RAM64x18 block_61(
                    .A_DOUT(readData61),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr61),            .B_ADDR(readAddr61),
                    .A_WIDTH(width61),              .B_WIDTH(width61),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr61),
                    .C_DIN(writeData61),            .C_WEN(wen_a61),
                    .C_BLK(cblk),                 .C_WIDTH(width61),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_61)
                   );

 RAM64x18 block_60(
                    .A_DOUT(readData60),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr60),            .B_ADDR(readAddr60),
                    .A_WIDTH(width60),              .B_WIDTH(width60),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr60),
                    .C_DIN(writeData60),            .C_WEN(wen_a60),
                    .C_BLK(cblk),                 .C_WIDTH(width60),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_60)
                   );

 RAM64x18 block_59(
                    .A_DOUT(readData59),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr59),            .B_ADDR(readAddr59),
                    .A_WIDTH(width59),              .B_WIDTH(width59),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr59),
                    .C_DIN(writeData59),            .C_WEN(wen_a59),
                    .C_BLK(cblk),                 .C_WIDTH(width59),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_59)
                   );

 RAM64x18 block_58(
                    .A_DOUT(readData58),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr58),            .B_ADDR(readAddr58),
                    .A_WIDTH(width58),              .B_WIDTH(width58),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr58),
                    .C_DIN(writeData58),            .C_WEN(wen_a58),
                    .C_BLK(cblk),                 .C_WIDTH(width58),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_58)
                   );

 RAM64x18 block_57(
                    .A_DOUT(readData57),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr57),            .B_ADDR(readAddr57),
                    .A_WIDTH(width57),              .B_WIDTH(width57),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr57),
                    .C_DIN(writeData57),            .C_WEN(wen_a57),
                    .C_BLK(cblk),                 .C_WIDTH(width57),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_57)
                   );

 RAM64x18 block_56(
                    .A_DOUT(readData56),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr56),            .B_ADDR(readAddr56),
                    .A_WIDTH(width56),              .B_WIDTH(width56),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr56),
                    .C_DIN(writeData56),            .C_WEN(wen_a56),
                    .C_BLK(cblk),                 .C_WIDTH(width56),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_56)
                   );

 RAM64x18 block_55(
                    .A_DOUT(readData55),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr55),            .B_ADDR(readAddr55),
                    .A_WIDTH(width55),              .B_WIDTH(width55),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr55),
                    .C_DIN(writeData55),            .C_WEN(wen_a55),
                    .C_BLK(cblk),                 .C_WIDTH(width55),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_55)
                   );

 RAM64x18 block_54(
                    .A_DOUT(readData54),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr54),            .B_ADDR(readAddr54),
                    .A_WIDTH(width54),              .B_WIDTH(width54),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr54),
                    .C_DIN(writeData54),            .C_WEN(wen_a54),
                    .C_BLK(cblk),                 .C_WIDTH(width54),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_54)
                   );

 RAM64x18 block_53(
                    .A_DOUT(readData53),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr53),            .B_ADDR(readAddr53),
                    .A_WIDTH(width53),              .B_WIDTH(width53),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr53),
                    .C_DIN(writeData53),            .C_WEN(wen_a53),
                    .C_BLK(cblk),                 .C_WIDTH(width53),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_53)
                   );

 RAM64x18 block_52(
                    .A_DOUT(readData52),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr52),            .B_ADDR(readAddr52),
                    .A_WIDTH(width52),              .B_WIDTH(width52),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr52),
                    .C_DIN(writeData52),            .C_WEN(wen_a52),
                    .C_BLK(cblk),                 .C_WIDTH(width52),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_52)
                   );

 RAM64x18 block_51(
                    .A_DOUT(readData51),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr51),            .B_ADDR(readAddr51),
                    .A_WIDTH(width51),              .B_WIDTH(width51),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr51),
                    .C_DIN(writeData51),            .C_WEN(wen_a51),
                    .C_BLK(cblk),                 .C_WIDTH(width51),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_51)
                   );

 RAM64x18 block_50(
                    .A_DOUT(readData50),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr50),            .B_ADDR(readAddr50),
                    .A_WIDTH(width50),              .B_WIDTH(width50),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr50),
                    .C_DIN(writeData50),            .C_WEN(wen_a50),
                    .C_BLK(cblk),                 .C_WIDTH(width50),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_50)
                   );

 RAM64x18 block_49(
                    .A_DOUT(readData49),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr49),            .B_ADDR(readAddr49),
                    .A_WIDTH(width49),              .B_WIDTH(width49),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr49),
                    .C_DIN(writeData49),            .C_WEN(wen_a49),
                    .C_BLK(cblk),                 .C_WIDTH(width49),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_49)
                   );

 RAM64x18 block_48(
                    .A_DOUT(readData48),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr48),            .B_ADDR(readAddr48),
                    .A_WIDTH(width48),              .B_WIDTH(width48),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr48),
                    .C_DIN(writeData48),            .C_WEN(wen_a48),
                    .C_BLK(cblk),                 .C_WIDTH(width48),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_48)
                   );

 RAM64x18 block_47(
                    .A_DOUT(readData47),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr47),            .B_ADDR(readAddr47),
                    .A_WIDTH(width47),              .B_WIDTH(width47),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr47),
                    .C_DIN(writeData47),            .C_WEN(wen_a47),
                    .C_BLK(cblk),                 .C_WIDTH(width47),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_47)
                   );

 RAM64x18 block_46(
                    .A_DOUT(readData46),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr46),            .B_ADDR(readAddr46),
                    .A_WIDTH(width46),              .B_WIDTH(width46),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr46),
                    .C_DIN(writeData46),            .C_WEN(wen_a46),
                    .C_BLK(cblk),                 .C_WIDTH(width46),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_46)
                   );

 RAM64x18 block_45(
                    .A_DOUT(readData45),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr45),            .B_ADDR(readAddr45),
                    .A_WIDTH(width45),              .B_WIDTH(width45),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr45),
                    .C_DIN(writeData45),            .C_WEN(wen_a45),
                    .C_BLK(cblk),                 .C_WIDTH(width45),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_45)
                   );

 RAM64x18 block_44(
                    .A_DOUT(readData44),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr44),            .B_ADDR(readAddr44),
                    .A_WIDTH(width44),              .B_WIDTH(width44),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr44),
                    .C_DIN(writeData44),            .C_WEN(wen_a44),
                    .C_BLK(cblk),                 .C_WIDTH(width44),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_44)
                   );

 RAM64x18 block_43(
                    .A_DOUT(readData43),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr43),            .B_ADDR(readAddr43),
                    .A_WIDTH(width43),              .B_WIDTH(width43),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr43),
                    .C_DIN(writeData43),            .C_WEN(wen_a43),
                    .C_BLK(cblk),                 .C_WIDTH(width43),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_43)
                   );

 RAM64x18 block_42(
                    .A_DOUT(readData42),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr42),            .B_ADDR(readAddr42),
                    .A_WIDTH(width42),              .B_WIDTH(width42),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr42),
                    .C_DIN(writeData42),            .C_WEN(wen_a42),
                    .C_BLK(cblk),                 .C_WIDTH(width42),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_42)
                   );

 RAM64x18 block_41(
                    .A_DOUT(readData41),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr41),            .B_ADDR(readAddr41),
                    .A_WIDTH(width41),              .B_WIDTH(width41),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr41),
                    .C_DIN(writeData41),            .C_WEN(wen_a41),
                    .C_BLK(cblk),                 .C_WIDTH(width41),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_41)
                   );

 RAM64x18 block_40(
                    .A_DOUT(readData40),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr40),            .B_ADDR(readAddr40),
                    .A_WIDTH(width40),              .B_WIDTH(width40),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr40),
                    .C_DIN(writeData40),            .C_WEN(wen_a40),
                    .C_BLK(cblk),                 .C_WIDTH(width40),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_40)
                   );

 RAM64x18 block_39(
                    .A_DOUT(readData39),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr39),            .B_ADDR(readAddr39),
                    .A_WIDTH(width39),              .B_WIDTH(width39),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr39),
                    .C_DIN(writeData39),            .C_WEN(wen_a39),
                    .C_BLK(cblk),                 .C_WIDTH(width39),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_39)
                   );

 RAM64x18 block_38(
                    .A_DOUT(readData38),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr38),            .B_ADDR(readAddr38),
                    .A_WIDTH(width38),              .B_WIDTH(width38),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr38),
                    .C_DIN(writeData38),            .C_WEN(wen_a38),
                    .C_BLK(cblk),                 .C_WIDTH(width38),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_38)
                   );

 RAM64x18 block_37(
                    .A_DOUT(readData37),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr37),            .B_ADDR(readAddr37),
                    .A_WIDTH(width37),              .B_WIDTH(width37),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr37),
                    .C_DIN(writeData37),            .C_WEN(wen_a37),
                    .C_BLK(cblk),                 .C_WIDTH(width37),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_37)
                   );

 RAM64x18 block_36(
                    .A_DOUT(readData36),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr36),            .B_ADDR(readAddr36),
                    .A_WIDTH(width36),              .B_WIDTH(width36),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr36),
                    .C_DIN(writeData36),            .C_WEN(wen_a36),
                    .C_BLK(cblk),                 .C_WIDTH(width36),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_36)
                   );

 RAM64x18 block_35(
                    .A_DOUT(readData35),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr35),            .B_ADDR(readAddr35),
                    .A_WIDTH(width35),              .B_WIDTH(width35),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr35),
                    .C_DIN(writeData35),            .C_WEN(wen_a35),
                    .C_BLK(cblk),                 .C_WIDTH(width35),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_35)
                   );

 RAM64x18 block_34(
                    .A_DOUT(readData34),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr34),            .B_ADDR(readAddr34),
                    .A_WIDTH(width34),              .B_WIDTH(width34),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr34),
                    .C_DIN(writeData34),            .C_WEN(wen_a34),
                    .C_BLK(cblk),                 .C_WIDTH(width34),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_34)
                   );

 RAM64x18 block_33(
                    .A_DOUT(readData33),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr33),            .B_ADDR(readAddr33),
                    .A_WIDTH(width33),              .B_WIDTH(width33),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr33),
                    .C_DIN(writeData33),            .C_WEN(wen_a33),
                    .C_BLK(cblk),                 .C_WIDTH(width33),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_33)
                   );

 RAM64x18 block_32(
                    .A_DOUT(readData32),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr32),            .B_ADDR(readAddr32),
                    .A_WIDTH(width32),              .B_WIDTH(width32),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr32),
                    .C_DIN(writeData32),            .C_WEN(wen_a32),
                    .C_BLK(cblk),                 .C_WIDTH(width32),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_32)
                   );

 RAM64x18 block_31(
                    .A_DOUT(readData31),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr31),            .B_ADDR(readAddr31),
                    .A_WIDTH(width31),              .B_WIDTH(width31),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr31),
                    .C_DIN(writeData31),            .C_WEN(wen_a31),
                    .C_BLK(cblk),                 .C_WIDTH(width31),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_31)
                   );

 RAM64x18 block_30(
                    .A_DOUT(readData30),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr30),            .B_ADDR(readAddr30),
                    .A_WIDTH(width30),              .B_WIDTH(width30),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr30),
                    .C_DIN(writeData30),            .C_WEN(wen_a30),
                    .C_BLK(cblk),                 .C_WIDTH(width30),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_30)
                   );

 RAM64x18 block_29(
                    .A_DOUT(readData29),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr29),            .B_ADDR(readAddr29),
                    .A_WIDTH(width29),              .B_WIDTH(width29),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr29),
                    .C_DIN(writeData29),            .C_WEN(wen_a29),
                    .C_BLK(cblk),                 .C_WIDTH(width29),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_29)
                   );

 RAM64x18 block_28(
                    .A_DOUT(readData28),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr28),            .B_ADDR(readAddr28),
                    .A_WIDTH(width28),              .B_WIDTH(width28),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr28),
                    .C_DIN(writeData28),            .C_WEN(wen_a28),
                    .C_BLK(cblk),                 .C_WIDTH(width28),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_28)
                   );

 RAM64x18 block_27(
                    .A_DOUT(readData27),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr27),            .B_ADDR(readAddr27),
                    .A_WIDTH(width27),              .B_WIDTH(width27),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr27),
                    .C_DIN(writeData27),            .C_WEN(wen_a27),
                    .C_BLK(cblk),                 .C_WIDTH(width27),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_27)
                   );

 RAM64x18 block_26(
                    .A_DOUT(readData26),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr26),            .B_ADDR(readAddr26),
                    .A_WIDTH(width26),              .B_WIDTH(width26),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr26),
                    .C_DIN(writeData26),            .C_WEN(wen_a26),
                    .C_BLK(cblk),                 .C_WIDTH(width26),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_26)
                   );

 RAM64x18 block_25(
                    .A_DOUT(readData25),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr25),            .B_ADDR(readAddr25),
                    .A_WIDTH(width25),              .B_WIDTH(width25),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr25),
                    .C_DIN(writeData25),            .C_WEN(wen_a25),
                    .C_BLK(cblk),                 .C_WIDTH(width25),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_25)
                   );

 RAM64x18 block_24(
                    .A_DOUT(readData24),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr24),            .B_ADDR(readAddr24),
                    .A_WIDTH(width24),              .B_WIDTH(width24),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr24),
                    .C_DIN(writeData24),            .C_WEN(wen_a24),
                    .C_BLK(cblk),                 .C_WIDTH(width24),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_24)
                   );

 RAM64x18 block_23(
                    .A_DOUT(readData23),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr23),            .B_ADDR(readAddr23),
                    .A_WIDTH(width23),              .B_WIDTH(width23),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr23),
                    .C_DIN(writeData23),            .C_WEN(wen_a23),
                    .C_BLK(cblk),                 .C_WIDTH(width23),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_23)
                   );

 RAM64x18 block_22(
                    .A_DOUT(readData22),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr22),            .B_ADDR(readAddr22),
                    .A_WIDTH(width22),              .B_WIDTH(width22),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr22),
                    .C_DIN(writeData22),            .C_WEN(wen_a22),
                    .C_BLK(cblk),                 .C_WIDTH(width22),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_22)
                   );


 RAM64x18 block_21(
                    .A_DOUT(readData21),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr21),            .B_ADDR(readAddr21),
                    .A_WIDTH(width21),              .B_WIDTH(width21),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr21),
                    .C_DIN(writeData21),            .C_WEN(wen_a21),
                    .C_BLK(cblk),                 .C_WIDTH(width21),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_21)
                   );

 RAM64x18 block_20(
                    .A_DOUT(readData20),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr20),            .B_ADDR(readAddr20),
                    .A_WIDTH(width20),              .B_WIDTH(width20),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr20),
                    .C_DIN(writeData20),            .C_WEN(wen_a20),
                    .C_BLK(cblk),                 .C_WIDTH(width20),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_20)
                   );


 RAM64x18 block_19(
                    .A_DOUT(readData19),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr19),            .B_ADDR(readAddr19),
                    .A_WIDTH(width19),              .B_WIDTH(width19),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr19),
                    .C_DIN(writeData19),            .C_WEN(wen_a19),
                    .C_BLK(cblk),                 .C_WIDTH(width19),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_19)
                   );

 RAM64x18 block_18(
                    .A_DOUT(readData18),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr18),            .B_ADDR(readAddr18),
                    .A_WIDTH(width18),              .B_WIDTH(width18),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr18),
                    .C_DIN(writeData18),            .C_WEN(wen_a18),
                    .C_BLK(cblk),                 .C_WIDTH(width18),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_18)
                   );


 RAM64x18 block_17(
                    .A_DOUT(readData17),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr17),            .B_ADDR(readAddr17),
                    .A_WIDTH(width17),              .B_WIDTH(width17),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr17),
                    .C_DIN(writeData17),            .C_WEN(wen_a17),
                    .C_BLK(cblk),                 .C_WIDTH(width17),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_17)
                   );

 RAM64x18 block_16(
                    .A_DOUT(readData16),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr16),            .B_ADDR(readAddr16),
                    .A_WIDTH(width16),              .B_WIDTH(width16),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr16),
                    .C_DIN(writeData16),            .C_WEN(wen_a16),
                    .C_BLK(cblk),                 .C_WIDTH(width16),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_16)
                   );

 RAM64x18 block_15(
                    .A_DOUT(readData15),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr15),            .B_ADDR(readAddr15),
                    .A_WIDTH(width15),              .B_WIDTH(width15),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr15),
                    .C_DIN(writeData15),            .C_WEN(wen_a15),
                    .C_BLK(cblk),                 .C_WIDTH(width15),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_15)
                   );

 RAM64x18 block_14(
                    .A_DOUT(readData14),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr14),            .B_ADDR(readAddr14),
                    .A_WIDTH(width14),              .B_WIDTH(width14),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr14),
                    .C_DIN(writeData14),            .C_WEN(wen_a14),
                    .C_BLK(cblk),                 .C_WIDTH(width14),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_14)
                   );

 RAM64x18 block_13(
                    .A_DOUT(readData13),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr13),            .B_ADDR(readAddr13),
                    .A_WIDTH(width13),              .B_WIDTH(width13),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr13),
                    .C_DIN(writeData13),            .C_WEN(wen_a13),
                    .C_BLK(cblk),                 .C_WIDTH(width13),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_13)
                   );

 RAM64x18 block_12(
                    .A_DOUT(readData12),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr12),            .B_ADDR(readAddr12),
                    .A_WIDTH(width12),              .B_WIDTH(width12),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr12),
                    .C_DIN(writeData12),            .C_WEN(wen_a12),
                    .C_BLK(cblk),                 .C_WIDTH(width12),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_12)
                   );

 RAM64x18 block_11(
                    .A_DOUT(readData11),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr11),            .B_ADDR(readAddr11),
                    .A_WIDTH(width11),              .B_WIDTH(width11),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr11),
                    .C_DIN(writeData11),            .C_WEN(wen_a11),
                    .C_BLK(cblk),                 .C_WIDTH(width11),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_11)
                   );

 RAM64x18 block_10(
                    .A_DOUT(readData10),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr10),            .B_ADDR(readAddr10),
                    .A_WIDTH(width10),              .B_WIDTH(width10),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr10),
                    .C_DIN(writeData10),            .C_WEN(wen_a10),
                    .C_BLK(cblk),                 .C_WIDTH(width10),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_10)
                   );

 RAM64x18 block_9(
                    .A_DOUT(readData9),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr9),            .B_ADDR(readAddr9),
                    .A_WIDTH(width9),              .B_WIDTH(width9),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr9),
                    .C_DIN(writeData9),            .C_WEN(wen_a9),
                    .C_BLK(cblk),                 .C_WIDTH(width9),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_9)
                   );

 RAM64x18 block_8(
                    .A_DOUT(readData8),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr8),            .B_ADDR(readAddr8),
                    .A_WIDTH(width8),              .B_WIDTH(width8),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr8),
                    .C_DIN(writeData8),            .C_WEN(wen_a8),
                    .C_BLK(cblk),                 .C_WIDTH(width8),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_8)
                   );



 RAM64x18 block_7(
                    .A_DOUT(readData7),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr7),            .B_ADDR(readAddr7),
                    .A_WIDTH(width7),              .B_WIDTH(width7),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr7),
                    .C_DIN(writeData7),            .C_WEN(wen_a7),
                    .C_BLK(cblk),                 .C_WIDTH(width7),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_7)
                   );

 RAM64x18 block_6(
                    .A_DOUT(readData6),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr6),            .B_ADDR(readAddr6),
                    .A_WIDTH(width6),              .B_WIDTH(width6),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr6),
                    .C_DIN(writeData6),            .C_WEN(wen_a6),
                    .C_BLK(cblk),                 .C_WIDTH(width6),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_6)
                   );

 RAM64x18 block_5(
                    .A_DOUT(readData5),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr5),            .B_ADDR(readAddr5),
                    .A_WIDTH(width5),              .B_WIDTH(width5),
                    .A_BLK(ablk),                  .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr5),
                    .C_DIN(writeData5),            .C_WEN(wen_a5),
                    .C_BLK(cblk),                 .C_WIDTH(width5),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_5)
                   );

 RAM64x18 block_4(
                    .A_DOUT(readData4),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr4),            .B_ADDR(readAddr4),
                    .A_WIDTH(width4),              .B_WIDTH(width4),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr4),
                    .C_DIN(writeData4),            .C_WEN(wen_a4),
                    .C_BLK(cblk),                 .C_WIDTH(width4),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_4)
                   );

 RAM64x18 block_3(
                    .A_DOUT(readData3),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr3),            .B_ADDR(readAddr3),
                    .A_WIDTH(width3),              .B_WIDTH(width3),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr3),
                    .C_DIN(writeData3),            .C_WEN(wen_a3),
                    .C_BLK(cblk),                 .C_WIDTH(width3),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_3)
                   );


    RAM64x18 block_2(
                    .A_DOUT(readData2),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr2),            .B_ADDR(readAddr2),
                    .A_WIDTH(width2),              .B_WIDTH(width2),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr2),
                    .C_DIN(writeData2),            .C_WEN(wen_a2),
                    .C_BLK(cblk),                 .C_WIDTH(width2),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_2)
                   );

      RAM64x18 block_1(
                    .A_DOUT(readData1),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr1),            .B_ADDR(readAddr1),
                    .A_WIDTH(width1),              .B_WIDTH(width1),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr1),
                    .C_DIN(writeData1),            .C_WEN(wen_a1),
                    .C_BLK(cblk),                 .C_WIDTH(width1),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_1)
                   );

      RAM64x18 block_0(
                    .A_DOUT(readData0),            .B_DOUT(),
                    .A_ADDR_CLK(1'b1),              .B_ADDR_CLK(1'b1),
                    .A_ADDR_EN(1'b1),              .B_ADDR_EN(1'b1),
                    .A_ADDR_LAT(1'b1),             .B_ADDR_LAT(1'b1),
                    .A_ADDR_ARST_N(resetn),        .B_ADDR_ARST_N(resetn),
                    .A_ADDR_SRST_N(1'b1),          .B_ADDR_SRST_N(1'b1),
                    .A_DOUT_CLK(clk),             .B_DOUT_CLK(clk),
                    .A_DOUT_EN(1'b1),              .B_DOUT_EN(1'b1),
                    .A_DOUT_LAT(1'b0),             .B_DOUT_LAT(1'b0),
                    .A_DOUT_ARST_N(resetn),        .B_DOUT_ARST_N(resetn),
                    .A_DOUT_SRST_N(1'b1),          .B_DOUT_SRST_N(1'b1),
                    .A_ADDR(readAddr0),            .B_ADDR(readAddr0),
                    .A_WIDTH(width0),              .B_WIDTH(width0),
                    .A_BLK(ablk),                 .B_BLK(bblk),
                    .A_EN(1'b1),                   .B_EN(1'b1),
                    .C_CLK(clk),                   .C_ADDR(writeAddr0),
                    .C_DIN(writeData0),            .C_WEN(wen_a0),
                    .C_BLK(cblk),                 .C_WIDTH(width0),
                    .C_EN(1'b1),                   .SII_LOCK(1'b0),
                    .BUSY(u_BUSY_0)
                   );


assign u_2K_BUSY_all = u_BUSY_0 | u_BUSY_1 | u_BUSY_2 | u_BUSY_3 | u_BUSY_4 | u_BUSY_5 | u_BUSY_6 | u_BUSY_7 | u_BUSY_8 | u_BUSY_9 | u_BUSY_10 |
                    u_BUSY_11 | u_BUSY_12 | u_BUSY_13 | u_BUSY_14 | u_BUSY_15 | u_BUSY_16 | u_BUSY_17 | u_BUSY_18 | u_BUSY_19 | u_BUSY_20 |
                    u_BUSY_21 | u_BUSY_22 | u_BUSY_23 | u_BUSY_24 | u_BUSY_25 | u_BUSY_26 | u_BUSY_27 | u_BUSY_28 | u_BUSY_29 | u_BUSY_30 |
                    u_BUSY_31 | u_BUSY_32 | u_BUSY_33 | u_BUSY_34 | u_BUSY_35 | u_BUSY_36 | u_BUSY_37 | u_BUSY_38 | u_BUSY_39 | u_BUSY_40 |
                    u_BUSY_41 | u_BUSY_42 | u_BUSY_43 | u_BUSY_44 | u_BUSY_45 | u_BUSY_46 | u_BUSY_47 | u_BUSY_48 | u_BUSY_49 | u_BUSY_50 | 
                    u_BUSY_51 | u_BUSY_52 | u_BUSY_53 | u_BUSY_54 | u_BUSY_55 | u_BUSY_56 | u_BUSY_57 | u_BUSY_58 | u_BUSY_59 | u_BUSY_60 | 
                    u_BUSY_61 | u_BUSY_62 | u_BUSY_63 | u_BUSY_64 | u_BUSY_65 | u_BUSY_66 | u_BUSY_67 | u_BUSY_68 | u_BUSY_69 | u_BUSY_70 |
                    u_BUSY_71;
   
                  
endmodule
