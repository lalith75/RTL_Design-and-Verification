module mux4_1(
    input [3:0] data_in,
    input [1:0] sel_in,
    output reg [3:0]y_out
    );
//    wire w1,w2;
//    mux2_1 M1(.in({data_in[3],data_in[2]}),.select(sel_in[1]),.out(w1));
//    mux2_1 M2(.in({data_in[1],data_in[0]}),.select(sel_in[1]),.out(w2));
//    mux2_1 M3(.in({w2,w1}),.select(sel_in[0]),.out(y_out));
always @(*)
begin
    case(sel_in)
    2'b00:y_out=data_in[0];
    2'b01:y_out=data_in[1];
    2'b10:y_out=data_in[2];
    2'b11:y_out=data_in[3];
    endcase
end        
endmodule
