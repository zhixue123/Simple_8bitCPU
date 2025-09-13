module alu(clk,rst,en,operation,ac,alu_out);
 
input  clk;
input  rst;
input  en;//IR给出的是否启动的命令
input  [3:0] operation;//IR给出的具体操作命令
input  [7:0] ac;//AC给出的数据
output reg [7:0] alu_out;//运算结果的输出
 
 
	parameter 
	MOVAC = 4'b0000,//r<=ac
	MOVR  = 4'b0001,//ac<=r
	ADD   = 4'b0010,//ac<=ac+r
	SUB   = 4'b0011,//ac<=ac-r
	INAC  = 4'b0100,//ac<=ac+1
	CLAC  = 4'b0101,//ac<=0
	AND   = 4'b0110,//ac<=ac&r
	OR    = 4'b0111,//ac<=ac|r
	XOR   = 4'b1000,//ac<=~ac^r
	NOT   = 4'b1001;//ac<=~ac
	
	reg [7:0] r;//寄存器R
	
	always@(posedge clk or negedge rst) begin
		if(!rst)begin
		   alu_out <= 8'b0000_0000;
			r<=8'b0000_0000;
		end else begin
			if (en) begin
				case(operation)//根据具体操作命令进行操作
	            MOVAC  : begin r<=ac;alu_out<=ac;end
	            MOVR   : alu_out<=ac;
	            ADD    : alu_out<=ac+r;
	            SUB    : alu_out<=ac-r;
	            INAC   : alu_out<=ac+8'b0000_0001;
	            CLAC   : alu_out<=8'b0000_0000;
	            AND    : alu_out<=ac&r;
	            OR     : alu_out<=ac|r;
	            XOR    : alu_out<=ac^r;
	            NOT    : alu_out<=~ac;
					default: alu_out<=8'b0000_0000;
				endcase  
			end
		end
	end
 
endmodule