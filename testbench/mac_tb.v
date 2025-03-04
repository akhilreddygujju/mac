`include "./mac1.v"

module stimulus;

//wire [23:0]sum;
//wire [23:0] multiply;
wire [23:0] output_sum;
wire [7:0]a1;
reg[7:0] a; 
reg [7:0]w;
reg [23:0] carry_in;
reg clock;
reg reset;

mac1 mac11(output_sum,a1, a, w, carry_in,clock,reset);

initial 
begin
	
	clock=1'b0;
	reset=1'b1; 
	 forever #5 clock=~clock;

end
always @(posedge clock)
begin	
	
	 a=1; w=2;carry_in=0;reset=1'b0;
	 #10 a=3; w=4; 
	 #10a=5; w=6;
	#10 a=7; w=8;
	#10 $finish;

end

initial 
$monitor($time, " a= %0d, w= %0d, carry_in= %0d, a1= %0d, output_sum= %0d ", a,w,carry_in,a1,output_sum);
endmodule
	
		
