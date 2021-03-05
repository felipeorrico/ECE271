module IRtoPPM (input logic [2:0]button, input logic clk, output logic [2:0]multiplier, output logic directionl, directionr, enable);

	//logic [2:0] multi;
	logic [2:0] previous;
	
	always_ff@(posedge clk)
	begin
		
		if (previous != 5 & button == 5) //up - vol
		begin
			multiplier++;
		end
		
		else if (previous != 6 & button == 6) //down - vol
		begin
			multiplier--;
		end
		
		else if (button == 4) //center
		begin
			enable = 0;
		end
		
		else if (button == 3) //right
		begin
			directionl = 1;
			directionr = 0;
			enable = 1;
		end
		
		else if (button == 2) //left
		begin
			directionl = 0;
			directionr= 1;
			enable = 1;
		end
		
		else if (button == 1) //down
		begin
			directionr = 0;
			directionr = 0;
			enable = 1;
		end
		
		else if (button == 0) //up
		begin
			directionr = 1;
			directionl = 1;
			enable = 1;
		end
		
		previous = button;
	
	end

endmodule 