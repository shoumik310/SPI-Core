## Generated SDC file "spi_core.sdc"

## Copyright (C) 2025  Altera Corporation. All rights reserved.
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, the Altera Quartus Prime License Agreement,
## the Altera IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Altera and sold by Altera or its authorized distributors.  Please
## refer to the Altera Software License Subscription Agreements 
## on the Quartus Prime software download page.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 25.1std.0 Build 1129 10/21/2025 SC Lite Edition"

## DATE    "Fri Jan 16 10:27:21 2026"

##
## DEVICE  "EP2AGX45CU17I3"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {clk} -period 8.000 -waveform { 0.000 4.000 } [get_ports { clk }]
create_clock -name {timingGenerator:Clk_Gen|phase_shift_buffer} -period 16.000 -waveform { 0.000 8.000 } [get_registers { timingGenerator:Clk_Gen|phase_shift_buffer }]
create_clock -name {sck} -period 16.000 -waveform { 0.000 8.000 } [get_ports {sck}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {clk}] -rise_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {clk}] -fall_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {clk}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {clk}] -rise_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {clk}] -fall_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -rise_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -rise_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.020  
set_clock_uncertainty -rise_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -fall_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -rise_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -fall_to [get_clocks {clk}]  0.030  
set_clock_uncertainty -fall_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -rise_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.020  
set_clock_uncertainty -fall_from [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}] -fall_to [get_clocks {timingGenerator:Clk_Gen|phase_shift_buffer}]  0.020  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {control[8]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[0]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[1]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[2]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[3]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[4]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[5]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[6]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_in[7]}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {miso}]
set_input_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {reset}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[0]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[1]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[2]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[3]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[4]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[5]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[6]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {data_out[7]}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {mosi}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {sck}]
set_output_delay -add_delay  -clock [get_clocks {clk}]  1.000 [get_ports {spif}]


#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

