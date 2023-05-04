`timescale 1ns / 1ns

module source(memory, instruction, r1, r2, r3, clk);

input wire [15:0] instruction; //instruction register, updated from testbench
//an instructon has 4 parts. 12 bit is divided into 3 bits.
//first part: operation code opcode. decides the next op like xor addition...
//second part: index val for r1. r1 is loaded with memory[part2]
//third part: index val for r2. r2 is loaded with memory[part3]
//fourth part: index of r3. r1 op r2 = r3. value of r3 is written into memory[part4]

input wire clk;                //clock
parameter 	S0 = 4'b0000,
			S1 = 4'b0001,
			S2 = 4'b0010,
			S3 = 4'b0011,
			S4 = 4'b0100,
			S5 = 4'b0101,
			S6 = 4'b0110,
			S7 = 4'b0111,
			S8 = 4'b1000,
			S9 = 4'b1001,
			S10 = 4'b1010,
			S11 = 4'b1011,
			S12 = 4'b1100,
			S13 = 4'b1101,
			S14 = 4'b1110,
			S15 = 4'b1111;

		
integer i;
integer s;
		
output reg [127:0] memory; //memory register 16x8bit value register
//memory[2] means memory[23:16]
output reg [7:0]r1;  //CPU register 1
output reg [7:0]r2;  //CPU register 2
output reg [7:0]r3;  //CPU register 3

initial begin
	memory = 0;
	r1 = 0;
	r2 = 0;
	r3 = 0;
end

always@(posedge clk) begin
	// Read the first operand from the memory.
	s = 0;
	for (i = instruction[11:8] * 8; i < (instruction[11:8] * 8) + 8; i++) begin
		r1[s] = memory[i];
		s = s + 1;
	end
	// Read the second operand from the memory.
	s = 0;
	for (i = instruction[7:4] * 8; i < (instruction[7:4] * 8) + 8; i++) begin
		r2[s] = memory[i];
		s = s + 1;
	end
	// Perform the requested operation according to the given operation code.
	// Update each case and add remaining cases.
	
	// instruction [11:0]: (opcode)(r1)(r2)(r3)
	// 000-011: r3 = instruction[10:3] - b000011111000
	// 100: r3 = r1 + r2
	// 101: r3 = r1 & r2
	// 110: r3 = r1 % r2
	// 111: r3 = 


//TASK
//Update the case statements in the module with the following opcodes.
//0000 r3 = instruction[11:4]       0      DONE
//0001 r3 = r1 == r2                1      DONE
//0010 r3 = r1 < r2                 2      DONE
//0011 r3 = r1 <= r2                3      DONE
//0100 r3 = r1 | r2 (or)            4      DONE
//what happened to 5 6 7 0101 0110 0111 ? a question for irem.
//1000 r3 = r1 & r2 (and)           8      DONE
//1001 r3 = r1 ^ r2 (xor)           9      DONE
//1010 r3 = ~r1 (r2 is unused)      10     DONE
//1011 r3 = r1 + r2                 11     DONE
//1100 r3 = r1 - r2                 12     DONE
//1101 r3 = r1 * r2                 13     DONE
//1110 r3 = r1 / r2                 14     DONE
//1111 r3 = r1 % r2                 15     DONE


	case(instruction[15:12])
		S0: begin
			// Write instruction[10:3] into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = instruction[10:3] >> s;
				s = s + 1;
			end 
		end
		S1: begin
			//Perform the comparison operation ==. 
			r3 = r1  == r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S2: begin
	        //Perform the comparison operation <. 
			r3 = r1 < r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S3: begin
		     //Perform the comparison operation <=. 
			r3 = r1 <= r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S4: begin
			// Perform the or operation.
			r3 = r1 | r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S5: begin
			// Perform the and operation.
			r3 = r1 & r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S6: begin
			// Perform the xor operation.
			r3 = r1 ^ r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end
		S7: begin
			// Perform the modulo operation.
			r3 = r1 % r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S8: begin
			// Perform the and operation.
			r3 = r1 & r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S9: begin
			// Perform the xor operation.
			r3 = r1 ^ r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S10: begin
			// Perform the not operation.
			r3 = ~r1;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S11: begin
			// Perform the addition operation.
			r3 = r1 + r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

	
		S12: begin
			// Perform the subtraction operation.
			r3 = r1 - r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S13: begin
			// Perform the multiplication operation.
			r3 = r1 * r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end


		S14: begin
			// Perform the division operation.
			r3 = r1 / r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

		S15: begin
			// Perform the modulo operation.
			r3 = r1 % r2;
			// Write the value of the result into the memory.
			s = 0;
			for (i = instruction[3:0] * 8; i < (instruction[3:0] * 8) + 8; i++) begin
				memory[i] = r3[s];
				s = s + 1;
			end 
		end

	endcase
end

endmodule
