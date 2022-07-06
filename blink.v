module blink 
(
    input clk,          // posedge clock
    input clr,          // clear
    output reg[3:0] cnt // counter 
);
    always @(posedge clk) begin
        if (!clr)
            cnt <= 0;
        else
            cnt <= cnt + 1;
    end
endmodule
