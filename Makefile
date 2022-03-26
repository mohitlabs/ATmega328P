# File: Makefile for AVR Microcontrollers
# Author: Mohit Singh (mohitsingh5.ms@gmail.com)
# Date: 2022-01-28

# Directions:-
# make compile -> Compile the source code
# make assemble -> Assemble the assembly
# make link -> Link the object files
# make program -> Program chip
# make clean -> Clean all binaries

# CPP Source Directory
CPPDIR = src/cpp

# ASM Source Directory
ASMDIR = src/asm

# S Directory
SDIR = build/S

# Object Code Directory
OBJDIR = build/obj

# Binary Directory
BINDIR = build/bin

# CPP Dependency file name (without extension)
CPPDEPENDENCY = ATmega328P

# ASM Dependency file name (without extension)
ASMDEPENDENCY = gpio

# Target file name (without extension)
TARGET = main

# Microcontroller Device
MCU = atmega328p

# Give Port
PORT = /dev/spidev*

# Give Programmer
PROGRAMMER = linuxspi #avrispmkII

# Set Baud Rate
BAUD_RATE = 115200

# Configurations File
CONF = /etc/avrdude.conf

SOBJFILES = $(OBJDIR)/$(CPPDEPENDENCY).o $(OBJDIR)/$(TARGET).o

ASMOBJFILES = $(OBJDIR)/$(ASMDEPENDENCY).o

OBJFILES = $(SOBJFILES) $(ASMOBJFILES)

SFILES = $(SDIR)/$(CPPDEPENDENCY).S $(SDIR)/$(TARGET).S

AVRGCC_FLAGS = -O2 -Wall -g -Os -w -std=gnu11 -mmcu=$(MCU)
AVRG++_FLAGS = -O2 -Wall -g -Os -w -std=gnu++11 -mmcu=$(MCU)

AVRDUDE_FLAGS = -v -c $(PROGRAMMER) -C $(CONF) -p $(MCU) -P $(PORT) -b $(BAUD_RATE)
AVRDUDE_WRITE_FLASH = -U flash:w:$(BIN)/$(TARGET).hex:i
#AVRDUDE_WRITE_EEPROM =

# Create .hex file from .elf file
$(BINDIR)/$(TARGET).hex: $(BINDIR)/$(TARGET).elf
	@echo
	@echo Creating load file for Flash Memory:
	avr-objcopy -j .text -j .data -O ihex $< $@

# Link: Create .elf file from .o file
$(BINDIR)/$(TARGET).elf: $(OBJFILES)
	@echo
	@echo Linking $(OBJFILES):
	avr-g++ $(AVRG++_FLAGS) $^ -o $@
	@echo Linking Done!

# Assemble S: Create object file from .S assembly file
$(SOBJFILES): $(OBJDIR)/%.o: $(SDIR)/%.S
	@echo
	@echo Assembling $(SDIR)/$(wildcard %).S:
	avr-gcc -x assembler-with-cpp -c $(AVRGCC_FLAGS) $< -o $@
	@echo Assembling Done!

# Assemble ASM: Create object file from .asm assembly file
$(ASMOBJFILES): $(OBJDIR)/%.o: $(ASMDIR)/%.asm
	@echo
	@echo Assembling $(ASMDIR)/$(wildcard %).asm:
	avr-gcc -x assembler-with-cpp -c $(AVRGCC_FLAGS) $< -o $@
	@echo Assembling Done!

# Compile: Create .S assembly file from C++ source file
$(SFILES): $(SDIR)/%.S: $(CPPDIR)/%.cpp
	@echo
	@echo Compiling $(CPPDIR)/$(wildcard %).cpp:
	avr-g++ -S -c $(AVRG++_FLAGS) $< -o $@
	@echo Compiling Done!

# Main rule to make software and program chip
compile: $(SFILES)
assemble: $(SOBJFILES) $(ASMOBJFILES)
link: $(BINDIR)/$(TARGET).elf
program: $(BINDIR)/$(TARGET).hex
	avrdude $(AVRDUDE_FLAGS) $(AVRDUDE_WRITE_FLASH)
#	$(AVRDUDE_WRITE_EEPROM)

# Clean project
.PHONY: clean
clean:
	@echo
	@echo Cleaning $(BINDIR)/* $(OBJDIR)/* $(SDIR)/*:
	rm -f $(BINDIR)/*
	rm -f $(OBJDIR)/*
	rm -f $(SDIR)/*
	@echo Cleaning Done!
