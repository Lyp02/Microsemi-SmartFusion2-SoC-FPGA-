/*
EDIB_M57
*/module EDIB_M57(M57In,Rstn,Clk,DataLength,TxDone,Finished,OutP,OutN,
State,NextState,RegM57In,RegDataTimes,SynReg,Sclk,SclkCounts,Speed,SynReg22bitsCounts,
Data32bits,Data32bitsCounts,Busy);
input [15:0] M57In;
input Rstn;
input Clk;
input [15:0] DataLength;
input Speed;
output reg OutP;
output reg OutN;
output reg TxDone;
output reg Finished;
output reg [15:0]RegM57In;
output reg [15:0] RegDataTimes;
output reg [7:0] SynReg22bitsCounts;
output reg [21:0] SynReg;
output reg Sclk;
output reg [31:0] Data32bits;
output reg [7:0] Data32bitsCounts;
reg SclkEn;
reg [1:0] NToM[1:0];
reg [11:0] BpsNum;
reg SendEnd;
output reg [11:0] SclkCounts;
output reg [4:0] State,NextState;
output reg Busy;
parameter IDLE=5'b00001,SYN_PR=5'b00010,DATA_GET=5'b00100,CODE_PR=5'b01000,DATA_PR=5'B10000;
//NToM
always @(Rstn)
   begin
   NToM[0]=2'b01;
   NToM[1]=2'b10;
   SynReg=22'b0101010101010101111000;
   end

//SynReg28bits ----no need
//always @(posedge Clk or negedge Rstn)
// if(!Rstn)
//   SynReg28bits<=28'd0;
//  else
//   SynReg28bits<={NToM[SynReg[13]],NToM[SynReg[12]],NToM[SynReg[11]],NToM[SynReg[10]],NToM[SynReg[9]]
//,NToM[SynReg[8]],NToM[SynReg[7]],NToM[SynReg[6]],NToM[SynReg[5]],NToM[SynReg[4]],NToM[SynReg[3]]
//,NToM[SynReg[2]],NToM[SynReg[1]],NToM[SynReg[0]]};
  
 


// BpsNum
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
      BpsNum<=12'd0;
    else if(Speed==1'b1)
      BpsNum<=12'd31;
    else BpsNum<=12'd127;
// SclkEn
always @(posedge Clk or negedge Rstn)
    if(!Rstn)
       SclkEn<=1'b0;
    else 
       SclkEn<=1'b1;
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
always@(State or Rstn or RegDataTimes or DataLength or Data32bitsCounts or SynReg22bitsCounts )
  case(State)
    IDLE:NextState =(Rstn &&(DataLength>0)&&(RegDataTimes>0))?SYN_PR:IDLE;
    SYN_PR:NextState=(DataLength>0)?DATA_GET:IDLE;
    DATA_GET:NextState=(RegDataTimes == 16'd0)?IDLE:CODE_PR;
    CODE_PR:NextState=(SynReg22bitsCounts == 8'd21)?DATA_PR:CODE_PR;
    DATA_PR:NextState=((RegDataTimes>=1))?DATA_PR:IDLE;
//    DATA_PR:NextState=(SendEnd)?DATA_GET:DATA_PR;
    default:NextState=IDLE;
 endcase

//RegM57In 
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   RegM57In<=16'd0;
  else if(((State ==DATA_GET)||((State ==DATA_PR)&&(Data32bitsCounts ==8'd31)))&&(RegDataTimes>=1))
   RegM57In<=M57In;
  else
   RegM57In<=RegM57In;


//Data32bits
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
  Data32bits<=32'd0;
  else if(State == CODE_PR)
  Data32bits <={NToM[RegM57In[15]],NToM[RegM57In[14]],NToM[RegM57In[13]],NToM[RegM57In[12]],NToM[RegM57In[11]],
NToM[RegM57In[10]],NToM[RegM57In[9]],NToM[RegM57In[8]],NToM[RegM57In[7]],NToM[RegM57In[6]],NToM[RegM57In[5]],NToM[RegM57In[4]],
NToM[RegM57In[3]],NToM[RegM57In[2]],NToM[RegM57In[1]],NToM[RegM57In[0]]};
  else Data32bits<=Data32bits;




//TxDone   Clk --> change to Sclk
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
    TxDone<=1'b0;
  else if(Data32bitsCounts == 8'd31)
    TxDone<=1'b1;
  else if(State == DATA_GET)
    TxDone<=1'b0;
  else TxDone<=1'b0;
//Finished
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   Finished<=1'b0;
  else if(RegDataTimes == 16'd0)
   Finished<=1'b1;
  else  if(State ==DATA_GET)
   Finished<=1'b0;  
  else Finished<=Finished;
//RegDataTimes   -->change to use Sclk
always @(posedge Sclk or negedge Rstn )
   if(!Rstn)
   RegDataTimes<=16'd0;
   else if((Data32bitsCounts ==8'd31))
   RegDataTimes<=RegDataTimes -1'b1;
   else if(State == IDLE)
   RegDataTimes<=DataLength;
   else RegDataTimes<=RegDataTimes;

//Data32bitsCounts State 
always @(posedge Sclk or negedge Rstn )
  if(!Rstn)
   Data32bitsCounts<=8'd0;
  else if(State==DATA_GET)
   Data32bitsCounts<=8'd0;
  else if(State ==DATA_PR &&(Data32bitsCounts <8'd31))
   Data32bitsCounts<=Data32bitsCounts+1'b1;
  else if(Data32bitsCounts ==8'd31)
   Data32bitsCounts<=8'd0;
  else Data32bitsCounts<=Data32bitsCounts;

//SynReg22bitsCounts
always @(posedge Sclk or negedge Rstn )
  if(!Rstn)
   SynReg22bitsCounts<=8'd0;
  else if(State==IDLE)
   SynReg22bitsCounts<=8'd0;
  else if(State ==CODE_PR &&(SynReg22bitsCounts <8'd21))
   SynReg22bitsCounts<=SynReg22bitsCounts+1'b1;
  else if(SynReg22bitsCounts ==8'd21)
   SynReg22bitsCounts<=8'd0;
  else SynReg22bitsCounts<=SynReg22bitsCounts;

//SendEnd
always @(posedge Sclk or negedge Rstn)
   if(!Rstn)
    SendEnd<=1'b0;
//   else if(Data40bitsCounts ==8'd40)
   else if((Data32bitsCounts ==8'd31))
    SendEnd<=1'b1;
   else if(State == DATA_GET)
    SendEnd<=1'b0;
   else 
     SendEnd<=SendEnd;
//OutP form 0--39  Syn only When DataLength = =RegDataTimes
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   OutP<=1'bx;
  else if((State ==CODE_PR) &&(DataLength==RegDataTimes)&&(DataLength>0)&&(SynReg22bitsCounts<=8'd21))
   OutP<=SynReg[21-SynReg22bitsCounts];
  else if((State ==DATA_PR) &&(Data32bitsCounts <=8'd31))
        OutP<=Data32bits[31-Data32bitsCounts];
  else OutP<=1'bx;
//OutN
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   OutN<=1'bx;
  else if((State ==CODE_PR) &&(DataLength==RegDataTimes)&&(DataLength>0)&&(SynReg22bitsCounts<=8'd21))
   OutN<=~SynReg[21-SynReg22bitsCounts];
  else if((State ==DATA_PR) &&(Data32bitsCounts <=8'd31))
        OutN<=~Data32bits[31-Data32bitsCounts];
  else OutN=1'bx;

//Busy
always @(posedge Sclk or negedge Rstn)
  if(!Rstn)
   Busy<=1'b0;
  else if(State !=IDLE)
   Busy<=1'b1;
  else 
   Busy<=1'b0;
endmodule
