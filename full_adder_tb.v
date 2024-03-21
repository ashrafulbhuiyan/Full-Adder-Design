module full_adder_tb; 
	reg [3:0] a, b; 
	wire [3:0] sum; 
	reg clk, rst; 
	wire cout; 
	
	full_adder fa1( .sum(sum), 
			.cout(cout), 
			.a(a), 
			.b(b), 
			.clk(clk), 
			.rst(rst)
		);

	initial begin 
		a =0; b =0; clk=0; rst =0; 
	#10 rst = 1; 
	#200 $finish ; 
	end
	
	always #5 clk=~clk; 
	always #10 b = (b+1); 
	always #20 a = (a+1); 

endmodule 
