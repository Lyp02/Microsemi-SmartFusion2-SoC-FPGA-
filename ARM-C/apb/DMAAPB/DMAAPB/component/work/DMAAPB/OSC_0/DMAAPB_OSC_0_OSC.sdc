set_component DMAAPB_OSC_0_OSC
# Microsemi Corp.
# Date: 2018-Jun-10 08:46:53
#

create_clock -ignore_errors -period 20 [ get_pins { I_RCOSC_25_50MHZ/CLKOUT } ]
