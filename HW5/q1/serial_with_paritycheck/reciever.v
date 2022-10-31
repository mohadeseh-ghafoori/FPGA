`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:12:17 05/27/2020 
// Design Name: 
// Module Name:    reciever 
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
module reciever(
    output reg[3:0] valid_data,
    input RX,
    input clk
    );
  
     automatic function[2:0] c;
     input [6:0] r;
	  begin
     c[0]=r[0]^r[2]^r[4]^r[6];
     c[1]=r[1]^r[2]^r[5]^r[6];
     c[2]=r[3]^r[4]^r[5]^r[6];
	  end
     endfunction

    reg [8:0] register=9'b1111111111;
	 reg [3:0] cnt=0;
	 reg [6:0] data_false=0;
	 always @(posedge clk) begin
	 cnt<=cnt+1;
	 if(cnt<10) begin
	 register <= {RX,register[8:1]};
	 cnt<=cnt+1;
	 if ( register[8]==1 & register[0]==0) begin
	 data_false <= register[7:1];
	 data_false[c(data_false)-1]<=~data_false[c(data_false)-1];
	 end
	 end
	 else begin
	 cnt<=0;
	 register<=9'b111111111;
	 valid_data<={data_false[6],data_false[5],data_false[4],data_false[2]};
	end
	 end


endmodule
