`timescale 1ns/100ps

module tb_simple_cpu;

reg clk;
reg rst;
reg [15:0] data_in;
reg [7:0] initial_addr;

wire file_en;
wire [7:0] ac;
wire [7:0] addr;
wire [3:0] operation;
wire pc_en;

simple_cpu CPU(
    .clk(clk),
    .rst(rst), 
    .data_in(data_in),
    .initial_addr(initial_addr),
    .file_en(file_en),
    .ac(ac),
    .addr(addr),
    .operation(operation),
    .pc_en(pc_en)
);

// 时钟生成
always #5 clk = ~clk;

initial begin
    // 初始化信号
    clk = 0;
    rst = 0;
    data_in = 16'h1234;
    initial_addr = 8'h06;
    
    $display("=== CPU测试开始 ===");
    $display("时间\tPC_EN\t地址\t操作码\tAC");
    $display("--------------------------------");
    
    // 复位
    #10;
    rst = 1'b1;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    
    // 运行并打印信息
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    #10;
    $display("%0t\t%b\t%h\t%h\t%h", $time, pc_en, addr, operation, ac);
    $display("=== CPU测试结束 ===");
    #500;
    $stop;
end

endmodule