/*
 * 74F153 (Dual 4-line to 1-line multiplexer
 * GEO 05/24/2013
 */
 
 
module part_74F153 (I0a, I1a, I2a, I3a, I0b, I1b, I2b, I3b, S0, S1, Ea_N, Eb_N, Ya, Yb);
 
	input I0a, I1a, I2a, I3a, I0b, I1b, I2b, I3b, S0, S1, Ea_N, Eb_N;
	output Ya, Yb;
	reg rYa, rYb;
	 
	always @(I0a or I1a or I2a or I3a or I0b or I1b or I2b or I3b or S0 or S1 or Ea_N or Eb_N)
	begin
		rYa = ((!Ea_N & !S0 & !S1 & I0a) | (!Ea_N & !S0 & S1 & I1a) | (!Ea_N & S0 & !S1 & I2a) | (!Ea_N & S0 & S1 & I3a));		
		rYb = ((!Eb_N & !S0 & !S1 & I0b) | (!Eb_N & !S0 & S1 & I1b) | (!Eb_N & S0 & !S1 & I2b) | (!Eb_N & S0 & S1 & I3b));		
	end
	 
	assign Ya = rYa;
	assign Yb = rYb;
 
endmodule
 