`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:54:17 02/28/2020 
// Design Name: 
// Module Name:    fulladder8bit 
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
module fulladder8bit(
    output [7:0] sum,
    output cout,
    input [7:0] a,
    input [7:0] b,
    input cin
    );
	 
	 
	 
    fulladder1bit fa0(sum[0], c1, a[0], b[0], cin);
    fulladder1bit fa1(sum[1], c2, a[1], b[1], c1);
    fulladder1bit fa2(sum[2], c3, a[2], b[2], c2);
    fulladder1bit fa3(sum[3], c4, a[3], b[3], c3);
    fulladder1bit fa4(sum[4], c5, a[4], b[4], c4);
    fulladder1bit fa5(sum[5], c6, a[5], b[5], c5);
    fulladder1bit fa6(sum[6], c7, a[6], b[6], c6);
	 fulladder1bit fa7(sum[7], cout, a[7], b[7], c7);



endmodule
