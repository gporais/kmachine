// Testbench
module part_74F153_tb;

	reg I0a, I1a, I2a, I3a, I0b, I1b, I2b, I3b, S0, S1, Ea_N, Eb_N;
	wire Ya, Yb;

	part_74F153 U0 (
	.I0a (I0a),
	.I1a (I1a),
	.I2a (I2a),
	.I3a (I3a),
	.I0b (I0b),
	.I1b (I1b),
	.I2b (I2b),
	.I3b (I3b),
	.Ea_N (Ea_N),
	.Eb_N (Eb_N),
	.S0 (S0),
	.S1 (S1),
	.Ya (Ya),
	.Yb (Yb)
	);

	initial 
	begin
		Ea_N = 1;
		Eb_N = 1;
		S0 = 0;
		S1 = 0;
		{I3a, I2a, I1a, I0a} = 4'b0101;
		{I3b, I2b, I1b, I0b} = 4'b1010;
		
		#5 Ea_N = 0;
		#5 Ea_N = 1;
		#10 $finish;  
	end

	always @(Ya or Yb)
	begin
		$display($time, " Ya=%b Yb=%b",	Ya, Yb);
	end

endmodule
