module dec3to8(
    input [2:0] in,
    input reset,
    output reg [7:0] out  // Declare 'out' as reg because it's assigned in an always block
);

    always @(*) begin
        if (reset == 1'b0) begin
            // Set all outputs to 0 initially
            out = 8'd0;
            // Based on input, set the corresponding bit to 1
            case (in)
                3'b000: out[0] = 1'b1;
                3'b001: out[1] = 1'b1;
                3'b010: out[2] = 1'b1;
                3'b011: out[3] = 1'b1;
                3'b100: out[4] = 1'b1;
                3'b101: out[5] = 1'b1;
                3'b110: out[6] = 1'b1;
                3'b111: out[7] = 1'b1;
                default: out = 8'd0;  // Default case to avoid latches
            endcase
        end else begin
            // When reset is active, drive the output to high-impedance state
            out = 8'bz;
        end
    end

endmodule
