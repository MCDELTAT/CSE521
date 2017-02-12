`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:36:47 02/11/2017
// Design Name:   counter
// Module Name:   /home/aaron/Git Repos/CSE521/lab2/counter_tb.v
// Project Name:  lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_tb;

	// Inputs
	reg clk;
	reg en;
	reg dir;

	// Outputs
	wire [2:0] count;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.clk(clk), 
		.en(en), 
		.dir(dir), 
		.count(count)
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

