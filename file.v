module file(clk,rst,file_en,operation,addr,ac,file_out);
 
input  clk;
input  rst;
input  file_en;
input  [3:0] operation;
input  [7:0] addr;
input  [7:0] ac;
output reg [7:0] file_out;
 
reg [7:0] files [15:0];


initial begin
  files[0] <= 8'b0000_0000;
  files[1] <= 8'b0000_0001;
  files[2] <= 8'b0000_0010;
  files[3] <= 8'b0000_0011;
  files[4] <= 8'b0000_0100;
  files[5] <= 8'b0000_0101;
  files[6] <= 8'b0000_0110;
  files[7] <= 8'b0000_0111;
  files[8] <= 8'b0000_1000;
  files[9] <= 8'b0000_1001;
  files[10]<= 8'b0000_1010;
  files[11]<= 8'b0000_1011;
  files[12]<= 8'b0000_1100;
  files[13]<= 8'b0000_1101;
  files[14]<= 8'b0000_1110;
  files[15]<= 8'b0000_1111;
end

always @(posedge clk or negedge rst)begin
    if(!rst)begin
       file_out<=0;
    end
    else begin
       if(file_en)begin
          case(operation)
           4'b0000:begin
             file_out<=files[addr];
           end
           4'b0001:begin
             files[addr]<=ac;
           end
           default:begin
             file_out<=ac;
           end
          endcase
       end
    end
end

endmodule