module ram16x8(
    input [7:0] wr_data,
    input wen,ren,
    input [3:0] w_addr, r_addr,
    input clock,rst,
    output reg [7:0] dout,
    integer i
    );
    reg [7:0]mem[15:0];
    always@(posedge clock)
    begin
        if(rst)
            begin
            dout=8'd0;
            for(i=0;i<16;i=i+1)
            begin
                mem[i]<=0;
            end
            end
            else
            begin
                if(wen==1)
                begin
                    mem[w_addr]<=wr_data;
                end
                if(ren==1)
                begin
                    dout<=mem[r_addr];
                end
            end
      end
            
    
endmodule
