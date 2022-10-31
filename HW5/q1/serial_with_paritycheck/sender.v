`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:01:28 05/27/2020 
// Design Name: 
// Module Name:    sender 
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
module sender(
    input [3:0] in,
	 input clk,
	 input TX_send,
    output out,
	 output reg busy=0
    );
    
	
	 reg [6:0] data_frame=7'b0000000;
	 reg [8:0] shift_reg=9'b111111111;
	 reg [3:0] cnt=0;
	 always @(posedge clk) begin
	 if(TX_send && busy==0) begin
	     calculating_parity(data_frame,in);
	     shift_reg<={1'b1,data_frame,1'b0};
		  busy<=1;
		  cnt<=0;
	end
	 
	 else  begin
	   shift_reg<={1'b1,shift_reg[8:1]};
	   cnt<=cnt+1;
	end
	if ( cnt==9 ) begin
	   busy<=0;
	   cnt<=0;
	   shift_reg<=9'b111111111;
	end
	
	 end
    
	 assign out=shift_reg[0];

    
	automatic task calculating_parity ;
	 output [6:0] data_frame;
	 input [3:0] in;
	 reg p0,p1,p3=0;
	 begin 
	 p0=in[0]^in[1]^in[3];
	 p1=in[0]^in[2]^in[3];
	 p3=in[1]^in[2]^in[3];
	 data_frame={in[3],in[2],in[1],p3,in[0],p1,p0};
	 end
	 endtask





endmodule
