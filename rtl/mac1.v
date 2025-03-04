module mac1(
    output reg [23:0] temp,
    output reg [7:0] a1,
    input [7:0] a,
    input [7:0] w,
    input [23:0] carry_in,
    input clock,
    input reset // Asynchronous reset signal
);

reg [23:0] multiply;

// Combine asynchronous reset with positive edge clock sensitivity

always @(posedge clock or negedge reset) begin

    if (reset) begin  // Assert reset when reset is active
        multiply <= 0;  // Reset the multiplication result to 0
        temp <= 0;       // Reset temporary register
        a1 <= 0;        // Reset output register a1

    end 

    else begin
        multiply <= (a * w) + carry_in;  // Perform multiplication and add carry_in
    end

end

// Always block for a1 (unchanged)

always @(negedge clock)
begin
    temp <= multiply;  // Update temporary register
    a1 <= a;           // Update output register a1
end

endmodule
