`timescale 1ns/100ps // 1 ns time unit, 100 ps resolution

module test_blink;
    reg clk;
    always #5 clk = ~clk;
    
    reg clr;
    wire [3:0] cnt;
    

    blink blink_0
    (
        .clk(clk),
        .clr(clr),
        .cnt(cnt)
    );

    initial begin
        $dumpfile("wave.vcd");      // create a VCD waveform dump called "wave.vcd"
        $dumpvars(0, test_blink);   // dump variable changes in the testbench

        $monitor("t=%-4d: cnt = %d", $time, cnt);
        
        clk <= 0;
        
        #20 clr <= 1;
        #40 clr <= 0;
        #60 clr <= 1;
        #80 clr <= 0;

        #20 $finish();
    end
endmodule
