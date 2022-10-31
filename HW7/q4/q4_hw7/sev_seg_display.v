`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:23:36 07/08/2020 
// Design Name: 
// Module Name:    sev_seg_display 
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
module sev_seg_display(
    output reg [6:0] out=0,
    input [3:0] in_num,
    input clk
    );
   
	reg [3:0] addra=0;
	wire [6:0] douta;
	my_rom showing_on7seg (
  .clka(clk), // input clka
  .addra(addra), // input [3 : 0] addra
  .douta(douta) // output [6 : 0] douta
   );
	 
	always @(posedge clk) begin
    
      addra<=in_num;
      out<=douta;

	end
	 
	 

endmodule
