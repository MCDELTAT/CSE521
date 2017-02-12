`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:08:42 02/11/2017
// Design Name:   sevenSegmentController
// Module Name:   /home/aaron/Git Repos/CSE521/lab2/sevenSegmentController_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sevenSegmentController
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sevenSegmentController_tb;

	// Inputs
	reg clk;
	reg en;
	reg dir;

	// Outputs
	wire [3:0] display_enable;
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	sevenSegmentController uut (
		.clk(clk), 
		.en(en), 
		.dir(dir), 
		.display_enable(display_enable), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		en = 0;
		dir = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		en = 1;
		
		forever begin
			#10 clk = ~clk;
		end	
	end
      
endmodule

