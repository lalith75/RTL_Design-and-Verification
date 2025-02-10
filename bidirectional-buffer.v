module tristate(
    input en,
    input in,
    output out, output reg reg_out
    );
    assign out=reg_out;
    always @(*)
    begin
    if(en)
    begin
        reg_out<=in;
    end 
    else begin
        reg_out<=1'bz;
    end
    end
        
endmodule

module bidirectional_buff(inout a,inout b,input en);
wire w1;
not I1(w1,en);
tristate t1(.en(en),.in(a),.out(b));           /*assign a=en?b:1'bz;
                                                 assign b=~en?a:1'bz; */
tristate t2(.en(w1),.in(b),.out(a));
endmodule
