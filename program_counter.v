module program_counter(clk,rst,en,jump,initial_addr,addr,pc_addr);
 
input  clk;
input  rst;
input  en;
input  jump;
input [7:0] initial_addr;
input  addr;
output reg [7:0] pc_addr;

    always(posedge clk or negedge rst)begin
	   if(!rst)begin
	      pc_addr<=initial_addr;
	   end
	   else begin
	      if(en)begin
		     if(jump)begin
                pc_addr<=addr;  
			 end
			 else begin
			    pc_addr<=pc_addr+1; 
		     end	
		  end
	   end
	end
 
endmodule


//2025.9.29










