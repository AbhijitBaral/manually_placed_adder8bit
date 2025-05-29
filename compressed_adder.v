`timescale 1ns / 1ps
module compressed_adder #(parameter K=8)(
    input [K-1:0] A,B,
    input Cin,
    output [K-1:0] sum,
    output Cout
    );
    
    wire [K/2-1:0]group_carry;
    assign Cout = group_carry[K/2-1];

    (*RLOC_ORIGIN = "X0Y0", KEEP_HIERARCHY="yes"*)carry_compressor #(.K(K)) CC_inst(.A(A),.B(B), .Cin(Cin), .group_carry(group_carry), .Cout(Cout));
    
    //Compressed adder cells for K least significant bits
    
    LUT6_2 #(.INIT(64'hE11E877899996666))So_LUT_0(
        .O6(sum[1]),
        .O5(sum[0]),
        .I0(A[0]),
        .I1(B[0]),
        .I2(A[1]),
        .I3(B[1]),
        .I4(Cin),
        .I5(1'b1)
    );
    
    (*RLOC = "X2Y0"*)LUT6_2 #(.INIT(64'hE11E877899996666))So_LUT_1(
        .O6(sum[3]),
        .O5(sum[2]),
        .I0(A[2]),
        .I1(B[2]),
        .I2(A[3]),
        .I3(B[3]),
        .I4(group_carry[0]),
        .I5(1'b1)
    );
    (*RLOC = "X2Y0"*)LUT6_2 #(.INIT(64'hE11E877899996666))So_LUT_2(
        .O6(sum[5]),
        .O5(sum[4]),
        .I0(A[4]),
        .I1(B[4]),
        .I2(A[5]),
        .I3(B[5]),
        .I4(group_carry[1]),
        .I5(1'b1)
    );
    (*RLOC = "X2Y0"*)LUT6_2 #(.INIT(64'hE11E877899996666))So_LUT_3(
        .O6(sum[7]),
        .O5(sum[6]),
        .I0(A[6]),
        .I1(B[6]),
        .I2(A[7]),
        .I3(B[7]),
        .I4(group_carry[2]),
        .I5(1'b1)
    );

endmodule