`timescale 1ns / 1ps
module test(

    );
    reg clk;
    reg rst;
    reg [2:0]tdl=2;
    reg en;
    reg signed[10:0]x;
    wire signed[15:0]y1;
    wire signed[15:0]y2;
    reg [10:0]data_sin[140000:0];
    reg [20:0]cnt;
    reg [15:0]v0=16'b01111000010000000;//终端相对速度，9整7小
    reg [12:0]f0=13'b1010000000000;//载频，3整10小，单位GHz
    reg [5:0]path=24;
     integer file_out,file_out1;
    initial begin
    // $readmemb("C:/Users/jiang22/Desktop/fil2.txt",data_sin,0,140000); ///改动点数据矩阵长度  注意是"/"  而不是"\"
     file_out = $fopen("C:/Users/jiang22/Desktop/fil1.txt","w+");
         file_out1 = $fopen("C:/Users/jiang22/Desktop/fil3.txt","w+");
    clk=1;
    en=1;
    rst=0;
    cnt=0;
    #300 rst=1;
    end
    always #10 clk=~clk;
    always@(posedge clk)begin
    if(rst)begin
    cnt<=cnt+1;
     $fwrite(file_out, "%b\n",y1);
      $fwrite(file_out1, "%b\n",y2);
    if(cnt==140000)
   $finish;
    x<=data_sin[cnt];
    end
    end
    uk test(clk,v0,f0,en,rst,tdl,path,l,y1,y2);
endmodule 
