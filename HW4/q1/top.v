`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:19:47 05/06/2020 
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
    output [3:0] data_out,
    output data_valid_out,
    input data_valid,
    input [3:0] data,
    input clk
    );
    wire [3:0] data_io;
	 wire io_select,clk_out;
	  Q1_1 q1( data_out , data_io , io_select , clk_out , data_valid_out , data , clk, data_valid );
	  Q1_2 q2( data_io , clk_out, io_select );

endmodule
