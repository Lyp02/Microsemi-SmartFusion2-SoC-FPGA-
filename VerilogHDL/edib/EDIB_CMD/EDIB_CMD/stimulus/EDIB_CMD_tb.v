/*
EDIB_CMD_tb
*/
`timescale 1ps/1ps
`define clock_period 42
module EDIB_CMD_tb;
reg CMD_In;
reg Rstn;
reg Clk;
wire [15:0] Data;
wire RxDone;
wire Error;
wire Type;
wire Sclk;
wire [11:0] SclkCounts;
wire [3:0]  NextState;
wire [3:0]  State;
wire [6:0]  SynReg;
wire [33:0] Data34bits;
wire [7:0]  Data34bitsCounts;
wire In0;
wire In1;
wire [3:0]SynCounts;
wire [15:0] DataTimes;
wire [15:0] DataLength;
wire [15:0] SynMaxTimes;
wire Finished;
EDIB_CMD EDIB_CMD_0(.CMDIn(CMD_In),.Rstn(Rstn),.Clk(Clk),.Data(Data),.RxDone(RxDone),.Error(Error),.Type(Type)
,.State(State),.SynReg(SynReg),.Data34bits(Data34bits),.Sclk(Sclk),.SclkCounts(SclkCounts),.NextState(NextState),
.Data34bitsCounts(Data34bitsCounts),.In0(In0),.In1(In1),.SynCounts(SynCounts),.DataTimes(DataTimes),.DataLength(DataLength),
.SynMaxTimes(SynMaxTimes),.Finished(Finished));
initial Clk=0;
always #(`clock_period/2) Clk=~Clk;
initial begin
   Rstn=1'b0;
   #(`clock_period *200);
   Rstn=1'b1;
   #(`clock_period *20+1);
   begin
   CMD_In=1'bx;
   #(`clock_period*2000);
   CMD_In=1'b0;
   #(`clock_period*2000);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
// command--->
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   repeat(17)
      begin
      CMD_In=1'b1;
      #(`clock_period*576);
       CMD_In=1'b0;
      #(`clock_period*576);
      end 

    CMD_In=1'b1;
   #(`clock_period*576);
// data--->
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   repeat(15)
      begin
      CMD_In=1'b0;
      #(`clock_period*576);
       CMD_In=1'b1;
      #(`clock_period*576);
      end 
   repeat(1)
      begin
      CMD_In=1'b1;
      #(`clock_period*576);
       CMD_In=1'b0;
      #(`clock_period*576);
      end 
   repeat(1)
      begin
      CMD_In=1'b0;
      #(`clock_period*576);
       CMD_In=1'b1;
      #(`clock_period*576);
      end 
     CMD_In=1'b1;
   #(`clock_period*576);
// data--->
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b0;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   CMD_In=1'b1;
   #(`clock_period*576);
   repeat(15)
      begin
      CMD_In=1'b0;
      #(`clock_period*576);
       CMD_In=1'b1;
      #(`clock_period*576);
      end 
   repeat(1)
      begin
      CMD_In=1'b1;
      #(`clock_period*576);
       CMD_In=1'b0;
      #(`clock_period*576);
      end 
   repeat(1)
      begin
      CMD_In=1'b0;
      #(`clock_period*576);
       CMD_In=1'b1;
      #(`clock_period*576);
      end      


   CMD_In=1'b1;
   #(`clock_period *4000);
   $stop;
   end
end
endmodule