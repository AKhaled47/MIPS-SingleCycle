module top_module_tb;

reg clk,rst_n;
wire [31:0] result;

top_module u1 (clk,rst_n,result);

always
begin
 #5 clk=~clk;   
end

initial begin
    clk=0;
    rst_n=0;
    #2 rst_n=1;
    #150;
    $finish;
end

endmodule