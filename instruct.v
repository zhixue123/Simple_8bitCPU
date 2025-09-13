module instruct(clk,rst,pc_addr,data);
 
input  clk;
input  rst;
input  [7:0]  pc_addr;
output reg [15:0] data;
 
reg [15:0] datas [15:0];
 
initial begin
   datas[0] <= 16'b00_0000_00_0000_0000;
   datas[1] <= 16'b10_0000_00_0000_0010;
	datas[2] <= 16'b01_0001_00_0000_0000;
	datas[3] <= 16'b10_0000_00_0000_0011;
	datas[4] <= 16'b01_0010_00_0000_0000;
	
	datas[5] <= 16'b10_0001_00_0000_0001;
	datas[6] <= 16'b01_0000_00_0000_0000;
	datas[7] <= 16'b10_0000_00_0000_0011;
	datas[8] <= 16'b01_0010_00_0000_0000;
	
	datas[9] <= 16'b00_0000_00_0000_0000;
	datas[10]<= 16'b00_0000_00_0000_0000;
	datas[11]<= 16'b00_0000_00_0000_0000;
	datas[12]<= 16'b00_0000_00_0000_0000;
	datas[13]<= 16'b00_0000_00_0000_0000;
	datas[14]<= 16'b00_0000_00_0000_0000;
	datas[15]<= 16'b00_0000_00_0000_0000;
end
 
always@(posedge clk or negedge rst)begin
   if(!rst)begin
	    data<=16'b0000_0000_0000_0000;
	end else begin
	    if(pc_addr&&(pc_addr<=16'd15))begin
		     data<=datas[pc_addr];
		 end else begin
		     data<=16'b0000_0000_0000_0000;
		 end
	end
end
 
endmodule