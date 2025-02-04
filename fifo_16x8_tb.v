module fifo16x8_tb();

    reg [7:0] wr_data;
    reg we, re;
    reg reset, clock;
    wire full, empty;
    wire [7:0] data;

    fifo16x8 DUT(.full(full),.empty(empty),.data(data),.wr_data(wr_data),
    .we(we),.re(re),.reset(reset), .clock(clock));

    initial
    begin
        clock = 1'b0;
        forever #5 clock = ~clock;
    end

    task rst;
    begin
        @(negedge clock) reset = 1'b1;
        @(negedge clock) reset = 1'b0;
    end
    endtask

    task initialize;
    begin
        we = 1'b0;
        re = 1'b0;
        wr_data = 8'b0;
    end
    endtask

    task write(input [7:0] i);
    begin
        @(negedge clock)
        we = 1'b1;
        wr_data = i;
        @(negedge clock)
        we = 1'b0;  // Reset after the write operation
    end
    endtask

    task read;
    begin
        @(negedge clock)
        re = 1'b1;
        @(negedge clock)
        re = 1'b0;  // Reset after the read operation
    end
    endtask

    initial
    begin
        initialize;
        rst;
        repeat(17) write($random);
        we = 1'b0;
        repeat(17) read;
        re = 1'b0;
    end

endmodule
