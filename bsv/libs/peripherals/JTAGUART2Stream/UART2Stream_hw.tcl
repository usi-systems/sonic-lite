# TCL File Generated by Component Editor 12.1
# Tue Nov 27 12:34:48 GMT 2012
# DO NOT MODIFY


# 
# UART2Stream "UART to Stream" v1.0
# Simon Moore 2012.11.27.12:34:48
# Interfaces to Altera JTAG UART to turn it into a stream
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module UART2Stream
# 
set_module_property DESCRIPTION "Interfaces to Altera JTAG UART to turn it into a stream"
set_module_property NAME UART2Stream
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP Cheri_IO
set_module_property AUTHOR "Simon Moore"
set_module_property DISPLAY_NAME "UART to Stream"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL mkUART2Stream
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file mkUART2Stream.v VERILOG PATH mkUART2Stream.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clockreset
# 
add_interface clockreset clock end
set_interface_property clockreset clockRate 0
set_interface_property clockreset ENABLED true

add_interface_port clockreset csi_clockreset_clk clk Input 1


# 
# connection point clockreset_reset
# 
add_interface clockreset_reset reset end
set_interface_property clockreset_reset associatedClock clockreset
set_interface_property clockreset_reset synchronousEdges DEASSERT
set_interface_property clockreset_reset ENABLED true

add_interface_port clockreset_reset csi_clockreset_reset_n reset_n Input 1


# 
# connection point stream_in
# 
add_interface stream_in avalon_streaming end
set_interface_property stream_in associatedClock clockreset
set_interface_property stream_in associatedReset clockreset_reset
set_interface_property stream_in dataBitsPerSymbol 8
set_interface_property stream_in errorDescriptor ""
set_interface_property stream_in firstSymbolInHighOrderBits true
set_interface_property stream_in maxChannel 0
set_interface_property stream_in readyLatency 0
set_interface_property stream_in ENABLED true

add_interface_port stream_in asi_stream_in_data data Input 8
add_interface_port stream_in asi_stream_in_valid valid Input 1
add_interface_port stream_in asi_stream_in_ready ready Output 1


# 
# connection point stream_out
# 
add_interface stream_out avalon_streaming start
set_interface_property stream_out associatedClock clockreset
set_interface_property stream_out associatedReset clockreset_reset
set_interface_property stream_out dataBitsPerSymbol 8
set_interface_property stream_out errorDescriptor ""
set_interface_property stream_out firstSymbolInHighOrderBits true
set_interface_property stream_out maxChannel 0
set_interface_property stream_out readyLatency 0
set_interface_property stream_out ENABLED true

add_interface_port stream_out aso_stream_out_data data Output 8
add_interface_port stream_out aso_stream_out_valid valid Output 1
add_interface_port stream_out aso_stream_out_ready ready Input 1


# 
# connection point avalonmm2jtaguart
# 
add_interface avalonmm2jtaguart avalon start
set_interface_property avalonmm2jtaguart addressUnits SYMBOLS
set_interface_property avalonmm2jtaguart associatedClock clockreset
set_interface_property avalonmm2jtaguart associatedReset clockreset_reset
set_interface_property avalonmm2jtaguart bitsPerSymbol 8
set_interface_property avalonmm2jtaguart burstOnBurstBoundariesOnly false
set_interface_property avalonmm2jtaguart burstcountUnits WORDS
set_interface_property avalonmm2jtaguart doStreamReads false
set_interface_property avalonmm2jtaguart doStreamWrites false
set_interface_property avalonmm2jtaguart holdTime 0
set_interface_property avalonmm2jtaguart linewrapBursts false
set_interface_property avalonmm2jtaguart maximumPendingReadTransactions 0
set_interface_property avalonmm2jtaguart readLatency 0
set_interface_property avalonmm2jtaguart readWaitTime 1
set_interface_property avalonmm2jtaguart setupTime 0
set_interface_property avalonmm2jtaguart timingUnits Cycles
set_interface_property avalonmm2jtaguart writeWaitTime 0
set_interface_property avalonmm2jtaguart ENABLED true

add_interface_port avalonmm2jtaguart avm_m0_readdata readdata Input 32
add_interface_port avalonmm2jtaguart avm_m0_waitrequest waitrequest Input 1
add_interface_port avalonmm2jtaguart avm_m0_writedata writedata Output 32
add_interface_port avalonmm2jtaguart avm_m0_address address Output 3
add_interface_port avalonmm2jtaguart avm_m0_read read Output 1
add_interface_port avalonmm2jtaguart avm_m0_write write Output 1

