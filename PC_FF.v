module PC_FF (
    input [31:0] PC_next,
    input rst_n,clk,
    output reg [31:0] PC
);

always @(posedge clk ,negedge rst_n) begin
    if(!rst_n)
    PC <= 0;
    else
    PC<=PC_next;
end
    
endmodule