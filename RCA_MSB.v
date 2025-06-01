`timescale 1ns / 1ps

module RCA #(parameter M=8)(
    input [M-1:0]A,B,
    input Cin,
    output [M-1:0]sum,
    output Cout
    );
    

    wire [M-1:0]Propagate;
    wire [M-1:0]carry;

        
(*RLOC = "X0Y0" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst0(
	.O(Propagate[0]),
	.I0(A[0]),
	.I1(B[0]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y0" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst1(
	.O(Propagate[1]),
	.I0(A[1]),
	.I1(B[1]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y0" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst2(
	.O(Propagate[2]),
	.I0(A[2]),
	.I1(B[2]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y0" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst3(
	.O(Propagate[3]),
	.I0(A[3]),
	.I1(B[3]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y1" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst4(
	.O(Propagate[4]),
	.I0(A[4]),
	.I1(B[4]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y1" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst5(
	.O(Propagate[5]),
	.I0(A[5]),
	.I1(B[5]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y1" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst6(
	.O(Propagate[6]),
	.I0(A[6]),
	.I1(B[6]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
(*RLOC = "X0Y1" *)LUT6 #(.INIT(64'h0000000000000006))RCA_lut_inst7(
	.O(Propagate[7]),
	.I0(A[7]),
	.I1(B[7]),
	.I2(1'b0),
	.I3(1'b0),
	.I4(1'b0),
	.I5(1'b0)
	);
	
//carry chain
(*RLOC = "X0Y0"*)CARRY4 carry_chain_inst0(
.CO(carry[3:0]),
.O(sum[3:0]),
.CI(Cin),
.CYINIT(),
.DI(A[3:0]),
.S(Propagate[3:0])
);

(*RLOC = "X0Y1"*)CARRY4 carry_chain_inst1(
.CO(carry[7:4]),
.O(sum[7:4]),
.CI(carry[3]),
.CYINIT(),
.DI(A[7:4]),
.S(Propagate[7:4])
);
        
assign Cout=carry[7];
endmodule
