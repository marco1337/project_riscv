`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.03.2025 01:40:19
// Design Name: 
// Module Name: imem
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


module imem(
    input    logic [31:0] a,
    output logic [31:0] rd);
                    
    logic [31:0] RAM[63:0];
    logic [29:0] aux;
    initial
       //$readmemh("riscvtest.txt",RAM);
       $readmemh("riscvtest_basic.txt",RAM);
    
    assign aux = a[31:2];
    assign rd = RAM[a[31:2]]; // word aligned
    
 endmodule