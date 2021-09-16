/*
Prática II - Modulo do regnW
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module regnW(R, Clock, Q);
	input R;
	input Clock;
	output Q;
	reg Q;
	
	//initial begin
	//	Q <=0;	
	//end
	
	always @(posedge Clock)
			Q <= R;
			
endmodule
