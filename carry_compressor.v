
`timescale 1ns / 1ps
//parameter K has to an even number
module carry_compressor #(parameter K=8)(
    input[K-1:0] A,B,
    input Cin,
    output [K/2-1:0]group_carry,
    output Cout
    );
    
//--------------------------------------------------------------
wire [K/2-1:0]group_propagate, group_generate;
//--------------------------------------------------------------


(*RLOC = "X0Y0"*)LUT6_2 #(.INIT(64'h000006600000FAA0)) CC_LUT_0(
.O6(group_propagate[0]),
.O5(group_generate[0]),
.I0(A[0]),
.I1(B[0]),
.I2(A[1]),
.I3(B[1]),
.I4(1'b0),
.I5(1'b1)
);

(*RLOC = "X0Y0"*)LUT6_2 #(.INIT(64'h000006600000FAA0)) CC_LUT_1(
.O6(group_propagate[1]),
.O5(group_generate[1]),
.I0(A[2]),
.I1(B[2]),
.I2(A[3]),
.I3(B[3]),
.I4(1'b0),
.I5(1'b1)
);

(*RLOC = "X0Y0"*)LUT6_2 #(.INIT(64'h000006600000FAA0)) CC_LUT_2(
.O6(group_propagate[2]),
.O5(group_generate[2]),
.I0(A[4]),
.I1(B[4]),
.I2(A[5]),
.I3(B[5]),
.I4(1'b0),
.I5(1'b1)
);

(*RLOC = "X0Y0"*)LUT6_2 #(.INIT(64'h000006600000FAA0)) CC_LUT_3(
.O6(group_propagate[3]),
.O5(group_generate[3]),
.I0(A[6]),
.I1(B[6]),
.I2(A[7]),
.I3(B[7]),
.I4(1'b0),
.I5(1'b1)
);
        
(*RLOC = "X0Y0"*)CARRY4 CC_carry_chain_0(
.CO(group_carry[3:0]),
.O(),
.CI(),
.CYINIT(Cin),
.DI(group_generate[3:0]),
.S(group_propagate[3:0])
);

assign Cout = group_carry[K/2-1];

endmodule