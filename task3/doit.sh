#!/bin/bash

# Clean up previous build files
rm -rf obj_dir
rm -f sigdelay.vcd

# Attach USB script
~/Documents/iac/lab0-devtools/tools/attach_usb.sh

# Compile SystemVerilog files with Verilator, including tracing and testbench
verilator -Wall --cc --trace sigdelay.sv counter.sv ram.sv --exe sigdelay_tb.cpp

# Build the model using make
make -j -C obj_dir/ -f Vsigdelay.mk Vsigdelay

# Run the generated model
obj_dir/Vsigdelay
