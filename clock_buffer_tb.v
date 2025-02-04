module clock_buffer_tb();
reg x;
wire out;
realtime t1,t2,t3,t4,t5,t6;

clock_buffer DUT(.x(x),.out(out));

initial
begin
    x=1'b0;
    forever #10 x=~x;
end

task master;
    begin
        @(posedge x) 
            t1=$realtime;
        @(posedge x)
            t2=$realtime;
        t3=t2-t1;
    end
endtask

task buff_out;
    begin
        @(posedge x) 
            t4=$realtime;
        @(posedge x)
            t5=$realtime;
        t6=t5-t4;
    end
endtask

task freq_phase;
    realtime f,p;
    begin
        f=t6-t3;
        p=t4-t1;
        $display("freq_diff=%0t, phase_diff=%0t",f,p);
    end
endtask

initial 
begin
    fork
    master;
    buff_out;
    join
freq_phase;
end
    

endmodule
