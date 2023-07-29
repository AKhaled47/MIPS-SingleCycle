module Register_File(
input [4:0] A1,A2,A3,
input [31:0] WD3,
input WE3,clk,rst_n,
output reg [31:0] RD1,RD2
);

reg [31:0] Reg_MEM [0:31];
integer i;



always@(posedge clk , negedge rst_n)
begin
if(rst_n==0)
begin
 for(i=0;i<32;i=i+1)
begin
Reg_MEM[i]<=0;
end
end
else if (WE3)
    Reg_MEM [A3]<= WD3;
end




always @(*) begin
    RD1=Reg_MEM[A1];
    RD2=Reg_MEM[A2]; 
end

endmodule