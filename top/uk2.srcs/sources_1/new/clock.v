`timescale 1ns / 1ps
module clock#(parameter DIV_COUNT=18)//分频系数
(
input clk,
input en,
input rst,
input new,//接收信号
input [3:0]l,//移位序号
output clko//fc
    );
reg clkc;
reg [DIV_COUNT-1:0]div;//分频
wire [DIV_COUNT-1:0]cnt;//分频
assign cnt=1<<(2*l);//分频数
always@(posedge clk&en)begin//fc分频
if(rst)begin
clkc<=0;
div<=0;
end
else begin
if(new)
div<=(div<cnt-1)?div+1:0;
clkc<=(div==0)?1:0;
end
end
assign clko=(l==1)?clk:clkc;
endmodule