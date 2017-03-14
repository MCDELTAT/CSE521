//Listing 8.1
module uart_rx
   #(
     parameter DBIT = 8,     // # data bits
               SB_TICK = 16  // # ticks for stop bits
   )
   (
    input wire clk, reset,
    input wire rx, s_tick,
    output reg rx_done_tick,
    output wire [7:0] dout,
	 output reg parityMatch
   );

   // symbolic state declaration
   localparam [2:0]
      idle  = 3'b000,
      start = 3'b001,
      data  = 3'b010,
      parityCheck  = 3'b011,
		stop = 3'b100;

   // signal declaration
   reg [1:0] state_reg, state_next;
   reg [3:0] s_reg, s_next;
   reg [2:0] n_reg, n_next;
   reg [7:0] b_reg, b_next;
	reg dataParity_reg, dataParity_next;
	reg parity;

   // body
   // FSMD state & data registers
   always @(posedge clk, posedge reset)
      if (reset)
         begin
            state_reg <= idle;
            s_reg <= 0;
            n_reg <= 0;
            b_reg <= 0;
				dataParity_reg <= 0;
				parity <= 0;
         end
      else
         begin
            state_reg <= state_next;
            s_reg <= s_next;
            n_reg <= n_next;
            b_reg <= b_next;
				dataParity_reg <= dataParity_next;
         end

   // FSMD next-state logic
   always @*
   begin
      state_next = state_reg;
      rx_done_tick = 1'b0;
      s_next = s_reg;
      n_next = n_reg;
      b_next = b_reg;
		// add dataParity here?
      case (state_reg)
         idle:
            if (~rx)
               begin
                  state_next = start;
                  s_next = 0;
               end
         start:
            if (s_tick)
               if (s_reg==7)
                  begin
                     state_next = data;
                     s_next = 0;
                     n_next = 0;
                  end
               else
                  s_next = s_reg + 1;
         data:
            if (s_tick)
               if (s_reg==15)
                  begin
                     s_next = 0;
                     b_next = {rx, b_reg[7:1]};
							dataParity_next = dataParity_reg ^ rx;
                     if (n_reg==(DBIT-1))
                        state_next = parityCheck;
                      else
                        n_next = n_reg + 1;
                   end
               else
                  s_next = s_reg + 1;
			parityCheck: 
				if (s_tick)
					if (s_reg==15)
						begin
							s_next = 0;
							parity = rx;
							// compare internal signals here and set flag for top module
							if (dataParity_reg != parity)
								parityMatch = 1'b1; //they don't match, set seven seg off
							else
								parityMatch = 1'b0;
							state_next = stop;
						end
					else
						s_next = s_reg + 1;
         stop:
            if (s_tick)
               if (s_reg==(SB_TICK-1))
                  begin
                     state_next = idle;
                     rx_done_tick =1'b1;
                  end
               else
                  s_next = s_reg + 1;
      endcase
   end
   // output
   assign dout = b_reg;

endmodule