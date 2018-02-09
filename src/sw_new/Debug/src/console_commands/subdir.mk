################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/console_commands/command.c \
../src/console_commands/console.c 

OBJS += \
./src/console_commands/command.o \
./src/console_commands/console.o 

C_DEPS += \
./src/console_commands/command.d \
./src/console_commands/console.d 


# Each subdirectory must supply rules for building sources it contributes
src/console_commands/%.o: ../src/console_commands/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O0 -g3 -I../../sw_new_bsp/ps7_cortexa9_0/include -I"C:\Users\Steven\Documents\402\AD9361 Files from Farhan\sw_new\src" -I"C:\Users\Steven\Documents\402\AD9361 Files from Farhan\sw_new\src\platform_xilinx" -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


