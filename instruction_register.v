module instruction_register(clk,rst,ir_en,data,operation,file_en,jump,ac_en,alu_en,addr);
 
input  clk;
input  rst;
input  ir_en;
input  [15:0] data;
output reg   [3:0] operation;
output reg   alu_en;//指令解析后对是否启动ALU的信号输出
output reg   file_en;//指令解析后对是否进行读写操作的信号输出
output reg   jump;//指令解析后对是否进行跳步操作的信号输出
output reg   [1:0] ac_en;
output reg   [7:0] addr;//指令解析后地址码的输出
 
reg ir_state;
always@(posedge clk or negedge rst)begin
   if(!rst)begin
	   operation<=4'b0000;
		alu_en<=1'b0;
		file_en<=1'b0;
		ac_en<=2'b00;
		addr<=8'b0000_0000;
		ir_state=1'b0;
	end else begin
	   if(ir_en)begin//按照我们设计的指令系统对指令进行解析，控制S3阶段的命令输出
		     file_en<=data[15]&(data[15]^data[14]);
			 alu_en<=data[14]&(data[15]^data[14]);
			 operation<=data[13:10];
			 addr<=data[7:0];
			 ir_state<=1'b1;
		end else begin
		     alu_en<=1'b0;
			 file_en<=1'b0;
	   end
		
		if(ir_state)begin//同样是解析过程，控制S4阶段的命令输出
		    jump<=(data[15]&data[14]);
		    ir_state<=1'b0;
			 ac_en<=data[15:14];
		end else begin
		    jump<=1'b0;
		    ac_en<=2'b00;
		end
	end
end
          
 
 
 
endmodule