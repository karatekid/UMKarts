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
	arm-none-eabi-gcc -mthumb -mcpu=cortex-m3 -DACTEL_STDIO_THRU_UART -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\CMSIS -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\CMSIS\startup_gcc -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_ace -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_gpio -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_nvm -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_pdma -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_rtc -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_timer -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers\mss_uart -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers_config -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\drivers_config\mss_ace -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\hal -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\hal\CortexM3 -IC:\Users\mikechri\Downloads\gc\gc\SoftConsole\gc_MSS_MSS_CM3_0\gc_MSS_MSS_CM3_0_hw_platform\hal\CortexM3\GNU -O0 -ffunction-sections -fdata-sections -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o"$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

