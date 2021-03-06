`timescale 1ns/1ps
`define clock_period 10
module AD7609_tb;
reg Start,Clk,Busy,Douta,Doutb,Frstdata;
wire Cs_n,Convsta,Convstb,Sclk,Reset,Os2,Os1,Os0;
wire [15:0] Value1,Value2,Value3,Value4,Value5,Value6,Value7,Value8;
wire[7:0] Phase;
wire[7:0] sclk_current,a_record,b_record;
wire[71:0] Aout,Bout;
AD7609 AD7609_test(
.Start(Start),.Clk(Clk),.Busy(Busy),.Douta(Douta),.Doutb(Doutb),.Frstdata(Frstdata),
.Cs_n(Cs_n),.Convsta(Convsta),.Convstb(Convstb),.Sclk(Sclk),.Reset(Reset),
.Os2(Os2),.Os1(Os1),.Os0(Os0),.Value1(Value1),.Value2(Value2),.Value3(Value3),.Value4(Value4),
.Value5(Value5),.Value6(Value6),.Value7(Value7),.Value8(Value8),.Phase(Phase),.Aout(Aout),.Bout(Bout),
.sclk_current(sclk_current),.a_record(a_record),.b_record(b_record));
initial Clk=0;
always #(`clock_period /2) Clk=~Clk;
initial begin
        Start=0;
        Busy=0;
        Frstdata=0;
        Douta=0;
        Doutb=0;
        #(`clock_period *20);
        Start=1; 
        #(`clock_period *16);
        Busy=1;
        #(`clock_period);
        Frstdata=1;
//******************1**********************
// Value1 Value5
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        Frstdata=0;
//Value2 Value6
        repeat(18)begin
                  Douta=0;
                  Doutb=0;
                  #(`clock_period*5);
                  end
//Value3 Value7
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value4 Value8
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        #(`clock_period *30);
        Busy=0;
        #(`clock_period*10);
//*********************2***********************       
        #(`clock_period *16);

        Busy=1;
        #(`clock_period);
        Frstdata=1;
// Value1 Value5
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
        Frstdata=0;
//Value2 Value6
        repeat(18)begin
                  Douta=0;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value3 Value7
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end

//Value4 Value8
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        

        
        #(`clock_period *30);
        Busy=0;
        #(`clock_period*10);
//*********************3***********************       
        #(`clock_period *16);

        Busy=1;
        #(`clock_period);
        Frstdata=1;
// Value1 Value5
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
        Frstdata=0;
//Value2 Value6
        repeat(18)begin
                  Douta=0;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value3 Value7
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value4 Value8
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        

        
        #(`clock_period *30);
        Busy=0;
        #(`clock_period*10);

//*********************4***********************       
        #(`clock_period *16);

        Busy=1;
        #(`clock_period);
        Frstdata=1;
// Value1 Value5
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
       
        Frstdata=0;
//Value2 Value6
        repeat(18)begin
                  Douta=0;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value3 Value7
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
        
//Value4 Value8
        repeat(18)begin
                  Douta=1;
                  Doutb=0;
                  #(`clock_period*5);
                  end
       
        
        #(`clock_period *30);
        Busy=0;
        #(`clock_period*10);
        $stop;
        end
endmodule


