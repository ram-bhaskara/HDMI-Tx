`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ram
// 
// Create Date: 04/16/2020 06:33:02 PM
// Design Name: 
// Module Name: HDMI_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module HDMI_top(
input sysclk,
    output [2:0] datap,
	output [2:0] datan,
	output clkp,
	output clkn
    );
    
    wire pxl_clk; //250 Mhz clock for TMDS shift operation
    wire clk_25Mhz; //25Mhz clock as TMDS clock
    wire hSync, vSync, drawArea;
    wire [7:0] red, green, blue;
    wire [9:0] TMDSRed, TMDSGreen, TMDSBlue;
    wire [9:0] TMDSShiftRed, TMDSShiftGreen, TMDSShiftBlue;
   
    clk_wiz_0 clk_inst_0
   (
    // Clock out ports
    .clk_out1(pxl_clk),     // output clk_out1
   // Clock in ports
    .clk_in1(sysclk));   
    
    clockDivider div_10(
    .in(pxl_clk),
    .out(clk_25Mhz));
    
    videoGen video_inst(
    .clk(clk_25Mhz),
	.vSync(vSync),
	.hSync(hSync),
	.drawArea(drawArea),
	.red(red),
	.green(green),
	.blue(blue));
	
	TMDSEncoder TMDSR
(
	.clk(clk_25Mhz), 
	.VD(red), 
	.CD(2'b00), 
	.VDE(drawArea), 
	.TMDS(TMDSRed)
);

TMDSEncoder TMDSG
(
	.clk(clk_25Mhz), 
	.VD(green), 
	.CD(2'b00), 
	.VDE(drawArea), 
	.TMDS(TMDSGreen)
);

TMDSEncoder TMDSB
(
	.clk(clk_25Mhz), 
	.VD(blue), 
	.CD({vSync, hSync}), 
	.VDE(drawArea), 
	.TMDS(TMDSBlue)
);

ShiftRegister SR0
(
	.clk(pxl_clk),
	.in(TMDSRed),
	.out(TMDSShiftRed)
);

ShiftRegister SR1
(
	.clk(pxl_clk),
	.in(TMDSGreen),
	.out(TMDSShiftGreen)
);

ShiftRegister SR2
(
	.clk(pxl_clk),
	.in(TMDSBlue),
	.out(TMDSShiftBlue)
);

//differential signals
OBUFDS OBUFDS_red  (.I(TMDSShiftRed  [0]), .O(datap[2]), .OB(datan[2]));
OBUFDS OBUFDS_green(.I(TMDSShiftGreen[0]), .O(datap[1]), .OB(datan[1]));
OBUFDS OBUFDS_blue (.I(TMDSShiftBlue [0]), .O(datap[0]), .OB(datan[0]));
OBUFDS OBUFDS_clock(.I(clk_25Mhz), .O(clkp), .OB(clkn)); 
    
endmodule
