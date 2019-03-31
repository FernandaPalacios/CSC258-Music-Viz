# cd palaci37/CSC258/Lab7_Part2/lab7_part2
# Set the working dir, where all compiled Verilog goes.
vlib work

# Compile all Verilog modules in mux.v to working dir;
# could also have multiple Verilog files.
# The timescale argument defines default time unit
# (used when no unit is specified), while the second number
# defines precision (all times are rounded to this value)
vlog -timescale 1ps/1ps music_viz2.v

# Load simulation using mux as the top level simulation module.
vsim music_viz2

# Log all signals and add some signals to waveform window.
log {/*}

# add wave {/*} would add all items in top level simulation module.
add wave {/*}
add wave {/music_viz2/c0/c/*}
add wave {/music_viz2/d0/drawline/*}
# add wave {/music_viz2/d0/coordinates/*}

force {CLOCK_50} 0 0, 1 20 -r 40

# reset
force {KEY[0]} 0 0 ps, 1 40 ps

# visualize
force {KEY[1]} 1 0 ps, 0 40 ps, 1 520 ps
# colour (white)
force {SW[2]} 1
force {SW[1]} 1
force {SW[0]} 1


run 10000000 ps 