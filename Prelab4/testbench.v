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

	//following instruction values are generated by Chatgpt

   		 instruction = 16'b0000000100000011; // r3 = memory[3]
 	#20  instruction = 16'b0001000100010000; // r3 = (r1 == r2)
  	#20  instruction = 16'b0010000100010011; // r3 = (r1 < r2)
	#20  instruction = 16'b0011000100010110; // r3 = (r1 <= r2)
 	#20  instruction = 16'b0100000100011001; // r3 = (r1 | r2)
 	#20  instruction = 16'b1000000100011000; // r3 = (r1 & r2)
 	#20  instruction = 16'b1001000100011001; // r3 = (r1 ^ r2)
 	#20  instruction = 16'b1010000100011010; // r3 = ~r1
	#20  instruction = 16'b1011000100011011; // r3 = (r1 + r2)
	#20  instruction = 16'b1100000100011100; // r3 = (r1 - r2)
 	#20  instruction = 16'b1101000100011101; // r3 = (r1 * r2)
	#20  instruction = 16'b1110000100011110; // r3 = (r1 / r2)
 	#20  instruction = 16'b1111000100011111; // r3 = (r1 % r2)

    $finish;
end

always begin	
	clk = 1;
	#10;
	clk = 0;
	#10;
end

endmodule
