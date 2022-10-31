`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:15:38 02/29/2020 
// Design Name: 
// Module Name:    fulladd4bit 
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
module fulladd4bit(
    output [3:0] sum,
    output cout,
    input [3:0] a,
    input [3:0] b,
    input cin
    );
    wire c1, c2, c3;
    fulladd1bit fa0(sum[0], c1, a[0], b[0], cin);
    fulladd1bit fa1(sum[1], c2, a[1], b[1], c1);
    fulladd1bit fa2(sum[2], c3, a[2], b[2], c2);
    fulladd1bit fa3(sum[3], cout, a[3], b[3], c3);

endmodule
