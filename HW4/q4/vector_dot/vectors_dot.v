`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:15:16 05/03/2020 
// Design Name: 
// Module Name:    vectors_dot 
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
module vectors_dot(
    output reg [21:0] c=0,
	 output reg data_valid=0,
    input [7:0] a,
    input [7:0] b,
    input clk,
    input start_initialize,
    input start_multiply
    );
       


		   wire [7:0] douta;
		   wire [7:0] doutb;
		 
		   reg wea=0,web=0;
         reg [5:0] addra=0;
         reg [5:0] addrb=0;
         reg [5:0] addraa=0;
         reg [5:0] addrbb=0;
         reg [6:0] cntc=0;
			reg [21:0] register=0;
			reg start=0;
		 
		 my_vectors block_a (
      .clka(clk), // input clka
      .wea(wea), // input [0 : 0] wea
      .addra(addra), // input [5 : 0] addra
      .dina(a), // input [7 : 0] dina
      .clkb(clk), // input clkb
      .addrb(addraa), // input [5 : 0] addrb
      .doutb(douta) // output [7 : 0] doutb
       );
		 my_vectors block_b (
      .clka(clk), // input clka
      .wea(web), // input [0 : 0] wea
      .addra(addrb), // input [5 : 0] addra
      .dina(b), // input [7 : 0] dina
      .clkb(clk), // input clkb
      .addrb(addrbb), // input [5 : 0] addrb
      .doutb(doutb) // output [7 : 0] doutb
       );


			
		   always @(posedge clk) begin
            data_valid<=0;


				if ( start_multiply==1 ) start<=start_multiply;
	         if ( ( start==1 )  && cntc <64 ) begin 
		              register<=register+douta*doutb;
						  cntc<=cntc+1;
          		    
	         end
	         if( cntc==64 ) begin
	              c<=register;
			        data_valid<=1;
			        cntc<=0;
					  start<=0;
					  register<=0;
	         end
	 
	 
	 
          end
		 
		 always @(negedge clk) begin
             if ( start_initialize==1 ) begin
                   wea<= start_initialize ;	 
		             web<= start_initialize ;
	          end
				 
	          if (wea==1) addra<=addra+1;      			 
             if(web==1)  addrb<=addrb+1;  	 
	          if( addra==63 ) wea<=0;
	          if( addrb==63 ) web<=0;
				 
		       if ( start==1) begin
			           addraa<=addraa+1;
			           addrbb<=addrbb+1;				 
				 
				 end
		 
		 
		 end
		 
		 
		 
		 
		 
		 

endmodule
