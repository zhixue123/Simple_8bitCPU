
module simple_cpu(clk,rst,data_in,ac,file_en,initial_addr,addr,operation,pc_en);
 
input  clk;
input  rst;
input  [15:0] data_in;
input  [7:0] initial_addr;
output wire file_en;
output wire [7:0] ac;
output wire [7:0] addr;
output wire [3:0] operation;
output wire pc_en;
 
 
wire ir_en;
wire alu_en;
wire jump;
wire [1:0] ac_en;
 
wire [7:0] pc_addr;
 
wire [7:0] file_out;
wire [7:0] alu_out;
 
wire [15:0] data;

generator generator_1(.clk(clk),.rst(rst),.pc_en(pc_en),.ir_en(ir_en));

program_counter program_counter_1(.clk(clk),.rst(rst),.en(pc_en),.jump(jump),.initial_addr(initial_addr),.addr(addr),.pc_addr(pc_addr));

instruction_register instruction_register(.clk(clk),.rst(rst),.ir_en(ir_en),.data(data),.operation(operation),
                                           .alu_en(alu_en),.file_en(file_en),.jump(jump),.ac_en(ac_en),.addr(addr));

alu alu_1(.clk(clk),.rst(rst),.en(alu_en),.operation(operation),.ac(ac),.alu_out(alu_out));

accumulator accumulator_1(.clk(clk),.rst(rst),.en(ac_en),.file_in(file_out),.alu_in(alu_out),.ac(ac));

file file_1(.clk(clk),.rst(rst),.file_en(file_en),.operation(operation),.addr(addr),.ac(ac),.file_out(file_out));

instruct instruct_1(.clk(clk),.rst(rst),.pc_addr(pc_addr),.data(data));

endmodule