module main_decoder (
    input [5:0] Opcode,
    output reg MemtoReg,MemWrite,Branch,ALUSrc,RegDst,RegWrite,jump,
    output reg [1:0] ALUOp
);

always@(*)
begin
    RegWrite=0;
     RegDst=0;
     ALUSrc=0;
     Branch=0;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b00;
     jump=0;
case (Opcode)
   6'b0 :
   begin
     RegWrite=1;
     RegDst=1;
     ALUSrc=0;
     Branch=0;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b10;
   end 
   6'b100011 :
   begin
     RegWrite=1;
     RegDst=0;
     ALUSrc=1;
     Branch=0;
     MemWrite=0;
     MemtoReg=1;
     ALUOp=2'b00;
   end 
   6'b101011 :
   begin
     RegWrite=0;
     RegDst=0;
     ALUSrc=1;
     Branch=0;
     MemWrite=1;
     MemtoReg=0;
     ALUOp=2'b00;
   end 
   6'b000100:
   begin
     RegWrite=0;
     RegDst=0;
     ALUSrc=0;
     Branch=1;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b01;
   end 
   6'b001000 :
   begin
     RegWrite=1;
     RegDst=0;
     ALUSrc=1;
     Branch=0;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b00;
   end 
   6'b000010 :
   begin
     RegWrite=0;
     RegDst=0;
     ALUSrc=0;
     Branch=0;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b00;
     jump=1;
   end 
    default: 
     begin
     RegWrite=0;
     RegDst=0;
     ALUSrc=0;
     Branch=0;
     MemWrite=0;
     MemtoReg=0;
     ALUOp=2'b00;
     jump=0;
   end 
endcase
end
    
endmodule