#input a
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { a[2] }]; 
set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { a[1] }]; 
set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { a[0] }]; 
#input b
set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { b[2] }]; 
set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { b[1] }]; 
set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { b[0] }]; 
#input fun 
set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { fun[1] }]; 
set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { fun[0] }]; 
#Led
set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { s }]; 
set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { y[2] }]; 
set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { y[1] }]; 
set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { y[0] }]; 
