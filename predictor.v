module predictor(input wire request, result, clk, taken, output reg prediction);
	reg [1:0] counter;
	initial begin
		counter = 2'h0;
	end
	always @(posedge clk) begin
		if (request) begin
			prediction <= counter[1];
		end
		if (result) begin
			if (taken) begin
				if (counter < 2'h3) counter <= counter + 1;
			end
			else begin
				if (counter > 2'h0) counter <= counter - 1;
			end
		end
	end
endmodule
