`timescale 1ns/1ns
module testbench();
wire [127:0] memory;
wire [7:0] r1;
wire [7:0] r2;
wire [7:0] r3;
reg [15:0] instruction;
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

	//I added 4 some bits to the end of instruction bits to make it 16
	//instruction format: opcode - r1 - r2 - r3


	//r3 = r1 + r2
	instruction = 16'b1011110100100001;  //1111 became 0001
	#20;

	//r3 = (r1 - r2)
	instruction = 16'b1100111000100101;
	#20;

	//r3 = (r1 * r2)
	instruction = 16'b1101111101011011;
	#20;

	//r3 = (r1 & r2)
	instruction = 16'b1000011001111010;
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
