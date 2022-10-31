`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:18:57 07/07/2020 
// Design Name: 
// Module Name:    Q3 
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
module Q3(  input  clk,  input  [15:0] A,B,C,D,E,F,G,H,  output reg [33:0] Out  );
    reg [15:0] A_reg,B_reg,C_reg,D_reg,E_reg,F_reg,G_reg,H_reg;
	 reg [31:0] prod1,prod2,prod3,prod4;
	 reg [32:0] y1,y2;
    always @(posedge clk)  begin
	    A_reg <= A;
	    B_reg <= B;
	    C_reg <= C;
	    D_reg <= D;
	    E_reg <= E;
	    F_reg <= F;
	    G_reg <= G;
	    H_reg <= H;
	 end
	 always @(posedge clk) begin
	    prod1<= A_reg*B_reg; 
		 prod2<= C_reg*D_reg;
	    prod3<= E_reg*F_reg;
	    prod4<= G_reg*H_reg;
	 end
	 always @(posedge clk) begin
	   y1<=prod1+prod2;
	   y2<=prod3+prod4;
	 end
    always @(posedge clk)
	 Out <= y1+y2 ;
 
endmodule 
