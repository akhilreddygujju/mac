`include "./mac1.v"

module test(
		output[23:0] sum4,sum8,sum12,sum16,
		//output[7:0] a1, a2, a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,
		output [7:0] qsum4, qsum8,qsum12,qsum16,
	    	output [23:0] limited_sum4, limited_sum8, limited_sum12, limited_sum16,
		output [23:0] activated_sum4, activated_sum8, activated_sum12, activated_sum16,
		output [7:0] rsum4, rsum8, rsum12, rsum16,
		


		input [7:0] i11, i12,i13, i14, w11, w12, w13, w14, w21,w22, w23, w24,w31,w32,w33,w34,w41,w42,w43,w44,
		input [23:0] carry_in,
		input clock,
		input reset
		);
wire[23:0] sum1,sum2, sum3, sum5,sum6, sum7, sum9, sum10, sum11,sum13, sum14, sum15;
wire[7:0] a1, a2, a3, a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16;

mac1 m1(sum1, a1, i11, w11, carry_in, clock,reset);
mac1 m2(sum2, a2, i12, w12, sum1, clock,reset);
mac1 m3(sum3, a3, i13, w13, sum2, clock,reset);
mac1 m4(sum4, a4, i14, w14, sum3, clock,reset);

mac1 m5(sum5, a5, a1, w21, carry_in, clock,reset);
mac1 m6(sum6, a6, a2, w22, sum5, clock,reset);
mac1 m7(sum7, a7, a3, w23, sum6, clock,reset);
mac1 m8(sum8, a8, a4, w24, sum7, clock,reset);

mac1   m9(sum9, a9, a5, w31, carry_in, clock,reset);
mac1 m10(sum10, a10, a6, w32, sum9, clock,reset);
mac1 m11(sum11, a11, a7, w33, sum10, clock,reset);
mac1 m12(sum12, a12, a8, w34, sum11, clock,reset);

mac1 m13(sum13, a13, a9, w41, carry_in, clock,reset);
mac1 m14(sum14, a14, a10, w42, sum13, clock,reset);
mac1 m15(sum15, a15, a11, w43, sum14, clock,reset);
mac1 m16(sum16, a16, a12, w44, sum15, clock,reset);

// quantization unit

assign limited_sum4 = (sum4 > 255) ? 24'd255 : sum4;
assign limited_sum8 = (sum8 > 255) ? 24'd255 : sum8;
assign limited_sum12 = (sum12 > 255) ? 24'd255 : sum12;
assign limited_sum16 = (sum16 > 255) ? 24'd255 : sum16;


 // Quantize the limited values

 assign qsum4 = limited_sum4[7:0];
 assign qsum8 = limited_sum8[7:0];
 assign qsum12 = limited_sum12[7:0];
 assign qsum16 = limited_sum16[7:0];


// **Activation Unit**
wire lt_tau4, lt_tau8, lt_tau12, lt_tau16; // signals for comparison with tau (assuming tau = 10)
wire [23:0] activated_sum4, activated_sum8, activated_sum12, activated_sum16;

assign lt_tau4 = qsum4 < 10;
assign activated_sum4 = lt_tau4 ? 0 : qsum4;

assign lt_tau8 = qsum8 < 10;
assign activated_sum8 = lt_tau8 ? 0 : qsum8;

assign lt_tau12 = qsum12 < 10;
assign activated_sum12 = lt_tau12 ? 0 :qsum12;

assign lt_tau16 = qsum16 < 10;
assign activated_sum16 = lt_tau16 ? 0 : qsum16;

// **Update final outputs with activated values**
assign rsum4 = activated_sum4;
assign rsum8 = activated_sum8;
assign rsum12 = activated_sum12;
assign rsum16 = activated_sum16;

endmodule
