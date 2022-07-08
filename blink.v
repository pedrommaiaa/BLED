module blink(input clk, output led);
    reg	[23:0] cnt = 0;
    reg temp_led = 1'b0;

    always @(posedge clk) begin
        cnt <= cnt + 1;
        if (cnt >= 2500000) begin
            temp_led <= !temp_led;
            cnt <= 0;
        end
    end

    assign led = temp_led;

endmodule
