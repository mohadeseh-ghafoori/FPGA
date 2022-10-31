`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:31:34 06/11/2020 
// Design Name: 
// Module Name:    calc 
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
module calc(
    input clk,
    input [2:0] op,
    input op_start,
    input signed [7:0] din_A,
    input signed [7:0] din_B,
	 output  reg [9:0] addrc_w=0,
    output  reg [9:0] addra_r=0,
    output  reg [9:0] addrb_r=0,
	 output reg wec=0,
    output  signed [7:0] dout_C,
    output  reg finish=0
    );
   
  
  reg [6:0] i=0;
  reg [6:0] j=0;
  reg [6:0] m=0;
  reg [15:0] cnt=0;
  reg flag=0;
  reg signed [7:0] result=8'b00000000;
  reg [10:0] temp2=0;
  reg [4:0] temp3=0;
 

	assign dout_C=result;
  always @(posedge clk) begin
    if(op_start) finish<=0;
	 if(wec==0) begin  
        addra_r<=0;
       addrb_r<=0;
       addrc_w<=0;
		 j<=0;
		 i<=0;
		 m<=0;
   end 
      case(op)
3'b000 : begin  if(op_start) wec<=1;
               if(wec) begin
                  if(cnt<1024) begin
                   cnt<=cnt+1;
                   result<=din_A+din_B;
						 addra_r<=addra_r+1;            
                   addrb_r<=addrb_r+1;
                   addrc_w<=addrc_w+1;
                  end            
                   if(cnt==1024) begin
                     wec<=0;
                     cnt<=0;
                     finish<=1;
                   end
              end
         end
3'b001 : begin  if(op_start) wec<=1;
               if(wec) begin
                  if(cnt<1024) begin
                   cnt<=cnt+1;
                   result<=din_A-din_B;
						 addra_r<=addra_r+1;            
                   addrb_r<=addrb_r+1;
                   addrc_w<=addrc_w+1;
                  end            
                   if(cnt==1024) begin
                     wec<=0;
                     cnt<=0;
                     finish<=1;
                   end
              end
         end
3'b010 : begin  if(op_start) wec<=1;
               if(wec) begin
                  if(cnt<1024) begin
                   cnt<=cnt+1;
                   result<=din_B-din_A;
						 addra_r<=addra_r+1;            
                   addrb_r<=addrb_r+1;
                   addrc_w<=addrc_w+1;
                  end            
                   if(cnt==1024) begin
                     wec<=0;
                     cnt<=0;
                     finish<=1;
                   end
              end
         end
			
3'b011: begin  if(op_start) wec<=1;
             if (wec) begin
				   if(cnt>=1)
					if(m==0){result,temp2}<=din_A*din_B;
					else	{result,temp2}<={result,temp2}+din_A*din_B;
				addra_r<=i*32+m;
				addrb_r<=j*32+m;
				cnt<=cnt+1;
				if(flag==1)
					addrc_w<=addrc_w+1;
				if(m==32)begin
					if(finish==0)
						if(j==32)begin
							i<=i+1;
							j<=0;
						end
						else j<=j+1;
					flag<=1;
					m<=0;
				end
				else begin
					flag<=0;
					m<=m+1;
				end
            if(cnt==32768) begin
               wec<=0;
					cnt<=0;
					m<=0;
					i<=0;
					j<=0;
					finish<=1;
            end
          end				
        end
		  
3'b100: begin  if(op_start) wec<=1;
               if (wec) begin
                     if(cnt<1024) begin
                       cnt<=cnt+1;  
                       result<=din_A;
                     end        
                    if(cnt==1024) begin
                       wec<=0;      
                      cnt<=0;
                      finish<=1;
                   end
                end
               if(wec) begin
                  if(j<32) begin 
                     addra_r<=32*j+i;
                     addrc_w<=32*i+j;
                     j<=j+1;
                  end
                  else if ( j==32 ) begin 
                      j<=0;
                      i<=i+1;
                  end
                  if(i==32) i<=0;						
				  end					 
         end

3'b101: begin  if(op_start) wec<=1;
               if (wec) begin
                     if(cnt<1024) begin
                       cnt<=cnt+1;  
                       result<=din_B;
                     end        
                    if(cnt==1024) begin
                       wec<=0;      
                      cnt<=0;
                      finish<=1;
                   end
                end
               if(wec) begin
                  if(j<32) begin 
                     addrb_r<=32*j+i;
                     addrc_w<=32*i+j;
                     j<=j+1;
                  end
                  else if ( j==32 ) begin 
                      j<=0;
                      i<=i+1;
                  end
                  if(i==32) i<=0;						
				  end					 
         end
			
3'b110: begin   if(op_start) wec<=1;
               if (wec) begin
                  if(cnt<32) begin
                    cnt<=cnt+1;
                    {result,temp3}<={result,temp3}+din_A;
                   end
                    if(cnt==32)  begin
                      wec<=0;
                      cnt<=0;
                      finish<=1;
                    end
               end
               if(wec)  begin
                   if ( i<32 ) begin
                      addra_r<=33*i;
                      i<=i+1;
                    end    
                   if(i==32) begin
                      i<=0;
                      addra_r<=0;
                   end          
                 end					
          end
3'b111: begin   if(op_start) wec<=1;
               if (wec) begin
                  if(cnt<32) begin
                    cnt<=cnt+1;
                    {result,temp3}<={result,temp3}+din_B;
                   end
                    if(cnt==32)  begin
                      wec<=0;
                      cnt<=0;
                      finish<=1;
                    end
               end
               if(wec)  begin
                   if ( i<32 ) begin
                      addrb_r<=33*i;
                      i<=i+1;
                    end    
                   if(i==32) begin
                      i<=0;
                      addrb_r<=0;
                   end          
              end										
          end
    endcase
 
end 
endmodule
