# TCL File Generated by Component Editor 12.1
# Wed Dec 19 18:03:21 GMT 2012
# DO NOT MODIFY


# 
# ISP1761 "ISP1761 USB Interface" v1.0
# Richard Chang 2012.12.19.18:03:21
# ISP1761 Interface
# 

# 
# request TCL package from ACDS 12.1
# 
package require -exact qsys 12.1


# 
# module ISP1761
# 
set_module_property DESCRIPTION "ISP1761 Interface"
set_module_property NAME ISP1761
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Terasic Technologies Inc."
set_module_property AUTHOR "Richard Chang"
set_module_property DISPLAY_NAME "ISP1761 USB Interface"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# file sets
# 
add_fileset quartus_synth QUARTUS_SYNTH "" "Quartus Synthesis"
set_fileset_property quartus_synth TOP_LEVEL ISP1761_IF
set_fileset_property quartus_synth ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file ISP1761_IF.v VERILOG PATH ISP1761_IF.v

add_fileset sim_verilog SIM_VERILOG "" "Verilog Simulation"
set_fileset_property sim_verilog TOP_LEVEL ISP1761_IF
set_fileset_property sim_verilog ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file ISP1761_IF.v VERILOG PATH ISP1761_IF.v


# 
# parameters
# 


# 
# display items
# 


# 
# connection point usb
# 
add_interface usb conduit end
set_interface_property usb associatedClock ""
set_interface_property usb associatedReset ""
set_interface_property usb ENABLED true

add_interface_port usb WR_N export Output 1
add_interface_port usb RD_N export Output 1
add_interface_port usb D export Bidir 32
add_interface_port usb A export Output 17
add_interface_port usb DC_IRQ export Input 1
add_interface_port usb HC_IRQ export Input 1
add_interface_port usb DC_DREQ export Input 1
add_interface_port usb HC_DREQ export Input 1
add_interface_port usb DC_DACK export Output 1
add_interface_port usb HC_DACK export Output 1
add_interface_port usb CS_N export Output 1


# 
# connection point slave
# 
add_interface slave avalon end
set_interface_property slave addressAlignment NATIVE
set_interface_property slave addressUnits WORDS
set_interface_property slave associatedClock clock
set_interface_property slave associatedReset clock_reset
set_interface_property slave bitsPerSymbol 8
set_interface_property slave burstOnBurstBoundariesOnly false
set_interface_property slave burstcountUnits WORDS
set_interface_property slave explicitAddressSpan 0
set_interface_property slave holdTime 10
set_interface_property slave linewrapBursts false
set_interface_property slave maximumPendingReadTransactions 0
set_interface_property slave readLatency 0
set_interface_property slave readWaitStates 40
set_interface_property slave readWaitTime 40
set_interface_property slave setupTime 10
set_interface_property slave timingUnits Nanoseconds
set_interface_property slave writeWaitStates 20
set_interface_property slave writeWaitTime 20
set_interface_property slave ENABLED true

add_interface_port slave s_address address Input 16
add_interface_port slave s_write_n write_n Input 1
add_interface_port slave s_writedata writedata Input 32
add_interface_port slave s_read_n read_n Input 1
add_interface_port slave s_readdata readdata Output 32
add_interface_port slave s_cs_n chipselect_n Input 1
set_interface_assignment slave embeddedsw.configuration.isFlash 0
set_interface_assignment slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point interrupt_sender_hc
# 
add_interface interrupt_sender_hc interrupt end
set_interface_property interrupt_sender_hc associatedAddressablePoint slave
set_interface_property interrupt_sender_hc associatedClock clock
set_interface_property interrupt_sender_hc associatedReset clock_reset
set_interface_property interrupt_sender_hc ENABLED true

add_interface_port interrupt_sender_hc s_hc_irq irq_n Output 1


# 
# connection point slave_dc_irq
# 
add_interface slave_dc_irq avalon end
set_interface_property slave_dc_irq addressUnits WORDS
set_interface_property slave_dc_irq associatedClock clock
set_interface_property slave_dc_irq associatedReset clock_reset
set_interface_property slave_dc_irq bitsPerSymbol 8
set_interface_property slave_dc_irq burstOnBurstBoundariesOnly false
set_interface_property slave_dc_irq burstcountUnits WORDS
set_interface_property slave_dc_irq explicitAddressSpan 0
set_interface_property slave_dc_irq holdTime 0
set_interface_property slave_dc_irq linewrapBursts false
set_interface_property slave_dc_irq maximumPendingReadTransactions 0
set_interface_property slave_dc_irq readLatency 0
set_interface_property slave_dc_irq readWaitStates 0
set_interface_property slave_dc_irq readWaitTime 0
set_interface_property slave_dc_irq setupTime 0
set_interface_property slave_dc_irq timingUnits Cycles
set_interface_property slave_dc_irq writeWaitTime 0
set_interface_property slave_dc_irq ENABLED true

add_interface_port slave_dc_irq s_dc_readdata readdata Output 32
set_interface_assignment slave_dc_irq embeddedsw.configuration.isFlash 0
set_interface_assignment slave_dc_irq embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment slave_dc_irq embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment slave_dc_irq embeddedsw.configuration.isPrintableDevice 0


# 
# connection point interrupt_sender_dc
# 
add_interface interrupt_sender_dc interrupt end
set_interface_property interrupt_sender_dc associatedAddressablePoint slave_dc_irq
set_interface_property interrupt_sender_dc associatedClock clock
set_interface_property interrupt_sender_dc associatedReset clock_reset
set_interface_property interrupt_sender_dc ENABLED true

add_interface_port interrupt_sender_dc s_dc_irq irq_n Output 1


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true

add_interface_port clock csi_clk clk Input 1


# 
# connection point clock_reset
# 
add_interface clock_reset reset end
set_interface_property clock_reset associatedClock clock
set_interface_property clock_reset synchronousEdges DEASSERT
set_interface_property clock_reset ENABLED true

add_interface_port clock_reset csi_reset_n reset_n Input 1

