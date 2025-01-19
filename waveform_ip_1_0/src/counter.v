`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.12.2024
// Design Name: 
// Module Name: frequency_counter
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

module counter(
    input  clk_in,                // Clock input
    input  nreset,                // Active low reset signal
    input  [31:0] PW_COVER,              // DF+PW+DR
    input  [31:0] DR,             
    input  [31:0] PRI, 
    input  [31:0] DR_PW,             // DR+PW
                                  
    output wire counter_out,          // Counter output
    output wire counter_out_cover,    // Coverage of the counter output
    
     output wire inv_counter_out,          // Counter output inverted
    output wire inv_counter_out_cover,    // Coverage of the counter output inverted
    
    output reg counter_out_reg,          // Counter output
    output reg counter_out_cover_reg ,
     
    output reg inv_counter_out_reg,          // Counter output
    output reg inv_counter_out_cover_reg  
);

  
    reg [31:0] counter ;

    
    assign counter_out = ((counter >= DR) && (counter <= (DR_PW)) && (nreset == 1'b1)) ? 1'b1 : 1'b0;
    assign counter_out_cover = ((counter >= 1) && (counter <= (PW_COVER)) && (nreset == 1'b1)) ? 1'b1 : 1'b0;

    
    assign inv_counter_out = ((counter >= DR) && (counter <= (DR_PW)) && (nreset == 1'b1)) ? 1'b0 : 1'b1;
    assign inv_counter_out_cover = ((counter >= 1) && (counter <= (PW_COVER)) && (nreset == 1'b1)) ? 1'b0 : 1'b1;
    
    
    
    always @(posedge clk_in) begin
        if (nreset == 1'b0) begin
            counter <= 0;
            
        end 
        else if (counter >= PRI) 
         begin
            counter <= 0;
            
         end 
        else
         begin
            
            counter <= counter + 1;
         end
    end
    
        always @(posedge clk_in) begin
        if (nreset == 1'b0) begin
             counter_out_reg<= 0;         // Counter output
             counter_out_cover_reg<= 0;  
             inv_counter_out_reg<= 0;         // Counter output
            inv_counter_out_cover_reg<= 0;
            
        end 
        else
         begin
            
            counter_out_reg<= counter_out;         // Counter output
            counter_out_cover_reg<= counter_out_cover;
            inv_counter_out_reg<= inv_counter_out;         // Counter output
            inv_counter_out_cover_reg<= inv_counter_out_cover;
         end
    end

endmodule
