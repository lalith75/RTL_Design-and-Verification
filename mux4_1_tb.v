module mux4_1_tb();
reg [3:0]data_in;
reg [1:0]sel_in;
wire y_out;

mux4_1 DUT(.data_in(data_in),.sel_in(sel_in),.y_out(y_out));

initial
begin
    sel_in<=2'b00;
    data_in[0]<= 0;
    data_in[1]<= 0;
    data_in[2]<= 0;
    data_in[3]<= 0;
#10;
end

initial
begin
data_in[0]=1;data_in[1]=0;data_in[2]=1;data_in[3]=0;sel_in=2'b00;
#10;
data_in[0]=1;data_in[1]=0;data_in[2]=1;data_in[3]=0;sel_in=2'b00;
#10;
data_in[0]=1;data_in[1]=0;data_in[2]=1;data_in[3]=0;sel_in=2'b01;
#10;
data_in[0]=1;data_in[1]=1;data_in[2]=1;data_in[3]=0;sel_in=2'b01;
#10;
data_in[0]=0;data_in[1]=0;data_in[2]=0;data_in[3]=1;sel_in=2'b10;
#10;
data_in[0]=1;data_in[1]=1;data_in[2]=1;data_in[3]=0;sel_in=2'b10;
#10;
data_in[0]=1;data_in[1]=0;data_in[2]=1;data_in[3]=1;sel_in=2'b11;
#10;
data_in[0]=1;data_in[1]=0;data_in[2]=1;data_in[3]=1;sel_in=2'b11;
#10;

#10 $finish;
end
initial 
$monitor("The values are [%0t] data_in[0]=%b,data_in[1]=%b,data_in[2]=%b,data_in[3]=%b,sel_in=%b,y_out=%b",$time,data_in[0],data_in[1], data_in[2], data_in[3],sel_in,y_out);
endmodule
