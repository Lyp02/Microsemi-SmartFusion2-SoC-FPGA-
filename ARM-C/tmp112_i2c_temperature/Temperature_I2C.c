
#include "drivers/mss_gpio/mss_gpio.h"
#include "Temperature_I2C.h"
//TSCL ---GPIO8
//TSDA ---GPIO9改变读写模式
void delayus (uint32_t time_us)
{
	uint32_t i = 0;
	while( i < time_us*1000) //0.001MHZ -0.4MHZ
	{
		i++;
	}
	return;
}
void TSCL(int a){
	if(a==0){
		MSS_GPIO_set_output(MSS_GPIO_8,0);

	}
	if(a==1){
		MSS_GPIO_set_output(MSS_GPIO_8,1);
	}
}

void TSDA(int a){
	if(a==0){
	//	MSS_GPIO_set_output(MSS_GPIO_9,0);
		MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_DRIVE_LOW);

	}
	if(a==1){
	//	MSS_GPIO_set_output(MSS_GPIO_9,1);
		MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_DRIVE_HIGH);
	}
}

void I2Cstart(){
	TSDA(1);
	delayus(2);
	TSCL(1);
	delayus(2);
	TSDA(0);
	delayus(2);
}
void I2Cstop(){
	TSDA(0);
	delayus(2);
	TSCL(1);
	delayus(2);
	TSDA(1);
	delayus(2);
}

void I2Cinit(){
	TSDA(1);
	delayus(4);
	TSCL(1);
	delayus(2);
}
void I2CslaveAck(){
	uint16_t i=0;
	TSCL(0);
	delayus(1);
	TSCL(1);
	delay(2);
	MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
	//
//	MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INPUT_MODE);
	uint32_t temp =1;
	temp =(GPIO->GPIO_IN)&(MSS_GPIO_9_MASK);
	while((temp!=0)&&(i<3000)){
	//while((i<3000)){
		i++;
		temp =(GPIO->GPIO_IN)&(MSS_GPIO_9_MASK);
	}
	TSCL(0);
	delayus(2);
//	MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INOUT_MODE);
}
void I2CmasterAck(){
	TSCL(0);
	delayus(1);
	TSDA(0);
	delayus(1);
	TSCL(1);
	delayus(2);
	TSCL(0);
	delayus(2);
}
void I2CmasterNotAck(){
	TSCL(0);
	delayus(1);
	TSDA(1);
	delayus(1);
	TSCL(1);
	delayus(2);
	TSCL(0);
	delayus(2);
}

void I2Cwritebyte(uint8_t data){
	uint8_t i,temp;
	temp =data;
	uint8_t value;
	for(i=0;i<8;i++){
        value =(temp>>7)&(0x01);
        if(value!=0){
        	TSCL(0);
        	delayus(2);
        	TSDA(1);
        	delayus(2);
        	TSCL(1);
        	delayus(2);
        }
        else {
        	TSCL(0);
        	delayus(2);
        	TSDA(0);
        	delayus(2);
        	TSCL(1);
        	delayus(2);
        }
        temp=(temp<<1);
	}
	TSCL(0);
	delayus(2);
	TSDA(1);
	delayus(2);
}
uint8_t I2Creadbyte(){
    uint8_t i;
    uint8_t k=0;
    uint32_t value;
    TSCL(0);
    delayus(2);
	MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
	//MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INPUT_MODE);
	delayus(2);
	for(i=0;i<8;i++){
		TSCL(1);
		delay(2);
		delayus(2);
		value =(GPIO->GPIO_IN)&(MSS_GPIO_9_MASK);
		value =MSS_GPIO_get_inputs();
		value =value &(MSS_GPIO_9_MASK);
		k =(k)|(value>>9);
		TSCL(0);
		delayus(2);
		if(i!=7){k=(k<<1);}
	}
	//MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_OUTPUT_MODE);
	return k;
}
void I2C_write(uint8_t* writebuffer,uint8_t write_length){
	I2C_Init();
	I2Cstart();
	uint8_t i=0;
	for(i=0;i<write_length;i++){
		I2Cwritebyte(*(writebuffer+i));
		I2CslaveAck();
	}
	I2Cstop();
}


void I2C_read(uint8_t *writebuffer,uint8_t write_length,int8_t* readbuffer,uint8_t read_lenght){
	I2Cinit();
	I2Cstart();
	uint8_t i=0;
	for(i=0;i<write_length-1;i++){
		I2Cwritebyte(*(writebuffer+i));
		I2CslaveAck();
	}
	I2Cstop();

	I2Cstart();
	i=0;
	I2Cwritebyte(*(writebuffer+write_length-1));
	I2CslaveAck();
	for( i=0;i<read_lenght-1;i++){
		*(readbuffer + i) =I2Creadbyte();
		I2CmasterAck();
	}
	*(readbuffer +i) =I2Creadbyte();
	I2CmasterNotAck();
	I2Cstop();
}


//void I2C_write(uint8_t* writebuffer,uint8_t write_length){
//	MSS_GPIO_config(MSS_GPIO_8,MSS_GPIO_OUTPUT_MODE);   //  GPIO_8配置为TSCL
//	MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INOUT_MODE);   //  GPIO_8配置为TSDA 动态变化输入输出模式
//    //起始位
//
//    delay(2);
//    TSDA(1);
//    delayus(1);
//    TSCL(1);
//	delayus(2);
//	TSDA(0);
//	delayus(2);
//	TSCL(0);
//
//	//总线控制
//	delayus(4);
//	int k =0;
//	int i =0;
//	uint8_t temp =0;
//	while(k<write_length){
//		 temp =*(writebuffer+k);
//		for(i=0;i<=7;i++)
//		{
//
//			if((temp>>7)&0x1){
//				TSCL(0);
//				delayus(2);
//				TSDA(1);
//				delayus(4);
//				TSCL(1);
//				delayus(4); //scl=0,设定sda scl=1上升沿锁定
//
//			}
//
//			else{
//				TSCL(0);
//				delayus(2);
//				TSDA(0);
//				delayus(4);
//				TSCL(1);
//				delayus(4);
//			}
//
//			temp<<=1;
//
//		}
//		//slave应答
//
//		//TSDA(1);
//		TSCL(0);
//		delayus(4);
//		MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
//		delay(100);
//		uint16_t time =0;
//		TSCL(1);
//		delay(1);
//		while((((GPIO->GPIO_IN)&(MSS_GPIO_9_MASK))!=0)&&(time<3000)) time++;
//		TSCL(0);
//		delayus(4);
//		k++;
//	}
//	//停止位
//    TSCL(0);
//    delay(1);
//	TSDA(0);
//	delayus(2);
//	TSCL(1);
//	delayus(2);
//	TSDA(1);
//	delayus(2);
//	TSCL(0);
//	delayus(4);
//	//空闲
//
//
//}

//void I2C_read(uint8_t * writebuffer,uint8_t write_length, uint8_t* readbuffer,uint8_t read_length){
//	MSS_GPIO_config(MSS_GPIO_8,MSS_GPIO_OUTPUT_MODE);   //  GPIO_8配置为TSCL
//	MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INOUT_MODE);   //  GPIO_8配置为TSDA 动态变化输入输出模式
//	//写地址
//
//
//	//写配置  --2byte
//	I2C_write(writebuffer,write_length-1);
//
//
//	//读取--写操作
//	//起始
//	TSCL(0);
//    TSDA(1);
//    delay(2);
//    TSCL(1);
//	delayus(2);
//	TSDA(0);
//	delayus(2);
//	TSCL(0);
//
//	//写入读取地址
//	uint8_t temp =*(writebuffer+write_length-1);
//	uint8_t i=0;
//	for(i=0;i<=7;i++)
//	{
//
//	if((temp>>7)&0x1){
//		TSCL(0);
//		delayus(2);
//		TSDA(1);
//		delayus(4);
//		TSCL(1);
//		delayus(4); //scl=0,设定sda scl=1上升沿锁定
//	}
//
//	else{
//		TSCL(0);
//		delayus(2);
//		TSDA(0);
//		delayus(4);
//		TSCL(1);
//		delayus(4);
//	}
//
//	temp<<=1;
//
//	}
//	//slave应答
//	  TSCL(0);
//	  delayus(4);
//	  TSCL(1);
//	  MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
//	  delay(1);
//	  uint16_t time =0;
//
//	  while((((GPIO->GPIO_IN)&(MSS_GPIO_9_MASK))!=0)&&(time<3000)) time++;
//	  TSCL(0);
//	  delayus(4);
//
//
//
//
//	//读取数据
//	//MSS_GPIO_config(MSS_GPIO_9,MSS_GPIO_INPUT_MODE);
//	MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
//
//	//delayus(10);
//	//MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_DRIVE_LOW);
//	//delayus(20);
//    uint8_t value =0;
//	int k =0;
//	uint32_t bits32 =0;
//    TSCL(0);
//    delayus(2);
//    TSDA(1);
//	while(k<read_length){
//		MSS_GPIO_drive_inout(MSS_GPIO_9,MSS_GPIO_HIGH_Z);
//		value =0 ;
//		for(i=0;i<=7;i++)
//		{   TSCL(1);
//            delay(4);
//			bits32 =GPIO->GPIO_IN;
//			uint8_t result =(((bits32)&(MSS_GPIO_9_MASK))>>9)&(0x01);
//			if(result!=0){
//				value =(value)|0x01;
//			}
//			else{
//				value =(value)|(0x00);
//			}
//            delayus(2);
//            TSCL(0);
//            delayus(4);
//            value=value<<1;
//		}
//		//master 应答
//		   TSDA(0);
//		   TSCL(1);
//		   delayus(4);
//		   TSCL(0);
//		   TSDA(1);
//		   delayus(4);
//		   *(readbuffer+k) =value;
//		   k++;
//	}
//	//停止位
//
//
//    TSCL(0);
//    delay(1);
//	TSDA(0);
//	delayus(2);
//	TSCL(1);
//	delayus(2);
//	TSDA(1);
//	delayus(2);
//	TSCL(0);
//	delayus(4);
//	//空闲
//	TSCL(1);
//	TSDA(1);
//	delayus(12);
//}

void I2C_write_rig(){
	uint8_t writebuffer[4] ={0x00,0x00,0x00,0x00};
	writebuffer[0]=write_addr;
	writebuffer[1]=configure_code[0];
	writebuffer[2]=configure_code[1];
	writebuffer[3]=configure_code[2];
	I2C_write(writebuffer,4);
}
int16_t I2C_read_rig(){
	uint8_t writebuffer[3]={0x00,0x00,0x00};
	writebuffer[0]=write_addr;
	writebuffer[1]=readcode;
	writebuffer[2]=read_addr;
	int16_t temperature =0;
	int8_t readbuffer[2]={0x00,0x00};
	uint16_t readtemp[2]={0x00,0x00};
	uint16_t temp;
    I2C_read(writebuffer,3,readbuffer,2);
	readtemp[1] =readbuffer[1];
	readtemp[0]=readbuffer[0];
	temp =(((readbuffer[0]<<4)|(readtemp[1]>>4)));
	temperature =(temperature)|(temp);
	temperature =(temperature/16);
     	return readbuffer[0];

}
void I2CWriteTest(){
  uint8_t writebuffer[3]={0x5A,4,99};
  I2C_write(writebuffer,3);
}
void I2CReadTest(){
  uint8_t writebuffer =0x5B;
  uint8_t readbuffer=0;
	I2Cinit();
    I2Cstart();
	I2Cwritebyte(writebuffer);
	I2CslaveAck();
	readbuffer =I2Creadbyte();
	I2CmasterNotAck();
	I2Cstop();
}
