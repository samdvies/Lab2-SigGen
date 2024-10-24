#!/bin/bash

# Clean up previous build files
rm -rf obj_dir
rm -f sinegen.vcd

# Attach USB script
~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# Compile SystemVerilog files with Verilator, including tracing and testbench
verilator -Wall --cc --trace sinegen.sv counter.sv rom.sv --exe sinegen_tb.cpp

# Build the model using make
make -j -C obj_dir/ -f Vsinegen.mk Vsinegen

# Run the generated model
obj_dir/Vsinegen
