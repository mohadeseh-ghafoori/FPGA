`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:20:17 02/28/2020 
// Design Name: 
// Module Name:    cmp2bit 
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
module cmp2bit(
    output ahigher,
    output alower,
    output asame,
    input [0:1] a,
    input [0:1] b
    );
    wire w1;
	 wire w2;
	 wire w3;
    and and1(w1,a[0],~b[0]);
	 and and2(w2,a[0],a[1],~b[1]);
	 and and3(w3,a[1],~b[1],~b[0]);
	 or or1(ahigher,w1,w2,w3);
	 
	 
	 wire w11;
    wire w22;
	 wire w33;
	 and and11(w11,b[0],~a[0]);
	 and and22(w22,b[0],b[1],~a[1]);
	 and and33(w33,b[1],~a[0],~a[1]);
	 or or11(alower,w11,w22,w33);
	 
	 
	 wire w111;
    wire w222;
	 wire w333;
	 wire w4;
	 and and111(w111,a[0],a[1],b[0],b[1]);
	 and and222(w222,~a[0],~a[1],~b[0],~b[1]);
	 and and333(w333,a[0],b[0],~a[1],~b[1]);
	 and and4(w4,a[1],b[1],~a[0],~b[0]);
	 or or111(asame,w111,w222,w333,w4);

endmodule
