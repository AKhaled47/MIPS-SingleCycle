module top_module (
    input clk,rst_n,
    output signed [31:0] result
);
wire [31:0] PC,instr,SRCA,SRCB,SRCB_reg,SignImm,ALUResult,ReadData,PC_next,PC_plus4,PC_Branch,PC_Jump,PC_notjump;

wire MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,zero;

wire [2:0] ALUControl;

wire [4:0] WriteReg;

instruction_mem u1 (PC,instr);

Contol_unit u2 (instr [31:26], instr [5:0] , MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump,ALUControl);

mux2to1 #(.N(5)) u3 (instr[20:16],instr[15:11],RegDst,WriteReg);

Register_File u4 (instr[25:21],instr[20:16],WriteReg,result,RegWrite,clk,rst_n,SRCA,SRCB_reg);

sign_extend u5 (instr[15:0],SignImm);

mux2to1 u6 (SRCB_reg,SignImm,ALUSrc,SRCB);

ALU u7 (SRCA,SRCB,ALUControl,zero,ALUResult);

Data_Memory u8 (ALUResult,SRCB_reg,MemWrite,clk,rst_n,ReadData);

mux2to1 u9 (ALUResult,ReadData,MemtoReg,result);

PC_FF u10 (PC_next,rst_n,clk,PC);

pcplus4 u11 (PC,PC_plus4);

pcbranch u12 (SignImm,PC_plus4,PC_Branch);

mux2to1 u13 (PC_plus4,PC_Branch,(zero & Branch),PC_notjump);

mux2to1 u14 (PC_notjump,PC_Jump,jump,PC_next);

PCJump u15 (PC_plus4[31:28],instr[25:0],PC_Jump);
 




endmodule