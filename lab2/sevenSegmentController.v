`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:08 01/31/2017 
// Design Name: 
// Module Name:    sevenSegmentController 
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
module sevenSegmentController(
	input wire clk, en, dir,
	output reg [3:0] display_enable,
	output reg [7:0] data 
);

wire new_clock;
reg [2:0] count = 3'b000;

freq_divider freq1 (
	.clk (clk),
	.new_clk (new_clock)
);

// Insert a frequency divider here as needed
always @(posedge new_clock)
	if (en)
		if (!dir)
			//increment until full saturation, then reset to zero
			count = (count==3'b111) ? 0:(count+1);
		else if (dir)
			//decrement until no saturation, then reset to full saturation
			count = (count==3'b000) ? 3'b111:(count-1);

always @(posedge new_clock)
	case(count)
		3'b000 : begin
						data = 8'b00111001; // top box
						display_enable = 4'b0111;
					end	
		3'b001 : begin
						data = 8'b00111001; // top box
						display_enable = 4'b1011;
					end	
		3'b010 : begin
						data = 8'b00111001; // top box
						display_enable = 4'b1101;
					end	
		3'b011 : begin
						data = 8'b00111001; // top box
						display_enable = 4'b1110;
					end	
		3'b100 : begin
						data = 8'b11000101; // bottom box
						display_enable = 4'b1110;
					end	
		3'b101 : begin
						data = 8'b11000101; // bottom box
						display_enable = 4'b1101;
					end	
		3'b110 : begin
						data = 8'b11000101; // bottom box
						display_enable = 4'b1011;
					end	
		3'b111 : begin
						data = 8'b11000101; // bottom box
						display_enable = 4'b0111;
					end	
	endcase

endmodule
