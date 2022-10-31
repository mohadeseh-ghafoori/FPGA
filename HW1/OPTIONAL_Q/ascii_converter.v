`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:58:03 02/28/2020 
// Design Name: 
// Module Name:    ascii_converter 
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
module ascii_converter(
    output [0:7] out,
    output cap,
    input [0:7] in
    );
	 reg [0:7] inst1=8'd97;
	 reg [0:7] inst2=8'b100000;
	 reg [0:7] inst3=-8'b100000;
	 reg cin=1'b0;
	 wire [0:7] out1;
	 wire [0:7] out2;
	 wire [0:7] out3;
	 wire [0:7] w1;
	 wire [0:7] w2;
	 wire [0:7] w3;
	 wire hi,low,same;
	 
     cmp8bit c1(hi,low,same, in[0:7],inst1[0:7]);
	  fulladder8bit f1(w1[0:7],cout,in[0:7],inst2[0:7],cin);
	  and and1(out1[0],w1[0],low); //making an enable for controlling this output that gives us the lower character
	  and and2(out1[1],w1[1],low);
	  and and3(out1[2],w1[2],low);
	  and and4(out1[3],w1[3],low);
	  and and5(out1[4],w1[4],low);
	  and and6(out1[5],w1[5],low);
	  and and7(out1[6],w1[6],low);
	  and and8(out1[7],w1[7],low);
	  fulladder8bit f2(w2[0:7],cout,in[0:7],inst3[0:7],cin);
	  and and11(out2[0],w2[0],hi);  //making an enable for controlling this output that gives us the bigger character
	  and and22(out2[1],w2[1],hi);
	  and and33(out2[2],w2[2],hi);
	  and and44(out2[3],w2[3],hi);
	  and and55(out2[4],w2[4],hi);
	  and and66(out2[5],w2[5],hi);
	  and and77(out2[6],w2[6],hi);
	  and and88(out2[7],w2[7],hi);  
	  fulladder8bit f3(w3[0:7],cout,in[0:7],inst3,cin);
	  and and111(out3[0],w3[0],same); //making an enable for controlling this output that gives us the bigger character
	  and and222(out3[1],w3[1],same);
	  and and333(out3[2],w3[2],same);
	  and and444(out3[3],w3[3],same);
	  and and555(out3[4],w3[4],same);
	  and and666(out3[5],w3[5],same);
	  and and777(out3[6],w3[6],same);
	  and and888(out3[7],w3[7],same);   	
     or or1[0:7](out,out1,out2,out3);
	  
	  not n1(hin,hi);
	  not n2(samen,same);
     and m(cap,low,hin,samen);	  
	  
endmodule
