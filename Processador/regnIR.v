/*
Prática II - Modulo do regnIR
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module regnIR(R, Rin, Clock, Q);
	input [9:0] R;
	input Rin, Clock;
	output [9:0] Q;
	reg [9:0] Q;
	always @(posedge Clock)
		if (Rin)
			Q <= R;
endmodule
