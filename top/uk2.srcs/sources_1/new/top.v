`timescale 1ns / 1ps//顶层模块
module top#(parameter INPUT_WIDTH=10,PATH=24)
(
input clk,
input en,
input rst,
input [2:0]tdl,
input [15:0]v0,//终端相对速度，9整7小
input [12:0]f0,//载频，3整10小，单位GHz
//input signed[INPUT_WIDTH:0]xr,//输入同相和正交分量
//input signed[INPUT_WIDTH:0]xi,
output signed[15:0]yr,//输出同相和正交分量
output signed[15:0]yi
    );
reg [5:0]path;//路径数量
wire [3:0]l;//内插指数
wire signed[15:0]u[1:0][PATH-1:0];//原始信道系数
wire signed[15:0]rayleh[1:0][PATH-1:0];//内插后信道系数
always@(posedge clk&en)begin
if(!rst)begin
path<=24;
end
else begin
case(tdl)//根据信道种类得到信道路径数
0:path<=23;
1:path<=23;
2:path<=24;
3:path<=13;
4:path<=14;
endcase
end
end
//信道系数生成
uk uk1(clk,v0,f0,en,rst,tdl,path,l,u[0][0],u[0][1],u[0][2],u[0][3],u[0][4],u[0][5],u[0][6],u[0][7],u[0][8],u[0][9],u[0][10],u[0][11],u[0][12],u[0][13],u[0][14],u[0][15],u[0][16],u[0][17],u[0][18],u[0][19],u[0][20],u[0][21],u[0][22],u[0][23],u[1][0],u[1][1],u[1][2],u[1][3],u[1][4],u[1][5],u[1][6],u[1][7],u[1][8],u[1][9],u[1][10],u[1][11],u[1][12],u[1][13],u[1][14],u[1][15],u[1][16],u[1][17],u[1][18],u[1][19],u[1][20],u[1][21],u[1][22],u[1][23]);
fifs f1(clk,en,~rst,l,u[0][0],u[0][1],u[0][2],u[0][3],u[0][4],u[0][5],u[0][6],u[0][7],u[0][8],u[0][9],u[0][10],u[0][11],u[0][12],u[0][13],u[0][14],u[0][15],u[0][16],u[0][17],u[0][18],u[0][19],u[0][20],u[0][21],u[0][22],u[0][23],u[1][0],u[1][1],u[1][2],u[1][3],u[1][4],u[1][5],u[1][6],u[1][7],u[1][8],u[1][9],u[1][10],u[1][11],u[1][12],u[1][13],u[1][14],u[1][15],u[1][16],u[1][17],u[1][18],u[1][19],u[1][20],u[1][21],u[1][22],u[1][23],rayleh[0][0],rayleh[0][1],rayleh[0][2],rayleh[0][3],rayleh[0][4],rayleh[0][5],rayleh[0][6],rayleh[0][7],rayleh[0][8],rayleh[0][9],rayleh[0][10],rayleh[0][11],rayleh[0][12],rayleh[0][13],rayleh[0][14],rayleh[0][15],rayleh[0][16],rayleh[0][17],rayleh[0][18],rayleh[0][19],rayleh[0][20],rayleh[0][21],rayleh[0][22],rayleh[0][23],rayleh[1][0],rayleh[1][1],rayleh[1][2],rayleh[1][3],rayleh[1][4],rayleh[1][5],rayleh[1][6],rayleh[1][7],rayleh[1][8],rayleh[1][9],rayleh[1][10],rayleh[1][11],rayleh[1][12],rayleh[1][13],rayleh[1][14],rayleh[1][15],rayleh[1][16],rayleh[1][17],rayleh[1][18],rayleh[1][19],rayleh[1][20],rayleh[1][21],rayleh[1][22],rayleh[1][23]);
assign yr=rayleh[0][1];
assign yi=rayleh[1][1];
endmodule
