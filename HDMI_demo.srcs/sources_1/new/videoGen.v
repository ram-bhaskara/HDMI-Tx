`timescale 1ns / 1ps

module videoGen(
	input clk,
	output reg vSync,
	output reg hSync,
	output reg drawArea,
	output reg[7:0] red,
	output reg [7:0] green,
	output reg [7:0] blue
);

/*
	For 640x480 60Hz */

localparam LINES 	    = 480;
localparam LINES_FRONT 	= 10;
localparam LINES_SYNC 	= 2;
localparam LINES_BACK 	= 33;
localparam LINES_ALL	= (LINES + LINES_FRONT + LINES_SYNC + LINES_BACK);

localparam PIXELS 			= 650;
localparam PIXELS_FRONT 	= 16;
localparam PIXELS_SYNC 	= 96;
localparam PIXELS_BACK 	= 48;
localparam PIXELS_ALL		= (PIXELS + PIXELS_FRONT + PIXELS_SYNC + PIXELS_BACK);

reg [9:0] counterX, counterY;

always@(posedge clk) 
	drawArea <= ((counterY > (LINES_SYNC + LINES_BACK)) && (counterY < (LINES_ALL - LINES_FRONT)) 
				&& (counterX > (PIXELS_SYNC + PIXELS_BACK)) && (counterX < (PIXELS_ALL - PIXELS_FRONT)));

always@(posedge clk) 
	counterX <= (counterX == PIXELS_ALL) ? 1'b1 : counterX + 1'b1;
	
always@(posedge clk) 
	if(counterX == PIXELS_ALL) 
		counterY <= (counterY == LINES_ALL) ? 1'b1 : counterY + 1'b1;

always@(posedge clk) 
	hSync <= (counterX < PIXELS_SYNC);
	
always@(posedge clk) 
	vSync <= (counterY < LINES_SYNC);
	

/*
	Here is a code to generate red, green and blue colors.
	You can modify this code to generate whatever you want. 
*/	

reg [2:0] index = 3'b000;
reg [2:0] rgb = 3'b000;

always@(posedge clk)
	begin
		if (drawArea)
			begin
				index <= index + 1'b1;
				if (index == 3'b111) 
					rgb <= rgb + 1'b1;
			end
		else
			begin
				rgb <= 3'b000;
				index <= 3'b000;
			end
	end

always@(posedge clk)
	begin
		if (rgb[0] == 1)
			red <= 8'b11111111;
		else
			red <= 8'b00000000;
	end
	
always@(posedge clk)
	begin
		if (rgb[1] == 1)
			green <= 8'b11111111;
		else
			green <= 8'b00000000;
	end

always@(posedge clk)
	begin
		if (rgb[2] == 1)
			blue <= 8'b11111111;
		else
			blue <= 8'b00000000;
	end

endmodule 
