`timescale 1ns / 1ps
(*RLOC_ORIGIN = "X0Y12", KEEP_HIERARCHY="yes"*)
module fastAdder #(parameter L=16,M=8)(
        input [L-1:0] A,B,
        input Cin,
        output [L-1:0] sum,
        output Cout
        );
        
        localparam K=L-M;
        wire Cgen;
        
        (*RLOC_ORIGIN = "X0Y16", KEEP_HIERARCHY="yes"*)RCA #(.M(M)) RCA_inst(.A(A[L-1:K]), .B(B[L-1:K]), .Cin(Cgen), .sum(sum[L-1:K]), .Cout(Cout));
        (*RLOC_ORIGIN = "X0Y12", KEEP_HIERARCHY="yes"*)compressed_adder #(.K(K)) compressed_adder_inst(.A(A[K-1:0]), .B(B[K-1:0]), .Cin(Cin), .sum(sum[K-1:0]), .Cout(Cgen));
        
endmodule
