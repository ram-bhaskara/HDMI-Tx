`timescale 1ns / 1ps

module clockDivider
#(parameter N=10) //divide the clock by 10
(
	input in,
	output reg out
);

reg [15:0] counter = 1;

always@(posedge in)
	begin
		counter <= counter + 1;
		if (counter == (N / 2))
			begin
				counter <= 1;
				out <= ~out;
			end
	end

endmodule 

