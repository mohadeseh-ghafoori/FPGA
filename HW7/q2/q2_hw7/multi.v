`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:10:12 07/08/2020 
// Design Name: 
// Module Name:    multi 
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
module multi(
    output reg [31:0] out,
    input [15:0] x,
    input [15:0] y,
    input clk
    );
       
    reg [15:0] x_reg,y_reg,u,v,w,z,y2,y3;
    reg [7:0] A,B,C,D;
    reg [16:0] sum1;
    reg [31:0] sum2,y1;	 
    always @(posedge clk)begin
	    x_reg<=x;
	    y_reg<=y;
	 end
	 always @(posedge clk) begin
	 A<=x_reg[15:8];
	 B<=x_reg[7:0];   
	 C<=y_reg[15:8];
	 D<=y_reg[7:0];
	 end
	 always @(posedge clk) begin
	 u<=A*C;
	 v<=B*D;
	 w<=A*D;
	 z<=B*C;
	 end
	 always @(posedge clk) begin
	 y1<={u,v};
	 y2<=w<<8;
	 y3<=z<<8;
	 end 
	 always @(posedge clk) begin
	 sum1<=y2+y3;
	 sum2<=y1;
	 end
	 always @(posedge clk) begin 
		 out<=sum1+sum2;  
	 end
	 

endmodule
