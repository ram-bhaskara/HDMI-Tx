`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2020 07:04:11 PM
// Design Name: 
// Module Name: DifferentialSignal
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


module DifferentialSignal(

	input in,
	output reg p,
	output reg n
);

always@*
	begin
		if (in == 1)
			begin
				p <= 1;
				n <= 0;
			end
		else
			begin
				p <= 0;
				n <= 1;
			end
	end
	

endmodule 