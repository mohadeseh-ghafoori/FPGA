`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:34 04/29/2020 
// Design Name: 
// Module Name:    Q1_2 
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
module Q1_2(
    inout [3:0] data_io,
    input clk,
    input io_select
    );
    reg [3:0] register;
	 always @(posedge clk) begin 
	     if( io_select==1) register<= data_io; 

	 end
	 assign data_io= ( io_select==0 ) ? (register ^ 4'b1010) : 4'bzzzz;
	 

endmodule
