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
	output wire [3:0] display_enable,
	output wire [7:0] data
);

wire new_clock;
wire [2:0] state;

freq_divider freq1 (
	.clk (clk),
	.new_clk (new_clock)
);

counter count1 (
	.clk (new_clock),
	.en (en),
	.dir (dir),
	.count (state)
);

rotate_fsm fsm1(
	.clk (new_clock),
	.state (state),
	.data (data),
	.display_enable (display_enable)
);

endmodule
