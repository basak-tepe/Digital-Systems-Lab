`timescale 1ns / 1ns
module testbench();

reg [6:0] x;
wire [2:0] yy;

encoder enc(yy, x);

initial begin
    $dumpfile("TimingDiagramEncoder.vcd");
    $dumpvars(0, yy, x);
    	
    x = 7'b0000000;
    #20;
    x = 7'b0000001;
    #20;
    x = 7'b0010010;
    #20;
    x = 7'b1010001;
    #20;
    x = 7'b0001111;
    #20;
    x = 7'b1001111;
    #20;
    x = 7'b1111101;
    #20;
    x = 7'b1111111;
    #20;	
    $finish;
end

endmodule