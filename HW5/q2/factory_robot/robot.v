`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:40:10 06/01/2020 
// Design Name: 
// Module Name:    robot 
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
module robot(
    output  low_material,
    output  stuck,
    output  over_heat,
    output  on,
    output  warning,
    input sensor1,
    input sensor2,
    input sensor3,
    input sensor4,
    input ready,
    input clk
    );
	 
	    parameter normal=3'b000,heat=3'b001,stucked=3'b010,shortage=3'b011,danger=3'b100;
		 reg[2:0] next_state=0, present_state=0;
		 reg [31:0] cnt=0;
		 always @(posedge clk) present_state <= next_state;
		 always @(*) begin
		    case ( present_state )
			     normal: begin 
				             if ( sensor1 ) next_state=heat;
				             else if ( sensor2 ) next_state=stucked;
							    else if ( sensor3 ) next_state=shortage;
							    else if ( sensor4 ) next_state=danger;
								 else next_state=normal;
				          end
					heat: begin
					        if ( sensor1 ) next_state=heat;
							  else next_state=normal;
				         end
					stucked: begin 
								 if ( ready==1 ) next_state=normal;
								 if ( sensor2==1 )   next_state=stucked;
								end
					shortage: begin 					    
								 if ( ready==1 && sensor3==0 ) next_state=normal;
                         if( sensor3==1 )   next_state=shortage;								 
					          end 
			  
			      danger: begin
					          if ( sensor4 ) next_state=danger;
							    else next_state=normal;
				           end
	       endcase
	 
	    end
       always @(posedge clk) begin 

              if ( sensor3==1 ) 	cnt<=cnt+1;
						if ( cnt==480000000 ) begin
							cnt<=0; 
						end
	 
		 end

		 assign over_heat= ( present_state==heat ) ? 1 : 0 ;
       assign stuck= ( present_state==stucked ) ? 1 : 0 ;
		 assign low_material= ( present_state==shortage ) ? 1 : 0 ;
		 assign on= ( present_state==normal || (present_state==shortage && cnt<480000000) ) ? 1 : 0 ;
		 assign warning= ( present_state==danger ) ? 1 : 0 ;
		 
endmodule
