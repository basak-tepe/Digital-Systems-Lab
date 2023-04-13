`timescale 1ns / 1ns
module testbench();

reg [2:0] yy;
reg [1:0] ss;
wire zz;

mux m(zz, yy, ss);

initial begin
    $dumpfile("TimingDiagramMux.vcd");
    $dumpvars(0,zz, yy, ss);
    	
    yy = 3'b000;
    ss = 2'b00;
    #20;
   
    yy = 3'b010;
    ss = 2'b00;
    #20;

    yy = 3'b010;
    ss = 2'b01;
    #20;

    yy = 3'b011;
    ss = 2'b01;
    #20;

    yy = 3'b011;
    ss = 2'b10;
    #20;   

    yy = 3'b000;
    ss = 2'b10;
    #20;

    yy = 3'b111;
    ss = 2'b11;
    #20;

    yy = 3'b100;
    ss = 2'b11;
    #20;

    $finish;
end

endmodule