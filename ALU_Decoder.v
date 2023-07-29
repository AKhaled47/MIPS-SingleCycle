module ALU_Decoder (
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [2:0] ALUControl
);

always @(*) begin
    ALUControl=3'b000;
    casex (ALUOp)
       2'b00 : 
       ALUControl=3'b010;
       2'bx1:
       ALUControl=3'b110;
       2'b1x:
       begin
        case (Funct)
              6'b100000 :
              ALUControl=3'b010;
               6'b100010 :
              ALUControl=3'b110;
               6'b100100 :
              ALUControl=3'b000;
               6'b100101 :
              ALUControl=3'b001;
               6'b101010 :
              ALUControl=3'b111;
            default: 
              ALUControl=3'b000;
        endcase
       end
     
        default: 
         ALUControl=3'b000;
    endcase
end
    
endmodule