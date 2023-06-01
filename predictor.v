module predictor(input wire request, result, clk, taken, output reg prediction);
	reg [1:0] counter;
	always @(posedge clk) begin
		if (request) begin
			prediction <= counter[1];
		end
		if (result) begin
			if (taken) begin
				if (counter < 3) counter <= counter + 1;
			end
			else begin
				if (counter > 0) counter <= counter - 1;
			end
		end
	end
endmodule
