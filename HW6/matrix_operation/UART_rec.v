`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:24:16 06/11/2020 
// Design Name: 
// Module Name:    UART_rec 
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
module UART_trans(
    input clk,
    input finish,
	 input [7:0] data,
    input data_valid,
    output reg [9:0] addr=0,
    output tx,
	 output reg busy=0,
	 output reg transmit_output=0
    );
	 
	 reg [9:0] shift_reg=10'b111111111;
	 reg [3:0] cnt=0;
	 reg [10:0] counter=1024;
	 always @(posedge clk) begin
	   transmit_output<=0;
	   if(finish) begin
       		counter<=0;
				transmit_output<=1;
				addr<=0;
		end
	   if(counter<1024) begin
	        if(data_valid && busy==0) begin
	            shift_reg<={1,data,0};
		         busy<=1;
		         cnt<=0;
	        end
	 
	        else  begin
	            shift_reg<={1'b1,shift_reg[9:1]};
	            cnt<=cnt+1;
	        end
	        if ( cnt==9 ) begin
	             busy<=0;
	             cnt<=0;
					 addr<=addr+1;
					 counter<=counter+1;
	             shift_reg<=10'b111111111;
	        end
	  end
	 end
    
	 assign tx=shift_reg[0];
	 
	 
	 


endmodule
