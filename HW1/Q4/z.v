`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:58:26 02/28/2020 
// Design Name: 
// Module Name:    z 
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
module z(
    input a,
    input b,
    input c,
    input d,
    input e,
    input f,
    output z
    );
	 wire w1;
	 wire w2;
	 wire w3;
	 and and1(w1,~a,b,~c,d,~e,f);
	 and and2(w2,a,~b,~c,d,~e,f);
	 and and3(w3,~a,~b,~c,d,~e,f);
    or or1(z,w1,w2,w3);

endmodule
