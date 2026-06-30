# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.10-p002_1 on Mon Jun 29 22:43:29 -03 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design lowp6

create_clock -name "clk" -period 20.0 -waveform {0.0 10.0} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports enable]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[27]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[26]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[25]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[24]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[23]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[22]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[21]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[20]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[19]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[18]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[17]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[16]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[15]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[14]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[13]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[12]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[11]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[10]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[9]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[8]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_in[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[27]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[26]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[25]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[24]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[23]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[22]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[21]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[20]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[19]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[18]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[17]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[16]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 1.0 [get_ports {signal_out[0]}]
set_wire_load_mode "enclosed"
