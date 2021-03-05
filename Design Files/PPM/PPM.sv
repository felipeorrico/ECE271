module PPM (input logic forward, back, clk,output logic wave);
	
	logic [13:0]count;
	logic [10:0]high_time;
	assign high_time = (1500 + forward*500 - back*500);
	
	always_ff@(posedge clk)
	begin 
		count++;
		if(count < high_time) wave <=1;
		else if (count < 10000 + high_time) wave<=0;
		else count <= 0;
	end

	endmodule 