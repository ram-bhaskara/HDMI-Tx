set_property SRC_FILE_INFO {cfile:C:/Users/Ram/Documents/FPGA/HDMI_demo/HDMI_demo.srcs/constrs_1/imports/new/Zybo_XDC.xdc rfile:../../../HDMI_demo.srcs/constrs_1/imports/new/Zybo_XDC.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:8 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { sysclk }]; #IO_L12P_T1_MRCC_35 Sch=sysclk
set_property src_info {type:XDC file:1 line:100 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H17   IOSTANDARD TMDS_33     } [get_ports { clkn }]; #IO_L13N_T2_MRCC_35 Sch=hdmi_tx_clk_n
set_property src_info {type:XDC file:1 line:101 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN H16   IOSTANDARD TMDS_33     } [get_ports { clkp }]; #IO_L13P_T2_MRCC_35 Sch=hdmi_tx_clk_p
set_property src_info {type:XDC file:1 line:102 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D20   IOSTANDARD TMDS_33     } [get_ports { datan[0] }]; #IO_L4N_T0_35 Sch=hdmi_tx_n[0]
set_property src_info {type:XDC file:1 line:103 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN D19   IOSTANDARD TMDS_33     } [get_ports { datap[0] }]; #IO_L4P_T0_35 Sch=hdmi_tx_p[0]
set_property src_info {type:XDC file:1 line:104 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B20   IOSTANDARD TMDS_33     } [get_ports { datan[1] }]; #IO_L1N_T0_AD0N_35 Sch=hdmi_tx_n[1]
set_property src_info {type:XDC file:1 line:105 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN C20   IOSTANDARD TMDS_33     } [get_ports { datap[1] }]; #IO_L1P_T0_AD0P_35 Sch=hdmi_tx_p[1]
set_property src_info {type:XDC file:1 line:106 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN A20   IOSTANDARD TMDS_33     } [get_ports { datan[2] }]; #IO_L2N_T0_AD8N_35 Sch=hdmi_tx_n[2]
set_property src_info {type:XDC file:1 line:107 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN B19   IOSTANDARD TMDS_33     } [get_ports { datap[2] }]; #IO_L2P_T0_AD8P_35 Sch=hdmi_tx_p[2]
