module squarewave (input logic [9:0]distance, input logic clk, output logic wave);

	logic [13:0]count;
	logic [10:0]high_time;
	assign high_time = (2000/(distance/1000)) + 500;
	
	always_ff@(posedge clk)
	begin 
		count++;
		if(count < high_time) wave <=1;
		else if (count < 2*high_time) wave<=0;
		else count <= 0;
	end	


endmodule 