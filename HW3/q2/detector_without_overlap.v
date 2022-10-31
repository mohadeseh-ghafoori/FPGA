`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:13 04/02/2020 
// Design Name: 
// Module Name:    detector_without_overlap 
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
module detector_without_overlap(
    output reg [3:0] n,
    input [3:0] string1,
    input string2,
    input clk
    );
    reg [3:0] register=0;
	 reg [4:0] cnt=0;
	 reg [4:0] cnt2=0;
	 reg [3:0] a=0;
	 reg [3:0] counter=0;
	 
    always @(posedge clk) begin
	 
	 cnt=cnt+1;
	 cnt2=cnt;
	 if( cnt<= 20) begin
	 if( counter <=3) begin
	 register={string2,register[3:1]};
	 counter =counter +1;
	 cnt2=cnt2+1;
	 end
	 
	 if ( counter ==4 ) begin
	 if ( (string1 != register) && (cnt2==cnt) ) register={string2,register[3:1]};
	 if ( string1 == register  ) begin
	 a=a+1;
	 register=0;
	 counter =0;
    end	 
	 end
	
	 end
	
	 else begin
	 cnt=0;
	 n=a;
	 register=4'bzzzz;
	 counter=0;
	 a=0;
	 end
	 
	 end
endmodule
