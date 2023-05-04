`timescale 1ns/1ns
module testbench();
wire [63:0] memory;
wire [7:0] r1;
wire [7:0] r2;
wire [7:0] r3;
reg [11:0] instruction;
reg clk;
integer i;

source s(memory, instruction, r1, r2, r3, clk);

initial begin
    $dumpfile("TimingDiagram.vcd");
    $dumpvars(0, memory, instruction, r1, r2, r3, clk);
	/*
	000 operation code
	000 r1
	000 r2
	000 r3
	r3(memory[0]) = r1(memory[3]) + r2(memory[7])
	*/
	instruction = 12'b000011111000;
	#20;
	instruction = 12'b000001000001;
	#20;
	instruction = 12'b101000001010;
	#20;
	instruction = 12'b110000001011;
	#20;
    
    
    
    $finish;
end

always begin	
	clk = 1;
	#10;
	clk = 0;
	#10;
end

endmodule
