create_clock [ get_ports "clk"] -name sample_clk -period 100.0
create_clock [ get_ports "uio_in\[3\]"] -name spi_clk -period 100.0

set input_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT) ]
set output_delay_value [expr $::env(CLOCK_PERIOD) * $::env(IO_PCT) ]
set_max_fanout $::env(MAX_FANOUT_CONSTRAINT) [current_design]

set cap_load [ expr $::env(OUTPUT_CAP_LOAD) / 1000.0]

set idx [lsearch [ all_inputs] "clk"]
set all_sample_inputs_wo_clk  [lreplace [ all_inputs ] $idx $idx]
set idx [lsearch $all_sample_inputs_wo_clk "uio_in[0]"]
set all_sample_inputs [lreplace $all_sample_inputs_wo_clk $idx $idx]
set idx [lsearch $all_sample_inputs "uio_in[1]"]
set all_sample_inputs_2 [lreplace $all_sample_inputs $idx $idx]
set idx [lsearch $all_sample_inputs_2 "uio_in[2]"]
set all_sample_inputs_3 [lreplace $all_sample_inputs_2 $idx $idx]
set idx [lsearch $all_sample_inputs_3 "uio_in[3]"]
set all_sample_inputs_4 [lreplace $all_sample_inputs_3 $idx $idx]
set idx [lsearch $all_sample_inputs_4 "uio_in[4]"]
set all_sample_inputs_5 [lreplace $all_sample_inputs_4 $idx $idx]
set idx [lsearch $all_sample_inputs_5 "uio_in[5]"]
set all_sample_inputs_6 [lreplace $all_sample_inputs_5 $idx $idx]
set idx [lsearch $all_sample_inputs_6 "uio_in[6]"]
set all_sample_inputs_7 [lreplace $all_sample_inputs_6 $idx $idx]
set idx [lsearch $all_sample_inputs_7 "uio_in[7]"]
set all_sample_inputs_8 [lreplace $all_sample_inputs_7 $idx $idx]

#set idx [lsearch [ all_inputs] "clk"]
#set all_spi_wo_clk  [lreplace [all_inputs] $idx $idx]
#set idx [lsearch $all_spi_wo_clk "ui_in\[0\]"]
#set all_spi_inputs [lreplace $all_spi_wo_clk $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[1\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[2\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[3\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[4\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[5\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[6\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "ui_in\[7\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]
#set idx [lsearch $all_spi_inputs "uio_in\[3\]"]
#set all_spi_inputs [lreplace $all_spi_inputs $idx $idx]

set idx [lsearch [ all_outputs] "uio_out"]
set all_sample_outputs  [lreplace [ all_outputs ] $idx $idx]

set idx [lsearch [ all_outputs] "uo_out"]
set all_spi_outputs  [lreplace [ all_outputs ] $idx $idx]

set_input_delay $input_delay_value -clock [get_clocks sample_clk] $all_sample_inputs_8
#set_input_delay $input_delay_value -clock [get_clocks spi_clk] $all_spi_inputs

set_output_delay $output_delay_value -clock [get_clocks sample_clk] $all_sample_outputs
set_output_delay $output_delay_value -clock [get_clocks spi_clk] $all_spi_outputs

#set_clock_uncertainty $env::(SYNTH_CLOCK_UNCERTAINTY) [get_clocks sample_clk]
#set_clock_uncertainty $env::(SYNTH_CLOCK_UNCERTAINTY) [get_clocks spi_clk]

#set_clock_transition $env::(SYNTH_CLOCK_TRANSITION) [get_clocks sample_clk]
#set_clock_transition $env::(SYNTH_CLOCK_TRANSITION) [get_clocks spi_clk]

set_clock_groups -asynchronous -group {sample_clk} -group {spi_clk}





