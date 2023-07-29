module pcbranch(
    input [31:0] A,B,
    output reg [31:0] S
);

reg [31:0] Ax4;

always @(*) begin
    Ax4 = A<<2;
    S= Ax4+B;
end
endmodule