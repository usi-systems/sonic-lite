QUARTUS_SH=$(shell which quartus_sh)
ROOTDIR=$(realpath .)
CONNECTALDIR?=$(ROOTDIR)/../../../../connectal/
IPDIR?=$(ROOTDIR)/../../../../fpgamake-cache/$(shell basename `/bin/pwd`)/
PROJTOP?=$(ROOTDIR)

CONNECTALFLAGS += --bscflags="+RTS -K46777216 -RTS -demote-errors G0066:G0045 -suppress-warnings G0046:G0020:S0015:S0080:S0039 -steps-max-intervals 20"
CONNECTALFLAGS += --bsvpath=$(PROJTOP)/../../../hw/bsv
CONNECTALFLAGS += --bsvpath=$(PROJTOP)/../../../hw/generated
CONNECTALFLAGS += --bsvpath=$(PROJTOP)/../../../p4/examples/tdm/

S2H_INTERFACES=DtpRequest:DtpMacTop.request1 
H2S_INTERFACES=DtpMacTop:DtpIndication
AUTOTOP= --interface pins:DtpMacTop.pins
PIN_TYPE=DE5Pins
PIN_TYPE_INCLUDE=DE5Pins
BSVFILES=$(PROJTOP)/DtpMacTop.bsv $(PROJTOP)/../../../hw/bsv/DtpController.bsv
CPPFILES=$(PROJTOP)/test-dtp.cpp
PINOUT_FILE=../../../boards/de5.json
PIN_BINDINGS?=PCIE:PCIE LED:LED OSC:OSC SFPA:SFPA SFPB:SFPB SFPC:SFPC SFPD:SFPD SFP:SFP I2C:I2C BUTTON:BUTTON

CONNECTALFLAGS += --nocache
CONNECTALFLAGS += --tcl=$(PROJTOP)/mkDtpTop.sdc
CONNECTALFLAGS += --constraint=$(PROJTOP)/mkDtpTop.sdc
CONNECTALFLAGS += --implconstraint=$(PROJTOP)/mkDtpTop.sdc
CONNECTALFLAGS += --xci=$(IPDIR)/$(BOARD)/synthesis/mac_10gbe.qip # To be removed.
CONNECTALFLAGS += --xci=$(IPDIR)/$(BOARD)/synthesis/pll_156/altera_pll_156.qip
CONNECTALFLAGS += --xci=$(IPDIR)/$(BOARD)/synthesis/sv_10g_pma/sv_10g_pma.qip
CONNECTALFLAGS += --xci=$(IPDIR)/$(BOARD)/synthesis/altera_clkctrl/altera_clkctrl.qip
CONNECTALFLAGS += --verilog=$(PROJTOP)/../../../hw/verilog/si570/
CONNECTALFLAGS += --verilog=$(PROJTOP)/../../../hw/verilog/
CONNECTALFLAGS += --chipscope=$(PROJTOP)/mkDtpTop.stp

CONNECTALFLAGS += -D DtpVersion=$(shell printf "%d" 0x`git rev-parse --short=8 HEAD`)
CONNECTALFLAGS += -D PcieHostIF
CONNECTALFLAGS += -D DataBusWidth=128
CONNECTALFLAGS += -D DEBUG_ETH
ifneq (, $(BLUESIM))
CONNECTALFLAGS += --pinfo=$(PROJTOP)/../../../boards/dtp_synth.json
endif

prebuild::
ifneq (, $(QUARTUS_SH))
	(cd $(BOARD); BUILDCACHE_CACHEDIR=$(BUILDCACHE_CACHEDIR) $(BUILDCACHE) $(QUARTUS_SH) -t $(CONNECTALDIR)/scripts/connectal-synth-pll.tcl)
	(cd $(BOARD); BUILDCACHE_CACHEDIR=$(BUILDCACHE_CACHEDIR) $(BUILDCACHE) $(QUARTUS_SH) -t $(PROJTOP)/../../../hw/scripts/generate-mac.tcl)
	(cd $(BOARD); BUILDCACHE_CACHEDIR=$(BUILDCACHE_CACHEDIR) $(BUILDCACHE) $(QUARTUS_SH) -t $(CONNECTALDIR)/scripts/connectal-synth-eth.tcl)
	(cd $(BOARD); BUILDCACHE_CACHEDIR=$(BUILDCACHE_CACHEDIR) $(BUILDCACHE) $(QUARTUS_SH) -t $(PROJTOP)/../../../hw/scripts/connectal-synth-pma.tcl)
	(cd $(BOARD); BUILDCACHE_CACHEDIR=$(BUILDCACHE_CACHEDIR) $(BUILDCACHE) $(QUARTUS_SH) -t $(PROJTOP)/../../../hw/scripts/connectal-synth-misc.tcl)
endif

include $(CONNECTALDIR)/Makefile.connectal
