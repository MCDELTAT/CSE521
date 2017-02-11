`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:27:38 02/07/2017 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
	input wire clk,
	input wire en,
	input wire dir, //0 is CW, 1 is counterCW
	output reg [2:0] count // 8 states
);

always @(posedge clk)
	if (en)
		if (!dir)
			//increment until full saturation, then reset to zero
			count = (count==3'b111) ? 0:(count+1);
		else if (dir)
			//decrement until no saturation, then reset to full saturation
			count = (count==3'b000) ? 3'b111:(count-1);		

endmodule
