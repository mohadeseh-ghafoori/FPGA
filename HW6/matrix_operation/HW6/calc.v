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
    input clk_calc,
	 input clk_uart,
    input [2:0] op,
    input op_start,
	 input write_start,
    input signed [7:0] din_A,
    input signed [7:0] din_B,
	 input  [9:0] addr=0,
    output signed [7:0] dout_C,
	 output reg [9:0] doutc_frame=0,
	 output reg data_valid=0,
    output reg finish=0
    );
   
  
  wire signed [7:0] douta;   
  wire signed [7:0] doutb;
  wire signed [7:0] doutc;
  wire signed [7:0] dinc;
  reg wec,wea,web,start_send_c=0;
  reg [9:0] addra_w=0;
  reg [9:0] addrb_w=0;
  reg [9:0] addrc_w=0;
  reg [9:0] addra_r=0;
  reg [9:0] addrb_r=0;
  reg [9:0] addrc_r=0;
  reg [6:0] i,j=0;
  reg [10:0] m,k,n=0;
  reg [16:0] cnt=0;
  reg [13:0] counter=1;
  reg [7:0] ABT,AT,BT,traceA,traceB,temp1=8'b00000000;
  reg [12:0] temp2=0;
//    block_mema block_a (
//  .clka(clk_uart), // input clka
//  .wea(wea), // input [0 : 0] wea
//  .addra(addra_w), // input [9 : 0] addra
//  .dina(din_A), // input [7 : 0] dina
//  .clkb(clk_calc), // input clkb
//  .addrb(addra_r), // input [9 : 0] addrb
//  .doutb(douta) // output [7 : 0] doutb
//);
//
//
//  block_memb block_b (
//  .clka(clk_uart), // input clka
//  .wea(web), // input [0 : 0] wea
//  .addra(addrb_w), // input [9 : 0] addra
//  .dina(din_B), // input [7 : 0] dina
//  .clkb(clk_calc), // input clkb
//  .addrb(addrb_r), // input [9 : 0] addrb
//  .doutb(doutb) // output [7 : 0] doutb
//);


// block_memc block_c (
//  .clka(clk_calc), // input clka
//  .wea(wec), // input [0 : 0] wea
//  .addra(addrc_w), // input [9 : 0] addra
//  .dina(dinc), // input [7 : 0] dina
//  .clkb(clk_uart), // input clkb
//  .addrb(addrc_r), // input [9 : 0] addrb
//  .doutb(doutc) // output [7 : 0] doutb
//);

 
// 
//assign dinc = ( op==3'b000 ) ? douta+doutb :( op==3'b001 ) ? douta-doutb : ( op==3'b010 ) ? doutb-douta :
//( op==3'b011 ) ? ABT : ( op==3'b100 ) ? AT : ( op==3'b101 ) ? BT : ( op==3'b110 ) ? traceA : traceB ;

assign dout_C=result;

//  always @(posedge clk_uart) begin
//          if (write_start) begin
//			     wea<=1;
//				  web<=1;
//			 end
//          if( wea || web ) n<=n+1;
//          if( n==1024 ) begin
//			      wea<=0;
//					web<=0;
//					n<=0;
//			 end
//			 
//			 if(finish) start_send_c<=1;
//			 data_valid<=0;
//			 if( start_send_c ) begin
//			    counter<=counter+1;
//				 if( (counter%10)==0 ) begin
//				       data_valid<=1;
//			          doutc_frame<={1,doutc,0};
//			          addrc_r<=addrc_r+1;
//			    end
//				 if( counter==10240 ) begin
//				     counter<=0;
//				     start_send_c<=0;
//			    end
//			 end
//			 
//  end
//  
//  always @(negedge clk_uart) begin
//          if (wea) addra_w<=addr;
//			 else addra_w<=0;
//          if (web) addrb_w<=addr;
//			 else addrb_w<=0;
//   end
	
  always @(posedge clk_calc) begin
      finish<=0;
	  if(wec==0) begin  
      addra_r<=0;
      addrb_r<=0;
      addrc_w<=0;
		j<=0;									     
		i<=0;
		k<=0;
		m<=0;
     end 
      case(op)
3'b000 : begin  if(op_start) wec<=1;
               if(wec) begin
                  if(cnt<1023) begin
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
                  if(cnt<1023) begin
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
                  if(cnt<1023) begin
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
                     if(cnt<32767) begin
                        cnt<=cnt+1;  
							  {temp1,temp2}<={temp1,temp2}+din_A*din_B;
							  if(cnt%32==0)  result<=temp1;
                     end        
                    if(cnt==32768) begin
                      wec<=0;      
                      cnt<=0;
                      finish<=1;
                   end
                end
             if (wec) begin
					  if(j<32)  begin
					       j<=j+1;
							 i<=0;
							 m<=32*j;
							 if(m<(j+1)*32) begin
									addra_r<=m;	
                            m<=m+1;														
							 end
					       if(i<32) begin
								   i<=i+1;
									k<=i*32;
							      if(k<(i+1)*32) begin
										  addrb_r<=k;
                                addrc_w<=32*j+i;															
										  k<=k+1;
									end
							end
					   end
				end					 
        end
		  
3'b100: begin  if(op_start) wec<=1;
               if (wec) begin
                     if(cnt<1023) begin
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
					         j<=j+1;
                        k<=j*32;											 
								if(k <(j+1)*32)	begin
									addra_r<=k;
					            addrc_w<=32*(k%32)+j;											 
					            k<=k+1;                                                            
					          end                                                          
					     end                                                             
				   end					 
        end

3'b101: begin  if(op_start) wec<=1;
               if (wec) begin
                     if(cnt<1023) begin
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
					         j<=j+1;
                        k<=j*32;											 
								if(k <(j+1)*32)	begin
									addrb_r<=k;
					            addrc_w<=32*(k%32)+j;											 
					            k<=k+1;                                                            
					          end                                                          
					     end                                                             
				   end					 
        end
			
3'b110: begin   if(op_start) wec<=1;
               if (wec) begin
                  if(cnt<31) begin
                    cnt<=cnt+1;
                    traceA<=traceA+din_A;
						  dout_C<=traceA;
                   end
                    if(cnt==32)  begin
                      wec<=0;
                      cnt<=0;
                      finish<=1;
                    end
               end
             if(wec)  begin
                   if ( i<31 ) begin
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
               if(wec) begin
                   if(cnt<31) begin
                    cnt<=cnt+1;
                    traceB<=traceB+din_B;
						  dout_C<=traceB;
                   end        
                   if(cnt==32)  begin  
                     wec<=0;  
                     cnt<=0;  
                     finish<=1;
                   end
               end
            if(wec)  begin
                   if ( i<31 ) begin
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
//  always @(negedge clk_calc)  begin
//      case(op)
//              3'b000 :begin
//                                     if (wec) begin
//                                        addra_r<=addra_r +1;            
//                                        addrb_r<=addrb_r+1;
//                                        addrc_w<=addrc_w+1;
//                                     end  
//                                    if(~wec) begin  
//                                       addra_r<=0;
//                                       addrb_r<=0;
//                                       addrc_w<=0;
//                                    end  
//                      end
//               3'b001: begin  
//                                     if (wec) begin
//                                        addra_r<=addra_r+1;            
//                                        addrb_r<=addrb_r+1;
//                                        addrc_w<=addrc_w+1;
//                                     end  
//                                    if(~wec) begin  
//                                       addra_r<=0;
//                                       addrb_r<=0;
//                                       addrc_w<=0;
//                                    end  
//                         end
//                3'b010: begin
//                                 if (wec) begin
//                                        addra_r<=addra_r+1;            
//                                        addrb_r<=addrb_r+1;
//                                        addrc_w<=addrc_w+1;
//                                     end  
//                                    if(~wec) begin  
//                                       addra_r<=0;
//                                       addrb_r<=0;
//                                       addrc_w<=0;
//                                    end  
//                          end
//              3'b011: begin
//					             if (wec) begin
//					                if(j<32)  begin
//					                     j<=j+1;
//												i<=0;
//												m<=32*j;
//												if(m<(j+1)*32) begin
//												      addra_r<=m;	
//                                          m<=m+1;														
//												end
//					                     if(i<32) begin
//												    i<=i+1;
//													 k<=i*32;
//													 if(k<(i+1)*32) begin
//													      addrb_r<=k;
//                                             addrc_w<=32*j+i;															
//															k<=k+1;
//												    end
//												end
//					                end
//					             end
//					             if(~wec) begin
//                               addra_r<=0;
//										 addrb_r<=0;
//                               addrc_w<=0;
//										 j<=0;									     
//									    i<=0;
//									    k<=32*i;
//										 m<=32*j;
//									 end
//					        end
//               3'b100: begin
//					            if(wec) begin
//					               if(j<32) begin                                                   
//					                   j<=j+1;
//                                  k<=j*32;											 
//											 if(k <(j+1)*32)	begin
//												   addra_r<=k;
//					                        addrc_w<=32*(k%32)+j;											 
//					                        k<=k+1;                                                            
//					                   end                                                          
//					               end                                                             
//					           end
//                          if(~wec) begin  
//                               addra_r<=0;
//                               addrc_w<=0;
//										 j<=0;
//										 k<=32*j;
//                          end 					
//					      end
//               3'b101: begin
//					            if(wec) begin
//					               if(j<32) begin                                                   
//					                   j<=j+1;
//                                  k<=j*32;											 
//											 if(k <(j+1)*32)	begin
//												   addrb_r<=k;
//					                        addrc_w<=32*(k%32)+j;											 
//					                        k<=k+1;                                                            
//					                   end                                                          
//					               end                                                             
//					           end
//                          if(~wec) begin  
//                               addrb_r<=0;
//                               addrc_w<=0;
//										 j<=0;
//										 k<=32*j;
//                          end 					 					
//					      end
//               3'b110: begin
//                 if(wec)  begin
//                   if ( i<32 ) begin
//                      addra_r<=33*i;
//                      i<=i+1;
//                    end    
//                   if(i==31) begin
//                      i<=0;
//                      addra_r<=0;
//                   end          
//                 end          
//               end
//            3'b111: begin  
//                  if(wec)  begin
//                    if ( i<32 ) begin
//                       addrb_r<=33*i;
//                       i<=i+1;      
//                    end              
//                    if(i==31) begin            
//                       i<=0;      
//                       addrb_r<=0;
//                     end
//                 end
//           end
//endcase
//end
endmodule
