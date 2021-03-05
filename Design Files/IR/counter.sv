module counter #(parameter N = 8) (input logic sig, clk, reset_n, output logic [N-1:0]upt, output logic [N-1:0]downt);

	logic flag;
	
	always_ff@(posedge clk, negedge reset_n)
	begin
		if (!reset_n) 
			begin
				upt<=0;
				downt<=0;
			end
		if (sig)
			begin
				if (flag)
					begin
						flag = 0;
						upt <= 0;
					end
				upt<=upt + 1;
				downt<=0;
			end
		else if (!sig)
			begin
				downt<= downt + 1;
				flag = 1;
			end
	end 

endmodule 