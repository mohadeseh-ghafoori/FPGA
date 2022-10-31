`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:01 04/29/2020 
// Design Name: 
// Module Name:    multiplying 
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
module multiplying(
    output reg [15:0] c=0,
    input [7:0] a,
    input [7:0] b,
	 input clk,
	 input start_multiply,
    input start_initialize
    );
	 
  wire [7:0] douta;
  wire [7:0] doutb;
  wire [15:0] dinc;
  reg wea=0,web=0,wec=0;
  reg [5:0] addra=0;
  reg [5:0] addrb=0;
  reg [5:0] addrc=0;
  reg [5:0] addraa=0;
  reg [5:0] addrbb=0;
 
    block_mem8 block_a (
  .clka(clk), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addra), // input [5 : 0] addra
  .dina(a), // input [7 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addraa), // input [5 : 0] addrb
  .doutb(douta) // output [7 : 0] doutb
);


  block_mem8 block_b (
  .clka(clk), // input clka
  .wea(web), // input [0 : 0] wea
  .addra(addrb), // input [5 : 0] addra
  .dina(b), // input [7 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrbb), // input [5 : 0] addrb
  .doutb(doutb) // output [7 : 0] doutb
);


block_mem16 block_c (
  .clka(clk), // input clka
  .wea(wec), // input [0 : 0] wea
  .addra(addrc), // input [5 : 0] addra
  .dina(dinc), // input [15 : 0] dina
  .clkb(clk), // input clkb
  .addrb(addrcc), // input [5 : 0] addrb
  .doutb(doutc) // output [15 : 0] doutb
);

 

  reg [6:0] cntc=0;
  assign dinc=douta*doutb;
	 
  always @(posedge clk) begin

	if( start_multiply==1 ) begin 
	wec<=start_multiply;
	
	end
	if ( wec==1 && cntc <64 ) begin       
               c<=douta*doutb;
               cntc<=cntc+1;		    
	end
	if( cntc==63 ) begin
	      wec<=0;
			cntc<=0;
	end
	 
	 
	 
  end
  always @(negedge clk ) begin
              if ( start_initialize==1 ) begin
                  wea<= start_initialize ;	 
		            web<= start_initialize ;
	         end

         
         if(wea==1) addra<=addra+1;
         if(web==1) addrb<=addrb+1;
         if ( addra==63 )  wea<=0;
         if ( addrb==63 )  web<=0;
			
			if ( wec==1 )begin
			     addrc<=addrc+1;	
			      addraa<=addraa+1;
			      addrbb<=addrbb+1;
			end
			
			
  end
  
endmodule
