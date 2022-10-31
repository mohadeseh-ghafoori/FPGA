`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:05:42 04/02/2020 
// Design Name: 
// Module Name:    uart 
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
module uart(
    output reg data_valid,
    output reg [7:0] data_out,
    input clk,
    input Rx
    );
    reg [9:0] register=10'b1111111111;
	 reg [3:0] cnt=0;
	 always @(posedge clk) begin
	 cnt<=cnt+1;
	 if(cnt<11) begin
	 register <= {Rx,register[9:1]};
	 if ( register[9]==1 & register[0]==0) begin
	 data_out <= register[8:1];
	 data_valid=1;
	 end
	 end
	 else begin
	 cnt<=0;
	 register<=10'b1111111111;
	 data_out<=8'bzzzzzzzz;
	 data_valid<=0;
	end
	 end
	 
	 
	 

endmodule
