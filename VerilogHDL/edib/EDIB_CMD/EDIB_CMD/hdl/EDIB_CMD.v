module EDIB_CMD(CMDIn,Clk,Data,RxDone,Type,Rstn,Error,State,SynReg,Data34bits
,Sclk,SclkCounts,NextState,Data34bitsCounts,In0,In1,SynCounts,Finished,DataTimes,
DataLength,SynMaxTimes);
input CMDIn;
input Rstn;
input Clk;
output reg[15:0] Data;
output reg RxDone;
output wire Error;
output reg Type;
output reg In0,In1;
//reg In0, In1;
output reg[6:0] SynReg;
//reg [5:0] SynReg;
reg  SclkEn;
output reg Sclk;
//reg  Sclk;
reg [11:0] BpsNum; 
output reg[11:0] SclkCounts;
//reg [11:0] SclkCounts;
reg [3:0] OneBitSum;
reg OneBit;
output reg[33:0] Data34bits;
//reg [33:0] Data34bits;
output reg [7:0]  Data34bitsCounts;
//reg [7:0]  Data34bitsCounts;
reg SampleEn;
output reg[3:0] State;
//reg [3:0] State; 18/6/10/21/19
output reg [3:0] NextState;
//reg [3:0] NextState;
wire SynRegOk;
output reg [3:0] SynCounts;
reg SynEn;
output reg [15:0] DataTimes;
output reg [15:0] DataLength;
output reg [15:0] SynMaxTimes;
output reg Finished;
parameter IDLE=4'b0001,SYN_PR=4'b0010,DATA_PR=4'b0100,DATA_END=4'b1000;

// BpsNum
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
      BpsNum<=12'd0;
    else
      BpsNum<=12'd575;
// SclkEn
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
       SclkEn<=1'b0;
    else 
       SclkEn=1'b1;
//SclkCounts
always @(posedge Clk or negedge Rstn)
  if(!Rstn)
      SclkCounts<=12'd0;
  else if(SclkEn)begin
                 if(SclkCounts == BpsNum)
                    SclkCounts<=12'd0;
                 else
                    SclkCounts<=SclkCounts +1'b1;
                 end 
  else
       SclkCounts<=12'd0;
//Sclk low-->high
always @(posedge Clk or negedge Rstn)
   if(!Rstn)
     Sclk<=1'b0;
   else if(SclkCounts <=(BpsNum/2))
     Sclk<=1'b0;
   else
     Sclk<=1'b1;

// In1 In0
always@(posedge Clk or negedge Rstn)
   if(!Rstn)begin
            In0<=1'b0;
            In1<=1'b1;
            end
   else  begin
            In0<=CMDIn;
            In1<=In0;
         end


//SampleEn   [BpsNum/4,(BpsNum/4)+11] 12 times
always @(posedge Clk or negedge Rstn)
   if(!Rstn)
   SampleEn<=1'b0;
   else if((SclkCounts>=(BpsNum/4))&&(SclkCounts<=(BpsNum/4)+11))
           SampleEn<=1'b1;
   else 
   SampleEn<=1'b0;
//OneBitSum
always @(posedge Clk or negedge Rstn)
   if(!Rstn)
   OneBitSum<=4'd0;
   else if(SclkCounts == 0)
         OneBitSum<=4'd0;
   else if(SampleEn )
         OneBitSum<=OneBitSum+In1;
   else  OneBitSum<=OneBitSum;

//OneBit
always @(posedge Clk or negedge Rstn)
   if(!Rstn)
      OneBit<=1'bx;
   else if((SclkCounts==((BpsNum/2)-2)) && (OneBitSum >=6))
         OneBit<=1'b1;
   else if((SclkCounts==((BpsNum/2)-2)) &&(OneBitSum <6))
         OneBit<=1'b0;
   else  OneBit<=OneBit;
//SynReg  Sclk 
//SynReg<=6'bxxxxxx,--
always@(posedge Sclk or negedge Rstn)
  if(!Rstn)
    begin
    SynReg<=6'd0;
    SynCounts<=4'd0;
    end
  else if(State == SYN_PR)
       begin
       SynReg[0]<=In1;
       SynReg[1]<=SynReg[0];
       SynReg[2]<=SynReg[1];
       SynReg[3]<=SynReg[2];
       SynReg[4]<=SynReg[3];
       SynReg[5]<=SynReg[4];
       SynReg[6]<=SynReg[5];
       if(SynCounts<6)
       SynCounts<=SynCounts+1'b1;
       else if(SynCounts ==6)
             SynCounts<=SynCounts;
       end
  else if(Data34bitsCounts == 8'd12)
       begin
       SynReg<=6'd0;
       SynCounts<=4'd0;
       end
  else SynReg<=SynReg;

//Type  0:command 1;data
always @(State or Rstn)
   if(!Rstn)
     Type<=1'bx;
   else if(State ==DATA_PR &&(SynReg[5:0] == 6'b111000))
     Type<=1'b0;
   else if(State ==DATA_PR &&(SynReg[5:0] == 6'b000111))
     Type<=1'b1;
   else Type<=Type;
//Type


//Data34bitsCounts;
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
    Data34bitsCounts <=8'd0;
  else if(State ==DATA_PR)
    Data34bitsCounts<=Data34bitsCounts+1'b1;
  else if(Data34bitsCounts ==8'd34)
     Data34bitsCounts <=8'd0;
  else Data34bitsCounts<=Data34bitsCounts;

//time Logic
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
      State<=IDLE;
    else
      State<=NextState;
//combine Logic

always@(State or Rstn or (SynReg[5:0]==6'b111000) or (SynReg[5:0]==6'b000111) or (Data34bitsCounts==8'd34))
  case(State)
    IDLE:NextState =(Rstn)?SYN_PR:IDLE;
    SYN_PR:NextState=((SynCounts ==6)&&((SynReg[5:0]==6'b111000) || (SynReg[5:0]==6'b000111)))?DATA_PR:SYN_PR;
    DATA_PR:NextState=(Data34bitsCounts==8'd34)?DATA_END:DATA_PR;
    DATA_END:NextState=SYN_PR;
    default:NextState=IDLE;
 endcase

//RxDone ---->>24MHz sampling this signal
always @(State or Rstn)
  if(!Rstn)
    RxDone<=1'b0;
  else if(State == DATA_END)
     RxDone<=1'b1;
  else RxDone<=1'b0;


//Data34bits
always @(posedge Sclk or negedge Rstn )
   if(!Rstn)
     Data34bits <=34'd0;
    else if((State == DATA_PR)&&(Data34bitsCounts<34))
      Data34bits <={Data34bits[32:0],OneBit};
    else Data34bits<=Data34bits;

//Data
always @(State)
  if(State ==DATA_END)
  Data <={Data34bits[33],Data34bits[31],Data34bits[29],Data34bits[27],Data34bits[25],Data34bits[23],
Data34bits[21],Data34bits[19],Data34bits[17],Data34bits[15],Data34bits[13],Data34bits[11],Data34bits[9],
Data34bits[7],Data34bits[5],Data34bits[3]};
  else
  Data<=Data;
assign Error =!(Data34bits[33]+Data34bits[31]+Data34bits[29]+Data34bits[27]+Data34bits[25]+Data34bits[23]+
Data34bits[21]+Data34bits[19]+Data34bits[17]+Data34bits[15]+Data34bits[13]+Data34bits[11]+Data34bits[9]+
Data34bits[7]+Data34bits[5]+Data34bits[3]+Data34bits[1])%2;

//DataTimes
always @(State or  Rstn)
 if(!Rstn)
    DataTimes<=16'd0;
 else if(State ==DATA_END)
    DataTimes <=DataTimes+1'b1;
 else  if(State == IDLE)
    DataTimes<=16'd0;
 else  if(SynMaxTimes >=16'd10200)
    DataTimes<=16'd0;
 else DataTimes<=DataTimes;
 
//DataLength
always @(State or Rstn)
  if(!Rstn)
     DataLength<=16'd0;
   else if((State ==SYN_PR) &&(DataTimes ==16'd2))
      DataLength<=Data;
   else DataLength<=DataLength;

//Finished
always @(State or Rstn)
   if(!Rstn)
    Finished<=1'b0;
   else if((DataTimes == (2+DataLength)))
    Finished<=1'b1;
   else 
     Finished<=Finished;

//SynMaxTimes
always @(posedge Sclk or negedge Rstn)
   if(!Rstn)
    SynMaxTimes<=16'd0;
   else if(State ==SYN_PR)
     SynMaxTimes<=SynMaxTimes+1'b1;
   else  if((State ==DATA_PR)||(State ==IDLE) ||(SynMaxTimes ==16'd10200))
     SynMaxTimes<=16'd0; 
endmodule
