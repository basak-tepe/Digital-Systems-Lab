`timescale 1ns / 1ns

// Put the last sequence you have tried below.

module source(y, stateReg, nextStateReg, x, rst, clk);

parameter inputseq = 64'b0001100000110011000011000001100000110000110000110000110000110000;

  output reg [0:0] y;
   output reg [2:0] stateReg;
  output reg [2:0] nextStateReg;
  input wire x;
  input wire rst;
  input wire clk;


  // State definitions
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  parameter S5 = 3'b101;
  parameter S6 = 3'b110;


 
  always @(stateReg,x) begin
      case (stateReg)
        S0: begin
          if (x == 0) begin
            nextStateReg <= S1;
        
          end else if (x == 1) begin
            nextStateReg <= S4;
           
          end
        end
        S1: begin
          if (x == 0) begin
            nextStateReg <= S2;
        
          end else if (x == 1) begin
            nextStateReg <= S4;
           
          end
        end
        S2: begin
          if (x == 1) begin
            nextStateReg <= S3; //here
           end
           else  begin
            nextStateReg <= S1;
          
          end
        end
        S3: begin
            if (x == 0) begin
            nextStateReg <= S1;
        
          end else if (x == 1) begin
            nextStateReg <= S5;
           
          end
          
          end
        S4: begin
          if (x == 0) begin
            nextStateReg <= S1;
          
          end else if (x == 1) begin
            nextStateReg <= S5;
           
          end
        end
        S5: begin
          if (x == 1) begin

            nextStateReg <= S4;
         
          end 
          else begin
            nextStateReg <= S6;
           end
          
        end
           S6: begin
          if (x == 0) begin
            nextStateReg <= S1;
          end
          else if (x == 1) begin
            nextStateReg <= S4;
           
          end

    
          end
      endcase
    end
  always@(posedge clk) begin
	if(rst) begin
		stateReg <= S0;
	end
	else begin
		stateReg <= nextStateReg;
	end

  $display("Current state: %d, Output value: %d", stateReg, y);

  case (stateReg)
    S3, S6: y <= 1;
    default: y <= 0;
  endcase
end


endmodule
