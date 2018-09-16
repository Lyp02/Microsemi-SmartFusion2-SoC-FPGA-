`timescale 1ps/1ps
`define clock_period 42
module EDIB_M2_tb;
reg [15:0] M2In;
reg Rstn;
reg Clk;
reg [8:0] DataLength;
wire OutP;
wire OutN;
wire TxDone;
wire Finished;
wire [15:0]RegM2In;
wire [8:0] RegDataTimes;
wire [5:0] SynReg;
wire Sclk;
wire OddCheck;
wire [39:0] Data40bits;
wire [7:0]  Data40bitsCounts;
wire [3:0] State,NextState;
wire [11:0] SclkCounts;
wire Busy;
wire SendEnd;
always #(`clock_period/2) Clk=~Clk;
EDIB_M2 EDIB_M2_0(.M2In(M2In),.Rstn(Rstn),.Clk(Clk),.DataLength(DataLength),.TxDone(TxDone),.Finished(Finished),.OutP(OutP),.OutN(OutN),
.State(State),.NextState(NextState),.RegM2In(RegM2In),.RegDataTimes(RegDataTimes),.SynReg(SynReg),.Sclk(Sclk),.Data40bits(Data40bits),.OddCheck(OddCheck),.Data40bitsCounts(Data40bitsCounts),
.SclkCounts(SclkCounts),.SendEnd(SendEnd),.Busy(Busy));
initial Clk=0;
initial begin
        #(`clock_period *288);
        Rstn=1'b0;
        #(`clock_period *288);
        Rstn=1'b1;
        #(`clock_period *288);
        M2In=16'b1111111100000000;
        DataLength=9'd10;
        #(`clock_period *288*40*12);
        $stop();
        end
endmodule

