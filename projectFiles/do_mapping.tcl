# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {captureOutput2.sv sobel.sv concat2.sv controller2.sv rgbToGray2.sv flex_counter2.sv readCounters.sv readController.sv flex_counter.sv  edgeDetection2.sv}
elaborate edgeDetection2 -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/edgeDetection2.rep
report_area >> reports/edgeDetection2.rep
report_power -hier >> reports/edgeDetection2.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/edgeDetection2.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
