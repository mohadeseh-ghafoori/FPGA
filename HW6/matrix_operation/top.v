`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:41 06/11/2020 
// Design Name: 
// Module Name:    top 
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
module top(
    input clk,
    input rx_A,
    input rx_B,
    output tx_C,
    input [2:0] op,
    input op_start,
    input write_start,
	 output locked,
	 output clk_uart,
	 output addr_B,
    output transmit_output
    );

wire [7:0] data_A,data_B,douta,doutb,doutc,dinc;
wire [9:0] addr_A,addr_B,addra_r,addrb_r,addrc_w,addrc_r;
wire wea,web,wec,finish,busy,clk_calc,clk_uart;
reg data_valid,start_send_c=0;
reg [13:0] counter=1;

// define necessary wires

clk_gen clk_gen (
    .clk(clk),
    .clk_calc(clk_calc), 
    .clk_uart(clk_uart), 
    .locked(locked)
    );

UART_rec rec_matrix_A ( 
	 .clk(clk_uart),
    .rx(rx_A), 
    .write_start(write_start), 
    .data(data_A), 
    .data_valid(wea), 
    .addr(addr_A)
    );


UART_rec rec_matrix_B (
	 .clk(clk_uart), 
    .rx(rx_B), 
    .write_start(write_start), 
    .data(data_B), 
    .data_valid(web), 
    .addr(addr_B)
    );


    block_mema block_a (
  .clka(clk_uart), // input clka
  .wea(wea), // input [0 : 0] wea
  .addra(addr_A), // input [9 : 0] addra
  .dina(data_A), // input [7 : 0] dina
  .clkb(clk_calc), // input clkb
  .addrb(addra_r), // input [9 : 0] addrb
  .doutb(douta) // output [7 : 0] doutb
);

  block_memb block_b (
  .clka(clk_uart), // input clka
  .wea(web), // input [0 : 0] wea
  .addra(addr_B), // input [9 : 0] addra
  .dina(data_B), // input [7 : 0] dina
  .clkb(clk_calc), // input clkb
  .addrb(addrb_r), // input [9 : 0] addrb
  .doutb(doutb) // output [7 : 0] doutb
);




calc matrix_calc (
    .clk(clk_calc), 
    .op(op), 
    .op_start(op_start), 
    .din_A(douta), 
    .din_B(doutb), 
    .dout_C(dinc),
    .addra_r(addra_r),	 
	 .addrb_r(addrb_r),
    .addrc_w(addrc_w),
    .wec(wec),	 
    .finish(finish)
    );



 block_memc block_c (
  .clka(clk_calc), // input clka
  .wea(wec), // input [0 : 0] wea
  .addra(addrc_w), // input [9 : 0] addra
  .dina(dinc), // input [7 : 0] dina
  .clkb(clk_uart), // input clkb
  .addrb(addrc_r), // input [9 : 0] addrb
  .doutb(doutc) // output [7 : 0] doutb
);

UART_trans trans_matrix_C (
    .clk(clk_uart),
    .finish(finish),	 
    .tx(tx_C), 
    .data(doutc), 
    .data_valid(data_valid),
    .transmit_output(transmit_output),
    .busy(busy),	 
    .addr(addrc_r)
    );
	 

	 
    always@(posedge clk_uart) begin
	       if(finish) start_send_c<=1;
			 data_valid<=0;
			 if( start_send_c ) begin
			    counter<=counter+1;
				 if( (counter%10)==0 ) begin
				       data_valid<=1;
			    end
				 if( counter==10240 ) begin
				     counter<=0;
				     start_send_c<=0;
			    end
			 end
    end

endmodule
