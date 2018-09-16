/*
M2
*/
module EDIB_M2(M2In,Rstn,Clk,DataLength,TxDone,Finished,OutP,OutN,
State,NextState,RegM2In,RegDataTimes,SynReg,Sclk,Data40bits,OddCheck,Data40bitsCounts,
SclkCounts,SendEnd,Busy);
input [15:0] M2In;
input Rstn;
input Clk;
input [8:0] DataLength;
output reg OutP;
output reg OutN;
output reg TxDone;
output reg Finished;
output reg [15:0]RegM2In;
output reg [8:0] RegDataTimes;
output reg [5:0] SynReg;
output reg Sclk;
reg SclkEn;
output reg SendEnd;
reg [1:0] NToM[1:0];
reg [11:0] BpsNum;
output reg [11:0] SclkCounts;
output reg OddCheck;
reg [1:0] OddCheckbits;
output reg [39:0] Data40bits;
output reg [7:0]  Data40bitsCounts;
output reg [3:0] State,NextState;
output reg Busy;
parameter IDLE=4'b0001,DATA_GET=4'b0010,CODE_PR=4'b0100,DATA_PR=4'b1000;
//NToM
always @(Rstn)
   begin
   NToM[0]=2'b01;
   NToM[1]=2'b10;
   end


// BpsNum
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
      BpsNum<=12'd0;
    else
      BpsNum<=12'd287;
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


//time logic
always @(posedge Sclk or negedge Rstn)
    if(!Rstn)
      State<=IDLE;
    else
    State<=NextState;



//combine logic
always@(State or Rstn or RegDataTimes or DataLength or Data40bitsCounts )
  case(State)
    IDLE:NextState =(Rstn &&(DataLength>0)&&(RegDataTimes>0))?DATA_GET:IDLE;
    DATA_GET:NextState=(RegDataTimes == 9'd0)?IDLE:CODE_PR;
    CODE_PR:NextState=((DataLength >0)&&(Data40bitsCounts ==0))?DATA_PR:IDLE;
    DATA_PR:NextState=(Data40bitsCounts==8'd39)?DATA_GET:DATA_PR;
//    DATA_PR:NextState=(SendEnd)?DATA_GET:DATA_PR;
    default:NextState=IDLE;
 endcase

//RegM2In OddCheck
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   begin
   RegM2In<=16'd0;
   OddCheck<=1'b0;
   end
  else if((State ==DATA_GET)&&(RegDataTimes>0))
   begin
   RegM2In<=M2In;
   OddCheck =!((M2In[15]+M2In[14]+M2In[13]+M2In[12]+M2In[11]+M2In[10]+M2In[9]
+M2In[8]+M2In[7]+M2In[6]+M2In[5]+M2In[4]+M2In[3]+M2In[2]+M2In[1]
+M2In[0])%2);
   end
  else
   begin
   RegM2In<=RegM2In;
   OddCheck<=OddCheck;
   end

//Data40bits
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
  Data40bits<=40'd0;
  else if(State == CODE_PR)
  Data40bits <={SynReg,NToM[RegM2In[15]],NToM[RegM2In[14]],NToM[RegM2In[13]],NToM[RegM2In[12]],NToM[RegM2In[11]],
NToM[RegM2In[10]],NToM[RegM2In[9]],NToM[RegM2In[8]],NToM[RegM2In[7]],NToM[RegM2In[6]],NToM[RegM2In[5]],NToM[RegM2In[4]],
NToM[RegM2In[3]],NToM[RegM2In[2]],NToM[RegM2In[1]],NToM[RegM2In[0]],NToM[OddCheck]};
  else Data40bits<=Data40bits;


   



//TxDone   Clk --> change to Sclk
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
    TxDone<=1'b0;
  else if(Data40bitsCounts == 8'd39)
    TxDone<=1'b1;
  else if(State == DATA_GET)
    TxDone<=1'b0;
  else TxDone<=1'b0;
//Finished
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   Finished<=1'b0;
  else if(RegDataTimes == 9'd0)
   Finished<=1'b1;
  else  if(State ==DATA_GET)
   Finished<=1'b0;  
  else Finished<=Finished;
//RegDataTimes   -->change to use Sclk
always @(posedge Sclk or negedge Rstn )
   if(!Rstn)
   RegDataTimes<=9'd0;
   else if((Data40bitsCounts ==8'd39))
   RegDataTimes<=RegDataTimes -1'b1;
   else if(State == IDLE)
   RegDataTimes<=DataLength;
   else RegDataTimes<=RegDataTimes;
//SynReg
always @(State or Rstn)
   if(!Rstn)
    SynReg<=6'b000000;
   else if( RegDataTimes == DataLength )
    SynReg<=6'b111000;
   else if((RegDataTimes <DataLength)&&(RegDataTimes >0))
    SynReg<=6'b000111;
   else SynReg<=6'b000000;
//Data40bitsCounts State 
always @(posedge Sclk or negedge Rstn )
  if(!Rstn)
   Data40bitsCounts<=8'd0;
  else if(State==DATA_GET)
   Data40bitsCounts<=8'd0;
  else if(State ==DATA_PR &&(Data40bitsCounts <8'd39))
   Data40bitsCounts<=Data40bitsCounts+1'b1;
  else if(Data40bitsCounts ==8'd39)
   Data40bitsCounts<=8'd0;
  else Data40bitsCounts<=Data40bitsCounts;
//SendEnd
always @(posedge Sclk or negedge Rstn)
   if(!Rstn)
    SendEnd<=1'b0;
//   else if(Data40bitsCounts ==8'd40)
   else if((Data40bitsCounts ==8'd39))
    SendEnd<=1'b1;
   else if(State == DATA_GET)
    SendEnd<=1'b0;
   else 
     SendEnd<=SendEnd;
//OutP form 0--39 used
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   OutP<=1'bx;
  else if((State ==DATA_PR) &&(Data40bitsCounts <=8'd39))
        OutP<=Data40bits[39-Data40bitsCounts];
  else OutP<=1'bx;
//OutN
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   OutN<=1'bx;
  else if((State ==DATA_PR) &&(Data40bitsCounts <=8'd40))
        OutN<=~Data40bits[39-Data40bitsCounts];
  else OutN<=1'bx;



//Busy
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
    Busy<=1'b0;
   else if(State !=IDLE)
    Busy<=1'b1;
   else 
    Busy<=1'b0;
endmodule
