`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:41:09 04/29/2020 
// Design Name: 
// Module Name:    Q1_1 
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
module Q1_1(
    output reg [3:0] data_out=0,
    inout [3:0] data_io,
    output reg io_select=1,
    output clk_out,
    output reg  data_valid_out=0,
    input [3:0] data,
    input clk,
    input data_valid
    );
    reg flag=0;
	 assign clk_out=clk;
	 //assign data_valid_out=data_valid;
    assign data_io= ( io_select )? data: 4'bzzzz ;
	 always @(posedge clk) begin
	     data_valid_out<=0;
	   if( data_out===4'bxxxx) data_out<=0;
	   if ( data_valid==1 ) begin 
		    flag<=1;
			 io_select<=1;
		end
		
	   if ( flag==1 && io_select==1 ) begin 
		    flag<=0;
			 io_select<=0;
		end
		
	   if( io_select==0) begin
		    data_out<=data_io;
			 data_valid_out<=~io_select;
			 io_select<=1;
		end
	 end
	 
	 

endmodule
