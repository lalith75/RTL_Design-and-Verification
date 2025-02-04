module alu_tb();
    reg [7:0] a_in;
    reg [7:0] b_in;
    reg [3:0] command_in;
    wire [15:0] d_out;
    reg oe;
    integer i;

    // Instantiate the ALU module
    alu DUT (
        .a_in(a_in),
        .b_in(b_in),
        .command_in(command_in),
        .d_out(d_out),
        .oe(oe)
    );

    initial begin
        // Initialize inputs
        oe = 1'b1;
        a_in = 8'd50;
        b_in = 8'd10;
        command_in = 4'd0;
        
        // Wait for the first command to execute
        #10;
    end

    initial begin
        // Loop through all command codes
        for (i = 0; i < 16; i = i + 1) begin
            #10 command_in = i;  // Apply each command with a delay
        end
        
        // End simulation after all commands are tested
        #200 $finish();
    end

    // Monitor the outputs
    initial begin
        $monitor("Time=%0t | command_in=%b, a_in=%d, b_in=%d, d_out=%d", $time, command_in, a_in, b_in, d_out);
    end
endmodule
