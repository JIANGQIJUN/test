module root#(parameter ROOT=11'b00011010001,INPUT_WIDTH=20,FILTER_WIDTH=10,OUTPUT_WIDTH=15
)(
input clk,
input en,
input rst,
input signed[INPUT_WIDTH:0]x,
output signed[OUTPUT_WIDTH:0]s
    );
integer j;
 localparam SUM_WIDTH=INPUT_WIDTH+FILTER_WIDTH+1;
reg [SUM_WIDTH:0]sum_fad[INPUT_WIDTH:0];
reg [SUM_WIDTH:0]sum;
always@(posedge clk&en)begin
if(rst)begin
for(j=0;j<=INPUT_WIDTH;j=j+1)begin
sum_fad[j]<=0;
end
sum<=0;
end
else begin
sum_fad[0]<=(x[0])?{20'b0,ROOT}:0;
sum_fad[1]<=(x[1])?{19'b0,ROOT,1'b0}:0;
sum_fad[2]<=(x[2])?{18'b0,ROOT,2'b0}:0;
sum_fad[3]<=(x[3])?{17'b0,ROOT,3'b0}:0;
sum_fad[4]<=(x[4])?{16'b0,ROOT,4'b0}:0;
sum_fad[5]<=(x[5])?{15'b0,ROOT,5'b0}:0;
sum_fad[6]<=(x[6])?{14'b0,ROOT,6'b0}:0;
sum_fad[7]<=(x[7])?{13'b0,ROOT,7'b0}:0;
sum_fad[8]<=(x[8])?{12'b0,ROOT,8'b0}:0;
sum_fad[9]<=(x[9])?{11'b0,ROOT,9'b0}:0;
sum_fad[10]<=(x[10])?{10'b0,ROOT,10'b0}:0;
sum_fad[11]<=(x[11])?{9'b0,ROOT,11'b0}:0;
sum_fad[12]<=(x[12])?{8'b0,ROOT,12'b0}:0;
sum_fad[13]<=(x[13])?{7'b0,ROOT,13'b0}:0;
sum_fad[14]<=(x[14])?{6'b0,ROOT,14'b0}:0;
sum_fad[15]<=(x[15])?{5'b0,ROOT,15'b0}:0;
sum_fad[16]<=(x[16])?{4'b0,ROOT,16'b0}:0;
sum_fad[17]<=(x[17])?{3'b0,ROOT,17'b0}:0;
sum_fad[18]<=(x[18])?{2'b0,ROOT,18'b0}:0;
sum_fad[19]<=(x[19])?{1'b0,ROOT,19'b0}:0;
sum_fad[20]<=(x[20])?{ROOT,20'b0}:0;
sum<=sum_fad[0]+sum_fad[1]+sum_fad[2]+sum_fad[3]+sum_fad[4]+sum_fad[5]+sum_fad[6]+sum_fad[7]+sum_fad[8]+sum_fad[9]+sum_fad[10]+sum_fad[11]+sum_fad[12]+sum_fad[13]+sum_fad[14]+sum_fad[15]+sum_fad[16]+sum_fad[17]+sum_fad[18]+sum_fad[19]-sum_fad[20];
end
end
assign s=(sum>=0)?sum[SUM_WIDTH-4:SUM_WIDTH-OUTPUT_WIDTH-5]:{sum[SUM_WIDTH-4:SUM_WIDTH-OUTPUT_WIDTH-4],1'b1};
endmodule