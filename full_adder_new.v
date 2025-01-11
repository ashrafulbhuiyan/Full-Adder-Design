module full_adder(
    input wire clk,
    input wire rst,
    input wire a,
    input wire b,


    output reg sum,
    output reg cout
);


reg A;
reg B;


reg sum_d;
reg cout_d;


always @(posedge clk) begin
    if(~rst) begin
        A <= 0;
        B <= 0;
        sum_d <= 0;
        cout_d <= 0;
    end


    else begin
        A <= a;
        B <= b;
        sum <= sum_d;
        cout <= cout_d;
    end
end


always@(*) begin
    {cout_d, sum_d} <= A+B;
end


endmodule




module full_adder_tb;
    wire sum;
    wire cout;
    reg clk;
    reg rst;
    reg a;
    reg b;


    full_adder DUT(
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),


        .sum(sum),
        .cout(cout)
    );


    //Clock Generation
    initial begin
        clk = 0;  
        forever begin
          #5  clk = ~clk;
        end
    end


    initial begin
        a = 0 ; b = 0; rst = 0;
        repeat(1) @(negedge clk);
        rst = 1;
        @(negedge clk);
        a = 0; b = 1;
        @(negedge clk);
        a=1;  b=1;
        repeat(5) @(negedge clk)
        $finish;
    end
endmodule
