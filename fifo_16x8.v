module  fifo16x8(
    output full,
    output empty,
    output reg [7:0] data,
    input [7:0] wr_data,
    input we,re,
    input reset,
    input clock
);

    reg [4:0] count;
    reg [3:0] wr_pntr;
    reg [3:0] rd_pntr;
    reg [7:0] mem[15:0];
    integer i;

    assign full = (count >= 5'b01111) ? 1'b1 : 1'b0;
    assign empty = (count == 5'b0) ? 1'b1 : 1'b0;

    // Count logic
    always @(posedge clock)
    begin
        if (reset)
            count <= 5'b0;
        else if (we && !full)
            count <= count + 1;
        else if (re && !empty)
            count <= count - 1;
    end

    // Write logic
    always @(posedge clock)
    begin
        if (reset)
        begin
            wr_pntr <= 4'b0;
            for (i = 0; i < 16; i = i + 1)
                mem[i] <= 8'b0;
        end
        else if (we && !full)
        begin
            mem[wr_pntr] <= wr_data;
            wr_pntr <= wr_pntr + 1;
        end
    end

    // Read logic
    always @(posedge clock)
    begin
        if (reset)
        begin
            rd_pntr <= 4'b0;
            data <= 8'd00;
        end
        else if (re && !empty)
        begin
            data <= mem[rd_pntr];
            rd_pntr <= rd_pntr + 1;
            
        end
    end

endmodule
