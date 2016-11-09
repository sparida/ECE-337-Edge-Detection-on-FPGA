onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_edgeDetection2/tb_clk
add wave -noupdate /tb_edgeDetection2/tb_n_rst
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_startSignal
add wave -noupdate /tb_edgeDetection2/tb_inputData
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_rwError
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_readDone
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_writeDone
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_readAddress
add wave -noupdate /tb_edgeDetection2/tb_writeAddress
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_outputData
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_readEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_writeEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/tb_outputError
add wave -noupdate /tb_edgeDetection2/i
add wave -noupdate /tb_edgeDetection2/DUT/controller/startSignal
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/readDone
add wave -noupdate /tb_edgeDetection2/DUT/controller/rwError
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/countVal
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/countOut
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/signalToAssertWriteEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/writeDone
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/readEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/outputError
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/realOutputEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/executeRead
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/grayReady
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/grayReady2
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/writeEnable
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/assertWrite
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/assertWriteTemp
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/nxtState
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/controller/state
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/sobelValue
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/out
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/read
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/write
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/holdIt
add wave -noupdate -radix unsigned /tb_edgeDetection2/DUT/captureOutput/useIt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1017160 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {904039 ps} {1084472 ps}
