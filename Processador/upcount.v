/*
Prática II - Modulo do upcount
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module upcount(Clear, Clock, Q);
	input Clear, Clock;
	output [2:0] Q;
	
	initial begin
		Q <=0;	
	end
	
	reg [2:0] Q;
	always @(posedge Clock)
		if (Clear)
			Q <= 3'b0;
		else
			Q <= Q + 1'b1;
endmodule


