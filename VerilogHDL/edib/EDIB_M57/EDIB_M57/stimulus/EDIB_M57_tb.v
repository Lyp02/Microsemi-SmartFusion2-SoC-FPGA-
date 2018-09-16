`timescale 1ps/1ps
`define clock_period 42
module EDIB_M57_tb;
reg [15:0] M57In;
reg Rstn;
reg Clk;
reg [15:0] DataLength;
wire OutP;
wire OutN;
wire TxDone;
wire Finished;
wire [15:0]RegM57In;
wire [15:0] RegDataTimes;
wire [13:0] SynReg;
wire Sclk;
wire [31:0] Data32bits;
wire [7:0]  Data32bitsCounts;
wire [4:0] State,NextState;
wire [11:0] SclkCounts;
reg Speed;
wire [7:0]SynReg22bitsCounts;
wire SendEnd;
wire Busy;
always #(`clock_period/2) Clk=~Clk;
EDIB_M57 EDIB_M57_0(.M57In(M57In),.Rstn(Rstn),.Clk(Clk),.DataLength(DataLength),.TxDone(TxDone),.Finished(Finished),.OutP(OutP),.OutN(OutN),
.State(State),.NextState(NextState),.RegM57In(RegM57In),.RegDataTimes(RegDataTimes),.SynReg(SynReg),.Sclk(Sclk),.SclkCounts(SclkCounts),.Speed(Speed),.SynReg22bitsCounts(SynReg22bitsCounts),
.Data32bits(Data32bits),.Data32bitsCounts(Data32bitsCounts),.Busy(Busy));
initial Clk=0;
initial begin
        #(`clock_period *288);
        Rstn=1'b0;
        Speed=1'b1;
        #(`clock_period *288);
        Rstn=1'b1;
        #(`clock_period *288);
        M57In=16'b1111111111111111;
        DataLength=9'd10;
        #(`clock_period *128*48*12);
        $stop();
        end
endmodule
