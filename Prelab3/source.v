`timescale 1ns / 1ns

// Put the last sequence you have tried below.

module source(y, stateReg, nextStateReg, x, rst, clk);

parameter inputseq = 64'b0001100000110011000011000001100000110000110000110000110000110000;

output reg [0:0]y;
input wire x;
input wire rst;
input wire clk;

//7 STATES OF THE MOORE MACHINE
parameter 	A = 3'b000, 
            B = 3'b001, 
            C = 3'b010,
            D = 3'b011,
            E = 3'b100,
            F = 3'b101, 
            G = 3'b110;


//Defining registers and initializing them to 0.
output reg [2:0] stateReg = A;
output reg [2:0] nextStateReg = 3'b000;

//BELOW HERE 
always@(stateReg, x) begin
//FILL ABOVE
	case(stateReg)
		A: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= A;
			end
			else begin
				nextStateReg <= B;
			end
		end
		B: begin
			y <= 1'b1;
			if(x == 0) begin
				nextStateReg <= A;
			end
			else begin
				nextStateReg <= C;
			end
		end
		C: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= B;
			end
			else begin
				nextStateReg <= D;
			end
		end
		D: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= C;
			end
			else begin
				nextStateReg <= E;
			end
		end

        E: begin
			y <= 1'b0;
			if(x == 0) begin
				nextStateReg <= D;
			end
			else begin
				nextStateReg <= F;
			end
		end

        F: begin
			y <= 1'b1;
			if(x == 0) begin
				nextStateReg <= E;
			end
			else begin
				nextStateReg <= G;
			end
		end
        G: begin
			y <= 1'b1;
			if(x == 0) begin
				nextStateReg <= E;
			end
			else begin
				nextStateReg <= F;
			end
		end
	endcase
end

always@(posedge clk) begin
	if(rst) begin
		stateReg <= A;
	end
	else begin
		stateReg <= nextStateReg;
	end
end

endmodule