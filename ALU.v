module ALU (
    input [31:0] SRCA,SCRB,
    input [2:0] ALUControl,
    output zero,
    output reg signed [31:0] ALUResult
);

always @(*) begin
          ALUResult=0; 
case (ALUControl)
    3'b000 : 
        ALUResult = SRCA & SCRB; 
    3'b001 : 
        ALUResult = SRCA | SCRB; 
    3'b010 : 
        ALUResult = SRCA + SCRB; 
    3'b110 : 
        ALUResult = SRCA - SCRB; 
    3'b111 : 
        ALUResult = (SRCA < SCRB) ? 1:0; 
    default:
        ALUResult=0; 
endcase

end

assign zero = (ALUResult==0) ? 1:0;

endmodule