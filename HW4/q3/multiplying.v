`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:04:36 04/30/2020 
// Design Name: 
// Module Name:    multiplying 
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
module multiplying(
    output reg [15:0] c=0,
    input [7:0] a,
    input [7:0] b,
    input clk,
    input start_multiply,
    input start_initialize
    );
    reg [7:0] aprim [63:0];
	 reg [7:0] bprim [63:0];
	 reg [15:0] cprim [63:0]; 
	 reg [6:0] cnt=0;
	 reg [6:0] k=0;
	 reg [6:0] cnt1=0;
	 reg start_init=0;
	 reg start_multi=0;
	 initial begin
	 
	 	     for (k=0;k<64;k=k+1) begin
	          aprim[k][7:0]<=0;
	          bprim[k][7:0]<=0;
				 cprim[k][15:0]<=0;
	      end
	 
	 end
	 
	 
	 always @(posedge clk) begin
	 
	     if( start_initialize ==1 ) start_init<=start_initialize;
	     if( cnt<64 && (start_init==1) ) begin
		       aprim[cnt]<=a;
				 bprim[cnt]<=b;
				 cnt<=cnt+1;
		  end
		  if( cnt==63 ) begin
		      start_init<=1'b0;
		      cnt<=0;	
		  end
		  if ( start_multiply==1 ) start_multi<=start_multiply;
		  if ( cnt1< 64 && (start_multi==1)) begin
		      cprim[cnt1]<=aprim[cnt1]*bprim[cnt1];
				c<=aprim[cnt1]*bprim[cnt1];
				cnt1<=cnt1+1;
		  end
		  if(cnt1==63) begin
		      start_multi<=1'b0;
		      cnt1<=0;
		  end
	 end
	 
	 
	 

endmodule
