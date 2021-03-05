module PPM (input logic directionr, directionl, clk, enable,input logic [2:0] multiplier, output logic waver, wavel);
	
	
	//left side
	logic [13:0]countl;
	logic [10:0]high_timel;
	logic [1:0] direction1;
	
	always_ff@(posedge clk)
	begin
		if (directionl) direction1<= -1;
		assign high_timel = (1500 + (direction1*multiplier*125)/2);
	
	end
	
	always_ff@(posedge clk) 
	begin 
		countl++;
		if(countl < high_timel) wavel <=1;
		else if (countl < 10000 + high_timel) wavel<=0;
		else countl <= 0;
	end

	//right side
	logic [13:0]countr;
	logic [10:0]high_timer;
	logic [1:0] direction2;
	
	always_ff@(posedge clk)
	begin
		if (directionr) direction2<= -1;
		assign high_timer = (1500 + (direction2*multiplier*125)/2);
	
	end
	
	always_ff@(posedge clk) 
	begin 
		countr++;
		if(countr < high_timer) waver <=1;
		else if (countr < 10000 + high_timer) waver<=0;
		else countr <= 0;
	end
	
	
endmodule 