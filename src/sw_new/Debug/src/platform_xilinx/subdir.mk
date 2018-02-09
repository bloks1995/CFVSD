################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/platform_xilinx/adc_core.c \
../src/platform_xilinx/dac_core.c \
../src/platform_xilinx/platform.c 

OBJS += \
./src/platform_xilinx/adc_core.o \
./src/platform_xilinx/dac_core.o \
./src/platform_xilinx/platform.o 

C_DEPS += \
./src/platform_xilinx/adc_core.d \
./src/platform_xilinx/dac_core.d \
./src/platform_xilinx/platform.d 


# Each subdirectory must supply rules for building sources it contributes
src/platform_xilinx/%.o: ../src/platform_xilinx/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../sw_new_bsp/ps7_cortexa9_0/include -I"C:\Users\Steven\Documents\402\AD9361 Files from Farhan\sw_new\src" -I"C:\Users\Steven\Documents\402\AD9361 Files from Farhan\sw_new\src\platform_xilinx" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


