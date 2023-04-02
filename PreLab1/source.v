`timescale 1ns / 1ns
module source(cc, aa, bb);

input wire [1:0]aa; // 2 bit
input wire [1:0] bb; // 2 bit
output wire [1:0] cc; // 2 bit


wire term1_and;
wire term2_and;
wire term3_and;

wire term4_and;
wire term5_and;
wire term6_and;

and(term1_and, !aa[1], !aa[0], bb[1], bb[0]);
and(term2_and, !aa[1], aa[0]);
and(term3_and, aa[1], bb[1]);


or(cc[0], term1_and, term2_and,term3_and);


and(term4_and, !aa[1], !aa[0], bb[1], bb[0]);
and(term5_and, !aa[1], aa[0], bb[1]);
and(term6_and, aa[1], !bb[1]);

or(cc[1], term4_and, term5_and,term6_and);

endmodule
