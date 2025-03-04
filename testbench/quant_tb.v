`include "./test1.v"
//`timescale 1ns/1ps
module stimulus;

wire [23:0] sum4,sum8,sum12,sum16;
wire [7:0] qsum4, qsum8,qsum12,qsum16;
wire [23:0] limited_sum4, limited_sum8, limited_sum12, limited_sum16;
reg[7:0] a11, a12, a13, a14,  w11, w12, w13, w14,w21,w22, w23, w24,w31,w32,w33,w34,w41,w42,w43,w44;
reg[7:0]  w_11,w_12,w_13, w_14,w_21,w_22,w_23, w_24,w_31,w_32,w_33, w_34,w_41, w_42,w_43,w_44;
reg[7:0] a_11,a_12,a_13, a_14, a_21,a_22,a_23, a_24, a_31,a_32,a_33, a_34, a_41, a_42,a_43,a_44;
reg[23:0] carry_in;


wire [23:0] activated_sum4, activated_sum8, activated_sum12, activated_sum16;
wire[7:0]rsum4, rsum8, rsum12, rsum16;


reg clock;
reg reset;
test test11( sum4,sum8,sum12,sum16,qsum4, qsum8,qsum12,qsum16,limited_sum4, limited_sum8, limited_sum12, limited_sum16,activated_sum4, activated_sum8, activated_sum12, activated_sum16,rsum4, rsum8, rsum12, rsum16, a11, a12, a13, a14, w11, w12, w13, w14,w21,w22, w23, w24,w31,w32,w33,w34,w41,w42,w43,w44, carry_in, clock,reset);

initial 
begin
	 w_11<=1;w_12<=2;w_13<=3; w_14<=4;
	 w_21<=1;w_22<=2;w_23<=3; w_24<=4;  // Weight memory 
         w_31<=1;w_32<=2;w_33<=3; w_34<=4;
	 w_41<=1; w_42<=2;w_43<=3;w_44<=4;	


 	 a_11<=4;a_12<=0;a_13<=2; a_14<=1;
	 a_21<=4;a_22<=3;a_23<=2; a_24<=0;
         a_31<=4;a_32<=3;a_33<=0; a_34<=1; // Feature memory
	 a_41<=4; a_42<=3;a_43<=2;a_44<=1;                   


end

initial 
begin
	reset=1'b1;
	clock=1'b0;
	
	 forever #5 clock=~clock;

end
always @(posedge clock)
begin	
	
	carry_in=0; reset=0;
	    a11=a_11;  	         			w11=w_11;  w21=w_21; w31=w_31; w41=w_41;
	#10 a11=a_12; a12=a_21; 			w12=w_12;  w22=w_22; w32=w_32; w42=w_42;
	#10 a11=a_13; a12=a_22; a13=a_31;		w13=w_13;  w23=w_23; w33=w_33; w43=w_43; 
	#10 a11=a_14; a12=a_23; a13=a_32; a14=a_41; 	w14=w_14;  w24=w_24; w34=w_34; w44=w_44; 
	#10 a11=0; a12=a_24; a13=a_33; a14=a_42;       	
	#10 a11=0; a12=0; a13=a_34; a14=a_43;                	     
	#10 a11=0; a12=0; a13=0; a14=a_44;                       	       
	#10 a11=0; a12=0; a13=0; a14=0;
	

	
	
	
	
	#30 $finish;

end

initial 
$monitor($time, " qsum4= %2d, qsum8= %2d,  qsum12= %2d, qsum16= %2d ",qsum4,qsum8,qsum12, qsum16);


endmodule





