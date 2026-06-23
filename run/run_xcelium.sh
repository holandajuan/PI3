#!/bin/bash
xrun -64bit -sv \
../rtl/coin_input.sv \
../rtl/flavor_input.sv \
../rtl/dispenser_output.sv \
../rtl/display_output.sv \
../rtl/vending_controller.sv \
../rtl/vending_top.sv \
../tb/tb_vending_top.sv \
-access +rwc
