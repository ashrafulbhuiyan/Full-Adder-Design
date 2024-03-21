module full_adder(sum, cout , a , b, clk, rst); 
	input [3:0] a, b; 
	input clk, rst;
	output reg [3:0] sum;
	output reg  cout;

	reg [3:0] A, B; 

 always@(posedge clk) begin
	A <= a; 
	B <= b;	
	 if (~rst) begin
		A <=0; 
		B <=0;
	 end
	
	else begin
		{cout, sum} <= A+B; 
	end
 end

endmodule 
