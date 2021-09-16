/*
Prática II - Modulo do regn
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module regn(R, Rin, Clock, Q);
	parameter n = 16;
	input [n-1:0] R;
	input Rin, Clock;
	output [n-1:0] Q;
	reg [n-1:0] Q;
	
	initial begin
		Q <=0;	
	end
	
	always @(posedge Clock)
		if (Rin)
			Q <= R;
endmodule
