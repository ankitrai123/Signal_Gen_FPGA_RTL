`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.01.2025 17:02:37
// Design Name: 
// Module Name: not
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

module not_gate (
    input wire a,      // Input
    output wire y      // Output
);

    assign y = ~a;     // NOT operation (inversion)

endmodule
