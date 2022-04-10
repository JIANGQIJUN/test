`timescale 1ns / 1ps
module test(

    );
    reg clk,clkc;
    reg rst;
    reg [2:0]tdl=0;
    reg en;
    reg signed[10:0]x;
    wire signed[15:0]y1;
    wire signed[15:0]y2;
    wire signed[15:0]y3;
    wire signed[15:0]y4;
    reg [10:0]data_sin[140000:0];
    reg [20:0]cnt;
    reg [15:0]v0=16'b101100001_0000000;//终端相对速度，9整7小
    reg [12:0]f0=13'b0110000000000;//载频，3整10小，单位GHz
     integer file_out,file_out1,file_out2,file_out3;
    initial begin
    // $readmemb("C:/Users/jiang22/Desktop/fil2.txt",data_sin,0,140000); ///改动点数据矩阵长度  注意是"/"  而不是"\"
     file_out = $fopen("D:/Users/tp2/res1.txt","w+");//内插后1
         file_out1 = $fopen("D:/Users/tp2/res2.txt","w+");//内插后2
         file_out2 = $fopen("D:/Users/tp2/res3.txt","w+"); //内插前1
         file_out3 = $fopen("D:/Users/tp2/res4.txt","w+"); //内插前2
    clk=1;
    clkc=1;
    en=1;
    rst=0;
    cnt=0;
    #300 rst=1;

    end
    always #10 clk=~clk;
    always #10240 clkc=~clkc;
    
    always@(posedge clkc)begin
        if(rst)begin
        //cnt<=cnt+1;
          $fwrite(file_out2, "%b\n",y3);
          $fwrite(file_out3, "%b\n",y4);
        //if(cnt==140000)
       //$finish;
        x<=data_sin[cnt];
        end
    end
    
    always@(posedge clk)begin
        if(rst)begin
        //cnt<=cnt+1;
         $fwrite(file_out, "%b\n",y1);
          $fwrite(file_out1, "%b\n",y2);
        //if(cnt==140000)
       //$finish;
        x<=data_sin[cnt];
        end
    end
    top test(clk,en,rst,tdl,v0,f0,y1,y2,y3,y4);
endmodule 
