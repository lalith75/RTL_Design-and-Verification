module dec3to8_tb();
reg [2:0]in;
reg reset;
wire [7:0]out;
dec3to8 DUT(.in(in),.reset(reset),.out(out));

task rst();
    begin
    reset=1'b1;
    #10;
    reset=1'b0;
    end
endtask

initial
    begin
    rst();
    in=3'd0;#10;
    in=3'd5;#10;
    in=3'd2;#10;
    in=3'd0;#10;
    rst();#10;
    in=3'd1;#10;
    in=3'd7+3'd7;#10;
    $finish;
    end
    initial
    $monitor("The values are in=%d,reset=%b,out=%d",in,reset,out);
       
endmodule
