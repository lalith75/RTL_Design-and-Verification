module ram16x8_tb();
    reg [7:0] wr_data;
    reg wen,ren;
    reg [3:0] w_addr, r_addr;
    reg clock,rst;
    wire [7:0] dout;
    
    ram16x8 DUT(.wr_data(wr_data),.wen(wen),.ren(ren),
    .w_addr(w_addr),.r_addr(r_addr),.clock(clock),.rst(rst),.dout(dout));
    
    initial
    begin
    clock=0;
    forever #5 clock=~clock;
    end
    
    task initialize;
    begin
    wr_data=0;
    {rst,wen,ren}=3'b100;
    {w_addr,r_addr}=8'd0;
    end
    endtask
    
    task delay;
    begin
    #10;
    end
    endtask
    
    task reset;
    begin
    @(negedge clock) rst=1'b1;
    @(negedge clock) rst=1'b0;
    end
    endtask

    
    task write(input [7:0]i,input [3:0]j, input k);
    begin
    @(negedge clock)
    wr_data=i;
    w_addr=j;
    wen=k;
    end
    endtask
    
    task read(input [3:0]i,input j);
    begin
    @(negedge clock)
    r_addr=i;
    ren=j;
    end
    endtask
    
    initial
    begin
    initialize;
    reset;
    delay;
    write({$random},4'b1001,1'b1);
    delay;
    read(4'b1001,1'b1);
    delay;
    $finish;
    end
endmodule
