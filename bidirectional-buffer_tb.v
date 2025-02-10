module bidirectional_buff_tb();
wire a,b;
reg en;
reg tempa,tempb;
integer i;
bidirectional_buff DUT(.a(a),.b(b),.en(en));
assign a=en?tempa:1'bz;
assign b=~en?tempb:1'bz;
initial
begin
for(i=0;i<8;i=i+1)
    begin
    {tempa,tempb,en}=i;
    #10;
    end
end
initial begin
    #100; // Adjust the time as necessary to cover all test cases
    $finish;
end
initial
$monitor("The values are a=%b,b=%b,en=%b",a,b,en);
endmodule
