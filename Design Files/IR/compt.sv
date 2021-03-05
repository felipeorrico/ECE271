module compt #(parameter N = 8) (input logic [N-1:0]a, input logic [N-1:0]b,input logic clk, output logic ab, output logic en_out);
	
		
	//a is uptime counter
	//b is down time counter
	
	assign ab = (a > 10); //if the uptime is greater than 1ms, this is 1
		
	typedef enum logic [1:0] {S0, S1, S2} statetype;
	
	statetype state, nextstate;//might have problem here
	
	always_ff@(posedge clk)
		begin
		
			if (b > 8) state <= S0; //reset state
			if (a > 15) state <= S1; //stand by state
			if (b > 0 & state == S1) state <= S2; //data state
			
			
		end
	
	always_comb
		case(state)
			S0: nextstate<=S1;
			S1: nextstate<=S2;
			S2: nextstate<=S0;
			default: nextstate<=S0;
		endcase
		
	assign en_out=(state==S2);
		

		
endmodule 