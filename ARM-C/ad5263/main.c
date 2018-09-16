#include "mss_i2c.h"
#include "mss_gpio.h"
static uint8_t SLAVE_AD5263_ADDRESS1 = 0x2c;
static uint8_t SLAVE_AD5263_ADDRESS2 = 0x2e;
static uint8_t AD5263_A_ADDRESS1 = 0x00;
static uint8_t AD5263_A_ADDRESS2 = 0x00;
void main(){
	MSS_GPIO_init();
	MSS_GPIO_config(MSS_GPIO_1,MSS_GPIO_OUTPUT_MODE);
	MSS_GPIO_set_output(MSS_GPIO_1,1);
	mss_i2c_status_t status;
	uint8_t successBit1=0;
	uint8_t successBit2=0;
	MSS_I2C_init(&g_mss_i2c0,0x00,MSS_I2C_PCLK_DIV_256);
	uint8_t data1[2];
	uint8_t data2[2];
	uint8_t read_data1[1];
	uint8_t read_data2[1];
	data1[0]=AD5263_A_ADDRESS1;
	data1[1]=0x32;
	data2[0]=AD5263_A_ADDRESS2;
	data2[1]=0x32;
	MSS_I2C_write(&g_mss_i2c0,SLAVE_AD5263_ADDRESS1,data1,sizeof(data1), MSS_I2C_RELEASE_BUS );
	status =MSS_I2C_wait_complete(&g_mss_i2c0,MSS_I2C_NO_TIMEOUT);

	MSS_I2C_read(&g_mss_i2c0,SLAVE_AD5263_ADDRESS1,read_data1,sizeof(read_data1),MSS_I2C_RELEASE_BUS);
	status =MSS_I2C_wait_complete(&g_mss_i2c0,MSS_I2C_NO_TIMEOUT);

	if(data1[1]==read_data1[0]){
		successBit1=1;
	}
	MSS_I2C_write(&g_mss_i2c0,SLAVE_AD5263_ADDRESS2,data2,sizeof(data2), MSS_I2C_RELEASE_BUS );
	status =MSS_I2C_wait_complete(&g_mss_i2c0,MSS_I2C_NO_TIMEOUT);

	MSS_I2C_read(&g_mss_i2c0,SLAVE_AD5263_ADDRESS2,read_data2,sizeof(read_data2),MSS_I2C_RELEASE_BUS);
	status =MSS_I2C_wait_complete(&g_mss_i2c0,MSS_I2C_NO_TIMEOUT);

	if(data2[1]==read_data2[0]){
		successBit2=1;
	}
    while(1);
}
