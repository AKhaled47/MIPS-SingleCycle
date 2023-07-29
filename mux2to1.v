module mux2to1
#(parameter  N = 32 )(
    input [N-1 : 0] A,B,
    input sel,
    output reg [N-1 :0] OUT
);

always @(*) begin
    if(sel)
    OUT=B;
    else
    OUT=A;
end

endmodule