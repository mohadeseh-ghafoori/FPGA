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
module UART_rec(
	 input clk,
    input rx,
    input write_start,
	 output reg [7:0] data=0,
    output reg data_valid=0,
    output reg [9:0] addr=0
    );

    reg [9:0] register=10'b1111111111;
	 reg [7:0] matrix [1023:0];
	 reg [3:0] cnt=0;
	 reg [10:0] counter=0;
	 reg [10:0] i=0;
	 reg start=0;
always @(posedge clk) begin
    
    if(counter<1024) begin
	     if(cnt<10) begin
	        register <= {rx,register[9:1]};
	        cnt<=cnt+1;	 
	     end
	     else if ( cnt==10 ) begin
	         cnt<=0;
	         counter<=counter+1;
	         register<=10'b1111111111;
	         if ( register[9]==1 & register[0]==0) begin
	                matrix[counter]<= register[8:1];
	         end
	      end
	 end
	     if(write_start) start<=1;
	 if ( start && counter==1024 ) begin
			 if( i<1024 ) begin
			     addr<=i;
			     data<=matrix[i];
				  i<=i+1;
				  data_valid<=1;
			 end
	       else if( i==1024 ) begin
			       i<=0;
			       counter<=0;
					 data_valid<=0;
					 data<=8'bzzzzzzzz;
			 end
	 end
	 
end	 

	 
	 
	 


endmodule
