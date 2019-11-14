`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:15:11 11/12/2019 
// Design Name: 
// Module Name:    CDD 
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
module CDD(Href,Vsync,Pclk,Datos,addr,datos,Write);

input Href;
input Vsync;
input Pclk;
input [7:0]Datos;
output addr;
output [7:0]datos;
output Write;

reg [7:0]RDatos;
reg [7:0]Rdatos;
reg [14:0]Raddr;
reg RWrite;
reg count = 0;


always @ (posedge Pclk) begin
	if(Vsync==0) begin
		if(Href==1) begin
			if(count == 0) begin
				RWrite = 0;
				Rdatos[7] = RDatos[0];
				Rdatos[6] = RDatos[1];
				Rdatos[5] = RDatos[2];
				Rdatos[4] = RDatos[5];
				Rdatos[3] = RDatos[6];
				Rdatos[2] = RDatos[7];
				count = count+1;
			end
			else begin
				Rdatos[1] = RDatos[3];
				Rdatos[0] = RDatos[4];
				count = count+1;
				RWrite = 1;
				Raddr = Raddr+1;
			end
		end
	end
	else Raddr = 0;
end

assign Datos = RDatos;
assign datos = Rdatos;
assign Write = RWrite;
endmodule
