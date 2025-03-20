`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 01:33:34
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testbench();

    logic              clk;
    logic              reset;
    logic [31:0] WriteData, DataAdr;
    logic              MemWrite;
    
    // instantiate device to be tested
    top dut(clk, reset, WriteData, DataAdr, MemWrite);
    
    // initialize test
    initial
    begin
        reset <= 1; # 22; reset <= 0;
    end
     
    // generate clock to sequence tests
    always
    begin
        clk <= 1; # 5; clk <= 0; # 5;
    end
    
    // check results
    always @(negedge clk)
    begin
        if(MemWrite) begin
        $display("DataAdr read:");
        $display(DataAdr);
        $display("WriteData read:");
        $display(WriteData);
        $display("-------------------------------------------");
        if(DataAdr === 100 & WriteData === 25) begin
            $display("Simulation succeeded");
            $stop;
        end else if (DataAdr === 96 & WriteData === 7) begin
            $display("Fist SW instruction good :)");
        end else
            $display("Failure :(");
        end
    end

 endmodule
