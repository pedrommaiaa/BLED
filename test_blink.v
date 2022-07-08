`timescale 1ns/1ns // Time unit and time precision

module test_blink;
    // Variables we will inspect
    reg clk;
    wire led;

    // Instantiate the blink module (uut = unit under test)
    blink uut(clk, led);
    
    // Initial blocks run only once at the start of simulation
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(1, test_blink);

        // Generate the 25MHz clock signal
        forever begin
            clk = 1'b0;
            #40 // Delay for one cycle of 25MHz
            clk = ~clk; // Flip the signal level
        end
    end

    initial begin
        #1000000000 // Delay for 1 second (10^9 because time unit is 1ns)
        $finish; // Stop simulation (yeah, this stops the forever block as well)
    end
endmodule
