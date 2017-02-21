`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:54 02/20/2017 
// Design Name: 
// Module Name:    rotate_fsm 
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
module rotate_fsm(
    input wire clk,
	 input wire [2:0] state,
	 output reg [7:0] data,
	 output reg [3:0] display_enable
);

always @(posedge clk)
	case(state)
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
