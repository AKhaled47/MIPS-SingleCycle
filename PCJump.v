module PCJump (
    input [3:0] up,
    input [25:0] down,
    output [31:0] out
);
    wire [27:0] down_mod;

    assign down_mod = down << 2;
    assign out = {up,down_mod};

endmodule