module generator(clk,rst,pc_en,ir_en);
input  clk;
input  rst;
output wire pc_en;
output wire ir_en;
 
 
reg  [3:0] state;
 
parameter
	S1   = 4'b0001,
	S2   = 4'b0010,
	S3   = 4'b0100,
	S4   = 4'b1000,
    S0   = 4'b0000;
	reg [4:0] next_state;
 
	always@(state) begin//四个状态不停更迭
		case(state)
		    S0     : next_state = S1;
			S1     : next_state = S2;
			S2     : next_state = S3;
			S3     : next_state = S4;
			S4     : next_state = S1;
			default: next_state = S1;
		endcase   
	end
	
	always@(posedge clk or negedge rst) begin
		if(!rst)begin
	   	state <= S0;
		end else begin
	   	state <= next_state;
		end
	end
   
	assign pc_en=(state==S0)||(state==S4);//控制PC的启动与否（PC在S4运行）
	assign ir_en=(state==S2);//控制IR的启动与否（IR在S2运行）
	
endmodule