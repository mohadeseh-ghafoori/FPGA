`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:56:57 05/06/2020 
// Design Name: 
// Module Name:    top 
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
module top(
    output reg [7:0] data_out=0,
    output reg  data_valid_out=0,
    output  clk_100,
    output  clk_250,
	 output empty,
	 output full,
	 output locked,
    input [7:0] data_in,
    input data_valid,
    input clk_in,
    input reset
    );
	 
	 wire copy_clk100,copy_clk250;
	 wire [7:0] dout;
	 reg [9:0] register=0;
	 reg [2:0] cnt=0;
	 assign clk_100=copy_clk100;
	 assign clk_250=copy_clk250;
	 
	   my_dcm dcm
   (// Clock in ports
    .CLK_IN1(clk_in),      // IN
    // Clock out ports
    .CLK_OUT1(copy_clk100),     // OUT
    .CLK_OUT2(copy_clk250),     // OUT
    // Status and control signals
    .RESET(reset),// IN
    .LOCKED(locked));      // OUT
	 
	 my_fifo fifo (
  .rst(~locked), // input rst
  .wr_clk(copy_clk250), // input wr_clk
  .rd_clk(copy_clk100), // input rd_clk
  .din(data_in), // input [7 : 0] din
  .wr_en(data_valid), // input wr_en
  .rd_en(~empty), // input rd_en
  .dout(dout), // output [7 : 0] dout
  .full(full), // output full
  .empty(empty) // output empty
   );
   
	always @(posedge copy_clk100) begin
	       data_valid_out<=0;
			 
			if( reset==0 ) begin
	       if ( empty==0 &&  cnt<5 ) begin 
			     register<=register+dout;
				  cnt<=cnt+1;
			 end
	       if (cnt==5) begin
			     data_out<=register/4;
				  cnt<=0;
			     data_valid_out<=1;
				  register<=0;
			 end
	     end
	     else begin 
		  register<=0;
		  cnt<=0;
		  data_out<=0;
		  data_valid_out<=0;
		  end
	     
	
	end

endmodule
