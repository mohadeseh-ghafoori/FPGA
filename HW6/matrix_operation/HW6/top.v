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
    input [2:0] Op,
    input Op_start,
    input write_start,
    output transmit_output
    );

wire [7:0] data_A,data_B;
wire [9:0] addr_A,addr_B;
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
    .data_valid( ), 
    .addr(addr_A)
    );


UART_rec rec_matrix_B (
    .clk(clk_uart), 
    .rx(rx_B), 
    .write_start(write_start), 
    .data(data), 
    .data_valid( ), 
    .addr(addr_B)
    );



memory matrix_A (
  .clka(clk_uart), 
  .wea(), 
  .addra(addr_A),
  .dina(), 
  .clkb(clk_calc), 
  .addrb(), 
  .doutb() 
);
memory matrix_B (
  .clka(clk_uart), 
  .wea(), 
  .addra(addr_B), 
  .dina(), 
  .clkb(clk_calc), 
  .addrb(), 
  .doutb() 
);

calc matrix_calc (
    .clk(clk_calc), 
    .Op(Op), 
    .Op_start(Op_start), 
    .din_A(), 
    .din_B(), 
    .dout_C(), 
    .finish(finish)
    );

memory matrix_C (
  .clka(clk_calc), 
  .wea(), 
  .addra(addra), 
  .dina(), 
  .clkb(clk_calc), 
  .addrb(), 
  .doutb() 
);

UART_trans trans_matrix_C (
    .clk(clk), 
    .rx(rx), 
    .write_start(write_start), 
    .data(data), 
    .data_valid(data_valid), 
    .addr(addr)
    );

endmodule
