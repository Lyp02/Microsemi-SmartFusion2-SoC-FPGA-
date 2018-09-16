#ifndef TEMPERATURE_I2C_H_
#define TEMPERATURE_I2C_H_

#include "m2sxxx.h"
uint8_t write_addr =0x90;
uint8_t read_addr  =0x91;
uint8_t configure_code[3] ={0x01,0x60,0x20};
//uint8_t configure_code[3] ={0x01,0x60,0x20};
uint8_t readcode =0x00;
void TSCL(int a);
void TSDA(int a);
void I2C_write(uint8_t* writebuffer,uint8_t write_length);
void I2C_read(uint8_t * writebuffer,uint8_t write_length ,int8_t* readbuffer,uint8_t read_length);
void I2C_write_rig();
int16_t I2C_read_rig();
void delayus(uint32_t time_us);
void I2Cstart();
void I2Cstop();
void I2Cinit();
void I2CslaveAck();
void I2CmasterAck();
void I2CmasterNotAck();
void I2Cwritebyte(uint8_t data);
void I2CWriteTest();
void I2CReadTest();
uint8_t I2Creadbyte();
#endif
