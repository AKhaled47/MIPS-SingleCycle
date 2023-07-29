module Data_Memory (
input [31:0] A, WD,
input WE ,clk,rst_n,
output reg [31:0] RD
);

reg [31:0] DATA_MEM [0:31];
integer i;

always @(posedge clk , negedge rst_n) begin
 if(rst_n==0)
begin
 for(i=0;i<(2**32);i=i+1)
begin
DATA_MEM[i]<=0;
end
end
else if (WE)
DATA_MEM[A]<= WD;

end

always @(*) begin
    RD=DATA_MEM[A];
end

endmodule