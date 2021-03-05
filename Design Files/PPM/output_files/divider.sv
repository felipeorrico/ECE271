module divider10m(input logic clk, reset, output logic divided);
	
	typedef enum logic [3:0] {A, B, C, D, E, F, G, H, I, J} State;
	
	State currentState, nextState;
	
	always_ff@(posedge clk)
		if (reset) currentState <= A;
		else currentState<= nextState;
		
	always_comb
		
		case(currentState)
			A: nextState = B;
			B: nextState = C;
			C: nextState = D;
			D: nextState = E;
			E: nextState = F;
			F: nextState = G;
			G: nextState = H;
			H: nextState = I;
			I: nextState = J;
			J: nextState = A;
			default: nextState = A;
		endcase
		
		assign divided = (currentState == J);
		
endmodule 