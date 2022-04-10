`timescale 1ns / 1ps
module clock#(parameter DIV_COUNT=18)//��Ƶϵ��
(
input clk,
input en,
input rst,
input new,//�����ź�
input [3:0]l,//��λ���
output clko//fc
    );
reg clkc;
reg [DIV_COUNT-1:0]div;//��Ƶ
wire [DIV_COUNT-1:0]cnt;//��Ƶ
assign cnt=1<<(2*l);//��Ƶ��
always@(posedge clk&en)begin//fc��Ƶ
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