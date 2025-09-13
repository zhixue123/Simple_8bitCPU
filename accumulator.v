module accumulator(clk,rst,en,file_in,alu_in,ac);
 
input  clk;
input  rst;
input  [1:0] en;
input  [7:0] file_in;//数据存储器的读入
input  [7:0] alu_in;//ALU运算结果的读入
output reg [7:0] ac;//保存数据AC的输出
 
	always @(posedge clk or negedge rst) begin
		if(!rst)begin
	   	ac<=8'b0000_0000;
		end else begin
		   if(en==2'b10)begin//根据alu_en进行对应操作
		   	ac<=file_in;
			end else if(en==2'b01)begin
			   ac<=alu_in;
		   end else begin
			   ac<=ac; 
			end
		end
	end
	
	
endmodule