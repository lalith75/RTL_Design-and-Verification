module siso4bit_tb();
reg si,clk,clear;
wire so;

siso4bit DUT(.si(si),.clk(clk),.clear(clear),.so(so));

initial
begin
    clk=1'b0;
    forever #5 clk=~clk;
end

task clr;
begin
    @(negedge clk) clear<=1'b1;
    @(negedge clk) clear<=1'b0;
end
endtask

task initialize;
begin
    {si,clear}=2'b01;
end
endtask

task si_in(input i);
begin
    @(negedge clk) si=i;
end
endtask

initial
begin
    initialize;
    clr;
    si_in(0);
    si_in(1);
    si_in(1);
    si_in(0);
    si_in(1);
    si_in(0);
    #100 $finish;
end
endmodule
