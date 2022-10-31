`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:34 05/28/2020 
// Design Name: 
// Module Name:    fsm 
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
module fsm(
    output reg out=0,
    input [1:0] in,
    input clk
    );

    reg [2:0] next_state, present_state=0;
    parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100,s5=3'b101;
	 
	 always @( posedge clk ) present_state <= next_state;

    always @(present_state or in) begin
	      case ( present_state ) 
	      s0 : begin 
			     if ( in==2'b00 || in==2'b11) next_state=s0;
	           if( in==2'b01 ) next_state=s2;
	           if( in==2'b10 ) next_state=s4;
				  end
				  
			s1: begin
      		  if ( in==2'b00 || in==2'b11) next_state=s1;
	           if( in==2'b01 ) next_state=s3;
	           if( in==2'b10 ) next_state=s5;	
				 end
				 
			s2: begin 
			     if ( in==2'b00 || in==2'b11) next_state=s0;
			     if( in==2'b01 ) next_state=s2;
				  if( in==2'b10 ) next_state=s4;
				end
				
			s3: begin
			     if( in==2'b00 ) next_state=s1;
			     if( in==2'b01 ) next_state=s3;
	           if( in==2'b10 ) next_state=s5;
				  if( in==2'b11 ) next_state=s0;
	         end
				
	      s4: begin
			     if( in==2'b00 ) next_state=s0;
			     if( in==2'b01 ) next_state=s3;
	           if( in==2'b10 ) next_state=s4;
				  if( in==2'b11 ) next_state=s1;
				end
				
			s5: begin
			     if ( in==2'b00 || in==2'b11) next_state=s1;
			     if( in==2'b01 ) next_state=s2;
	           if( in==2'b10 ) next_state=s5;
	          end
				 
	      endcase
	 end

    always @(*) begin
	      if ( present_state==s1 || present_state==s3 ||  present_state==s1 ) out<=1;
			else out<=0;
	 
	 end






endmodule
