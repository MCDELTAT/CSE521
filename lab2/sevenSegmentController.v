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
	output wire sel1, sel2, sel3, sel4,
	output wire segA, segB, segC, segD, segE, segF, segG, segDP
);

assign {segA, segB, segC, segD, segE, segF, segG, segDP} = 8'b00100101;
assign {sel1, sel2, sel3, sel4} = 4'b0111;

endmodule
