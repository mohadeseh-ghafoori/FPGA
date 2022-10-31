`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:05:59 06/02/2020 
// Design Name: 
// Module Name:    generate_fifo_fsm 
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
module generate_fifo_fsm(
    output  [7:0] out,
	 output reg [10:0] count=0,
	 output reg full=0,
	 output reg empty=0,
    input [7:0] in,
    input rd,
    input wr,
    input reset,
	 input clk
    );
    
	 reg [9:0] read_addr=0;
	 reg [9:0] write_addr=0;
	 wire wr_en,rd_en;
	 parameter normal=2'b00,emptyness=3'b01,fully=3'b10;
	 reg [1:0] present_state=0; 
	 reg [1:0] next_state=0;
	 

	 assign wr_en=( wr==1 && full==0 ) ? 1 : 0;
	 assign rd_en=( rd==1 && empty==0 ) ? 1 : 0;

	 my_ram my_fifo (
     .clka(clk), // input clka
     .wea(wr_en), // input [0 : 0] wea
     .addra(write_addr), // input [9 : 0] addra
     .dina(in), // input [7 : 0] dina
     .clkb(clk), // input clkb
     .rstb(reset), // input rstb
     .addrb(read_addr), // input [9 : 0] addrb
     .doutb(out) // output [7 : 0] doutb
  );
    
	always @(posedge clk) present_state<=next_state;
	 
	 always @(*) begin
	    case ( present_state )
       normal: begin 
					  if ( count==1024 ) next_state=fully;
					 else if ( count==0 ) next_state=emptyness;
					 else next_state=normal;
				  end
	    fully : begin 
                if ( (count==1024) ) next_state=fully;
					 else next_state=normal;
	           end
	    emptyness : begin
		            if ( count==0 ) next_state=emptyness;
					   else next_state=normal;
                  end
	    endcase
	 end
	 
	 always @(posedge clk) begin
	     if ( reset ) begin
				write_addr<=0;
		      read_addr<=0;
				count<=0;
		  end
            if ( wr_en && rd_en ) begin 
				    write_addr<=write_addr+1;
					 read_addr<=read_addr+1;
				end 
            if ( wr_en && rd_en==0 ) begin 
				    write_addr<=write_addr+1;
            	 count<=count+1;	
		      end
				if ( wr_en==0 && rd_en ) begin 
				    read_addr<=read_addr+1;
            	 count<=count-1;				   
				end
				if ( count==0 ) empty<=1;
				if ( count==1024 ) full<=1;
				if ( count!=0 ) empty<=0;
				if ( count!=1024 ) full<=0;
 
	 end


endmodule
