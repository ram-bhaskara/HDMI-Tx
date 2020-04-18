`timescale 1ns / 1ps

//serializer

module ShiftRegister
#(parameter N=10)
(

	input clk,
	input [N-1:0] in,
	output reg [N-1:0] out
);

reg [10:0] counter = 1;

always@(posedge clk)
	begin
		counter <= counter + 1;
		if (counter == N)
			counter <= 1;
	end
	
always@(posedge clk)
	out <= (counter == N) ? in : out[N-1:1]; //https://www.youtube.com/watch?v=AEU9bvpzas8
	
endmodule

