// ********************************************************************/
// Actel Corporation Proprietary and Confidential
//  Copyright 2011 Actel Corporation.  All rights reserved.
//
// ANY USE OR REDISTRIBUTION IN PART OR IN WHOLE MUST BE HANDLED IN
// ACCORDANCE WITH THE ACTEL LICENSE AGREEMENT AND MUST BE APPROVED
// IN ADVANCE IN WRITING.
//
// Description:  testbench
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

module testbench ();
`include "./coreparameters.v"
//`include "./testlist.v"

    localparam            APB_AWIDTH = 20;

    reg                   PCLK;
    reg                   PRESETN;
    reg                   PSEL;
    reg                   PENABLE;
    reg                   PWRITE;
    reg  [APB_AWIDTH-1:0] PADDR;
    reg  [APB_DWIDTH-1:0] PWDATA;
    // outputs
    wire [APB_DWIDTH-1:0] PRDATA;
    wire                  PSLVERR;
    wire                  PREADY;

    integer simerrors;
    // string related signals
    reg [8*79:1]	init_str_mem [0:11];
    reg [8*79:1]	dash_str,uline_str,copyright_str,tb_name_str,
	        			tb_ver_str,pound_str,lsb_str,msb_str;


    DMAAPB_COREAPBLSRAM_0_COREAPBLSRAM # (
        .SEL_SRAM_TYPE(SEL_SRAM_TYPE),
        .APB_DWIDTH(APB_DWIDTH),
        .USRAM_NUM_LOCATIONS_DWIDTH(USRAM_NUM_LOCATIONS_DWIDTH),
        //.USRAM_NUM_LOCATIONS_DWIDTH24(USRAM_NUM_LOCATIONS_DWIDTH24),
        //.USRAM_NUM_LOCATIONS_DWIDTH16(USRAM_NUM_LOCATIONS_DWIDTH16),
        //.USRAM_NUM_LOCATIONS_DWIDTH08(USRAM_NUM_LOCATIONS_DWIDTH08),
        .LSRAM_NUM_LOCATIONS_DWIDTH(LSRAM_NUM_LOCATIONS_DWIDTH)
        //.LSRAM_NUM_LOCATIONS_DWIDTH24(LSRAM_NUM_LOCATIONS_DWIDTH24),
        //.LSRAM_NUM_LOCATIONS_DWIDTH16(LSRAM_NUM_LOCATIONS_DWIDTH16),
        //.LSRAM_NUM_LOCATIONS_DWIDTH08(LSRAM_NUM_LOCATIONS_DWIDTH08)
    ) COREAPBLSRAM_0 (
        .PCLK(PCLK),    
        .PRESETN(PRESETN),
        .PSEL(PSEL),
        .PENABLE(PENABLE),
        .PWRITE(PWRITE),
        .PADDR(PADDR),
        .PWDATA(PWDATA),
        .PRDATA(PRDATA),
        .PSLVERR(PSLVERR),
        .PREADY(PREADY)
    );

    integer loop;
    initial begin
        PSEL = 0;
        PENABLE = 0;
        PWRITE = 0;
        PADDR = 0;
        PWDATA = 0;
        simerrors = 0;
        loop = 0;
        PCLK = 0;
        dash_str		=
        "-----------------------------------------------------------------------------";
        uline_str		=
        "_____________________________________________________________________________";
        pound_str		=
        "#############################################################################";
        copyright_str	=
        "(c) Copyright 2011 Actel Corporation. All rights reserved.";
        tb_name_str		=
        "User Testbench for: CoreApbSram";
        tb_ver_str		=
        "Version: 1.0 12Nov08                                                         ";

        PRESETN = 1;
        # 10 PRESETN = 0;
        repeat (3) @ (posedge PCLK);
        PRESETN = 1'b1;

       $display("%0s",pound_str);
       $display("%0s",copyright_str);
       $display("%0s",pound_str);

       if(SEL_SRAM_TYPE == 0) begin
       
          if (APB_DWIDTH == 32) begin
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 4) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 4) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH = %d ****************", LSRAM_NUM_LOCATIONS_DWIDTH);
           end
          else if (APB_DWIDTH == 16) begin
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 2) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 2) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH  = %d ****************", LSRAM_NUM_LOCATIONS_DWIDTH);
           end  else if (APB_DWIDTH == 8) begin
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 1) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < LSRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 1) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH  = %d ****************", LSRAM_NUM_LOCATIONS_DWIDTH);
           end
       end // if (SEL_SRAM_TYPE == 0)
       else begin       
          if (APB_DWIDTH == 32) begin
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 4) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 4) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH = %d ****************", USRAM_NUM_LOCATIONS_DWIDTH);
           end else if (APB_DWIDTH == 16) begin
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 2) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 2) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH  = %d ****************", USRAM_NUM_LOCATIONS_DWIDTH);
           end  else if (APB_DWIDTH == 8) begin
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 1) begin
                 apb_write (loop,loop+(loop<<16));
              end
              for (loop = 0; loop < USRAM_NUM_LOCATIONS_DWIDTH; loop = loop + 1) begin
                 apb_read  (loop,loop+(loop<<16));
              end
              $display("************** DEPTH  = %d ****************", USRAM_NUM_LOCATIONS_DWIDTH);
           end
       end // if (SEL_SRAM_TYPE == 0)
       
           $display("************** APB_DWIDTH = %d ****************", APB_DWIDTH);

       if(SEL_SRAM_TYPE == 0) begin
        $display("************** SRAM TYPE  = LSRAM ****************");       
       end
       else begin
        $display("************** SRAM TYPE  = uSRAM ****************");       
       end
       
        $display("************** Simulation Errors = %0d ****************", simerrors);

        if (simerrors == 0) begin
           $display("%0s",pound_str);
           $display("            TEST PASSED         ");
           $display("%0s",pound_str);
        end
       
        # 100 $finish;
    end

    always #10 PCLK = ~PCLK;
    //
    //----------------------------------------------------------------------
    // tasks
    //----------------------------------------------------------------------

    // Checks the value of a signal or bus (up to 128 bits) ---------
    task checksig;
        input [127:0] d;
        input [8*17:1] sig_name;
        input [127:0] v;
        input [APB_AWIDTH-1:0] address;
       
        begin
            $timeformat(-9, 2, " ns", 3);
            if (d !== v)
            begin
                $display("");
                $display("%0s",pound_str);
                $display("ERROR!!! Mismatch on signal %0s",sig_name);
                $display("At time: %0t",$time);
                $display("Expected value was: 0x%0x, observed value is: 0x%0x at address = %h",v,d,address);
                $display("%0s",pound_str);
                $display("");
                //$stop;
                simerrors = simerrors + 1;
                if (simerrors != 0) begin
                    $stop;
                end
            end // if (d !== v)
        end
    endtask

    // Emulates an APB write
    task apb_write;
        input [APB_AWIDTH-1:0] a;
        input [APB_DWIDTH-1:0] d;
        begin
            //$display("CPU Write %04x = %04x",a,d);
            @(posedge PCLK);
            PENABLE  = 1'b0;
            PSEL  = 1'b1;
            PADDR = a;
            PWDATA  = d;
            PWRITE  = 1'b1;
            @(posedge PCLK);
            PENABLE  = 1'b1;
            @(posedge PCLK);
            PWRITE  = 1'b0;
            PENABLE  = 1'b0;
            PSEL  = 1'b0;
        end
    endtask

    // Emulates an APB read
    task apb_read;
        input [APB_AWIDTH-1:0] a;
        input [APB_DWIDTH-1:0] d;
       
        begin
            @(posedge PCLK);
            PENABLE  = 1'b0;
            PSEL  = 1'b1;
            PADDR = a;
            PWRITE  = 1'b0;
            @(posedge PCLK);
            PENABLE  = 1'b1;
            @(posedge PCLK);
            PENABLE  = 1'b0;
            PSEL  = 1'b0;
            checksig(PRDATA,"APB Read Data Bus",d,a);

    end
    endtask

    // Emulates an APB read / bit polling
    task apb_read_poll;
        input [APB_AWIDTH-1:0] a;
        input [APB_DWIDTH-1:0] bit;
        input                  v;
        // internal
        reg                    poll;
        begin
            poll = 1'b1;
            while (poll == 1'b1) begin
                @(negedge PCLK);
                PENABLE  = 1'b0;
                PSEL  = 1'b1;
                PADDR = a;
                PWRITE  = 1'b0;
                @(negedge PCLK);
                PENABLE  = 1'b1;
                @(negedge PCLK);
                PWRITE  = 1'b1;
                PENABLE  = 1'b0;
                PSEL  = 1'b0;
                poll = (PRDATA[bit] != v);
            end
        end
    endtask

endmodule
