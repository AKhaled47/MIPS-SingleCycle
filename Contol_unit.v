module Contol_unit (
    input [5:0] Opcode,
    input [5:0] Funct,
    output  MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump,
    output  [2:0] ALUControl
);
wire [1:0] ALUOp;

main_decoder u1 (Opcode,MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump,ALUOp);
ALU_Decoder u2 (Funct,ALUOp,ALUControl);
endmodule