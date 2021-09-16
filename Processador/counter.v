/*
Prática II - Modulo do counter
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module counter(clock, inc_pc, data, Rin, q);
	input	  clock;
	input	  inc_pc;
	input	[15:0]  data;
	input Rin;
	reg [15:0] value;
	output reg [15:0]  q;
	
	
	initial begin
		value = 16'b0;
	end
	
	always@(posedge clock)
	begin	
		if(Rin)begin
			q = data;	
		end
		else if(~Rin && inc_pc)begin
			q = value + 1'b1;		
		end	
	end
	
endmodule
	