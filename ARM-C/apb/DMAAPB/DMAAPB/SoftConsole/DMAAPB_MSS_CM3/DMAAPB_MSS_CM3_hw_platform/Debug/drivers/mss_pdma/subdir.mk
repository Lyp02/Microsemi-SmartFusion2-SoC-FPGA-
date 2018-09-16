################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/mss_pdma/mss_pdma.c 

OBJS += \
./drivers/mss_pdma/mss_pdma.o 

C_DEPS += \
./drivers/mss_pdma/mss_pdma.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/mss_pdma/%.o: ../drivers/mss_pdma/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU C Compiler'
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\CMSIS -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\CMSIS\startup_gcc -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers\mss_hpdma -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers\mss_nvm -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers\mss_pdma -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers\mss_sys_services -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers\mss_timer -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers_config -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\drivers_config\sys_config -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\hal -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\hal\CortexM3 -ID:\M2S010TQG144\EDIB_1\DMAAPB\DMAAPB\SoftConsole\DMAAPB_MSS_CM3\DMAAPB_MSS_CM3_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


