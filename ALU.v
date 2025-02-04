module alu(
    input [7:0] a_in, b_in,      // 8-bit inputs
    input [3:0] command_in,      // 4-bit command input
    input oe,                    // Output enable signal
    output reg [15:0] d_out      // 16-bit output
    );
    
    always @(*) begin
        if (oe) begin
            case(command_in)
                // Arithmetic Operations (MSB of command_in is 0)
                4'b0000: d_out = a_in + b_in;           // Addition
                4'b0001: d_out = a_in - b_in;           // Subtraction
                4'b0010: d_out = a_in * b_in;           // Multiplication
                4'b0011: d_out = a_in / b_in;           // Division
                4'b0100: d_out = a_in << 1;             // Shift Left
                4'b0101: d_out = a_in >> 1;             // Shift Right
                4'b0110: d_out = {a_in[6:0], a_in[7]};  // Rotate Left
                4'b0111: d_out = {a_in[0], a_in[7:1]};  // Rotate Right
                
                // Logical and Comparison Operations (MSB of command_in is 1)
                4'b1000: d_out = a_in & b_in;           // AND
                4'b1001: d_out = a_in | b_in;           // OR
                4'b1010: d_out = a_in ^ b_in;           // XOR
                4'b1011: d_out = ~(a_in | b_in);        // NOR
                4'b1100: d_out = ~(a_in & b_in);        // NAND
                4'b1101: d_out = ~(a_in ^ b_in);        // XNOR
                4'b1110: d_out = (a_in == b_in) ? 16'd1 : 16'd0; // Equality Check
                4'b1111: d_out = (a_in != b_in) ? 16'd1 : 16'd0; // Inequality Check
                default: d_out = 16'd0;                 // Default case
            endcase
        end else begin
            d_out = 16'bz;  // High-impedance state when oe is not enabled
        end
    end    
endmodule
