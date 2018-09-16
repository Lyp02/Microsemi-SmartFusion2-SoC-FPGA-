///////////////////////////////////////////////////////////////////////////////////////////////////
// Company: <Name>
//
// File: AD7609.v
// File history:
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//      <Revision number>: <Date>: <Comments>
//
// Description: 
//
// <Description here>
//
// Targeted device: <Family::SmartFusion2> <Die::M2S010> <Package::144 TQ>
// Author: <Name>
//
/////////////////////////////////////////////////////////////////////////////////////////////////// 

//`timescale <time_units> / <precision>
//Clk --100Mhz  Sclk--10Mhz  e
module AD7609_module(Start,Clk,Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8,
Convstab,Cs_n,Sclk,Reset,Os2,Os1,Os0,Busy,Douta,Doutb,Frstdata);
input Start,Clk,Busy,Douta,Doutb,Frstdata;
output reg Cs_n,Convstab,Sclk,Reset,Os2,Os1,Os0;
output reg[15:0] Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8;
 reg[7:0] Phase;
 reg[7:0] a_record,b_record;
 reg[7:0] sclk_current;
 reg[71:0] Aout,Bout;
//reg[71:0] Aout,Bout;
reg en_t1,en_t2,en_sclk,t1_full,t2_full,sclk_full;
reg [3:0] t1_cnt,t2_cnt;
reg [7:0] sclk_cnt;
//reg[7:0] sclk_current;
reg[7:0] state,nextstate;
reg onceOk;
//onceOk
always @(state or Start)
   if(!Start)
       onceOk<=1'b0;
    else if(state ==READ_END)
       onceOk<=1'b1;
    else
       onceOk<=onceOk;

//t1_cnt
always @(posedge Clk or negedge Start)
    if(!Start)
       t1_cnt<=4'd0;
     else if(en_t1)
        t1_cnt<=t1_cnt+1'b1;
     else
        t1_cnt<=4'd0;

//t1_full
always@(posedge Clk or negedge Start)
     if(!Start)
         t1_full<=1'b0;
     else if(t1_cnt >= 4'd5)
         t1_full<=1'b1;
     else
         t1_full<=1'b0;
//t2_cnt
always @(posedge Clk or negedge Start)
    if(!Start)
       t2_cnt<=4'd0;
     else if(en_t2)
        t2_cnt<=t2_cnt+1'b1;
     else
        t2_cnt<=4'd0;

//t2_full
always@(posedge Clk or negedge Start)
     if(!Start)
         t2_full<=1'b0;
     else if(t2_cnt == 4'd5)
         t2_full<=1'b1;
     else
         t2_full<=1'b0;

// sclk_cnt ---count up  to 9 --20Mhz
always @(posedge Clk or negedge Start)
  if(!Start)
     sclk_cnt<=8'd0;
  else if(sclk_cnt == 8'd4)
          sclk_cnt<=8'd0;
  else  sclk_cnt<=sclk_cnt+1'b1;

//Sclk
always @(posedge Clk or negedge Start)
   if(!Start)
       Sclk<=1'b0;
    else if(en_sclk==0)
        Sclk<=1'b0;
   else if(sclk_cnt < 8'd3)
       Sclk<=1'b1;
   else
       Sclk<=1'b0;

//sclk_current
always @(posedge Sclk or negedge Start or negedge en_sclk ) //soulution 1 add <negedge en_sclk>
   if(!Start)
       sclk_current<=8'b0;
    else if(en_sclk==0)
        sclk_current<=8'b0;
    else sclk_current<=sclk_current+1;

// Os0,Os1,Os2 
always @(posedge Clk or negedge Start)
   if(!Start)
       begin
       Os0<=1'b0;
       Os1<=1'b0;
       Os2<=1'b0;
       end
    else 
       begin
       Os0<=1'b0;
       Os1<=1'b0;
       Os2<=1'b0;
       end

// Aout Bout
//always @(posedge Sclk or negedge Start)
//    if(!Start)
//        begin
//        Aout<=72'b0;
//        Bout<=72'b0;
//        end
//     else begin
//        Aout[71-sclk_current]<=Douta;
//        Bout[71-sclk_current]<=Doutb;
//        a_record<=71-sclk_current;
//        b_record<=71-sclk_current;
//        end

//Aout Bout ---case 
always@(posedge Sclk or negedge Start)
     if(!Start)
         begin
         Aout<=72'b0;
         Bout<=72'b0;
         end
     else begin
          a_record<=71-sclk_current;
          b_record<=71-sclk_current; 
          case(sclk_current)
              sclk_current:begin
                          Aout[71-sclk_current]<=Douta;
                          Bout[71-sclk_current]<=Doutb;
                          end
     
              default:begin
                Aout<=Aout;
                Bout<=Bout;
                end 
       endcase    
          end
      
parameter IDLE=8'b0000_0001,RST_END=8'b0000_0010,CONVST_PR=8'b0000_0100,CONVST_ST=8'b0000_1000,READ_ST=8'b0001_0000,
          READ_PR=8'b0010_0000,READ_END=8'b0100_0000;








//initialize
initial
    begin
    Reset<=1'b0;
    Sclk<=1'b0;
    Convstab<=1'b1;
    Cs_n<=1'b1;
    Os2<=1'b0;
    Os1<=1'b0;
    Os0<=1'b0;
    Value1<=15'b0;
    Value2<=15'b0;
    Value3<=15'b0;
    Value4<=15'b0;
    Value5<=15'b0;
    Value6<=15'b0;
    Value7<=15'b0;
    Value8<=15'b0;
    Aout<=71'b0;
    Bout<=71'b0;
    en_t1<=1'b0;
    t1_cnt<=4'b0;
    t1_full<=1'b0;
    en_t2<=1'b0;
    t2_cnt<=4'b0;
    t2_full<=1'b0;    
    en_sclk<=1'b0;
    sclk_full<=1'b0;
    sclk_cnt<=8'b0;
    sclk_current<=8'b0;
    state<=IDLE;
    nextstate<=IDLE;
    end

// time-logic
always @(posedge Clk or negedge Start)
     if(!Start) state<=IDLE;
     else state<=nextstate;  
//combine-logic
always @(state or Start or Busy or Frstdata or (sclk_current==72) or t1_full or t2_full)
     case(state)
          IDLE:
               nextstate=(Start)?RST_END:IDLE;
          RST_END:
                nextstate=(t1_full)?CONVST_PR:RST_END;
          CONVST_PR:
                nextstate=(t2_full)?CONVST_ST:CONVST_PR;
          CONVST_ST:
                nextstate=(Busy)?READ_ST:CONVST_ST;
          READ_ST:
                nextstate=(Frstdata)?READ_PR:READ_ST;
          READ_PR:
                nextstate=(sclk_current==72)?READ_END:READ_PR;
          READ_END:
                nextstate=(!Busy)?CONVST_PR:READ_END;
          default:
                nextstate=IDLE;
     endcase
//output logic
//Reset
always @(state or  Start or t1_full)
    if(!Start) Reset =1'b0;
    else if((state ==RST_END))
        Reset=1'b1;
    else if((state==CONVST_PR))
        Reset=1'b0;
    else Reset=Reset;
//en_t1
always @(state or Start or t1_full)
    if(!Start) en_t1=1'b0;
//    else if((state==IDLE)&&(Start==1))   en_t1 =0,not step into CONVST_PR
//      en_t1=1'b1;
    else if(state == RST_END)   // add state == RST_END
      en_t1=1'b1;
    else if(state==CONVST_PR)
       en_t1=1'b0;
    else en_t1=en_t1;
//en_t2
always @(state or Start or t1_full or Busy)
    if(!Start) en_t2=1'b0;
    else if(state==CONVST_PR)
      en_t2=1'b1;
    else if(state==CONVST_ST)
       en_t2=1'b0;
    else en_t2=en_t2;
//Convstab all condition included state use or logic 
always @(state or  Start or t1_full or t2_full or Busy)
    if(!Start) Convstab=1'b1;
    else if(state ==CONVST_PR)  
//    else if((t1_full))
      Convstab=1'b0;
    else if(state ==CONVST_ST)
      Convstab=1'b1;
    else Convstab=Convstab;
//Convstb

//Cs_n
always @(state or Start or Busy or sclk_current)
    if(!Start) Cs_n=1'b1;
    else if(state==READ_ST)
      Cs_n=1'b0;
    else if(state==READ_END)
      Cs_n=1'b1;
    else Cs_n=Cs_n;
//en_sclk
always @(state or  Start or Frstdata or sclk_current)
    if(!Start) en_sclk=1'b0;
//    else if((state==READ_ST)&&(Frstdata))  add state ==READ_PR
   else if(state==READ_PR)
      en_sclk=1'b1;
    else if(state==READ_END)
      en_sclk=1'b0;
//    else if(state==CONVST_ST)  problem 1
//      sclk_current=8'b0;
    else en_sclk=en_sclk;
//Value1
always @( state or  Start)
    if(!Start) Value1=16'b0;
    else if((state==READ_END))
      Value1=Aout[71:56];
    else Value1=Value1;
//Value2
always @( state or  Start)
    if(!Start) Value2=16'b0;
    else if((state==READ_END))
      Value2=Aout[53:38];
    else Value2=onceOk;
//Value3
always @(state or Start)
    if(!Start) Value3=16'b0;
    else if((state==READ_END))
      Value3=Aout[35:20];
    else Value3=sclk_cnt;
//Value4
always @(state or Start)
    if(!Start) Value4=16'b0;
    else if((state==READ_END))
      Value4=Aout[17:2];
    else Value4=Convstab;
//Value5
always @(state or  Start)
    if(!Start) Value5=16'b0;
    else if((state==READ_END))
      Value5=Bout[71:56];
    else Value5=en_sclk;
//Value2
always @(state or  Start)
    if(!Start) Value6=16'b0;
    else if((state==READ_END))
      Value6=Bout[53:38];
    else Value6=sclk_current;
//Value3
always @(state or Start)
    if(!Start) Value7=16'b0;
    else if((state==READ_END))
      Value7=Bout[35:20];
    else Value7=Busy;
//Value4
always @(state or  Start)
    if(!Start) Value8=state;
    else if((state==READ_END))
      Value8=Bout[17:2];
    else Value8=state;

//Value4
always @(state or  Start)
    if(!Start) Phase=IDLE;
    else Phase =state;
endmodule