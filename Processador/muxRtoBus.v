/*
Prática II - Modulo do multiplexador
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module muxRtoBus(muxSeletor,DINout, Gout, Rout, DIN, R0, R1, R2, R3, R4, R5, R6, R7, G, bus);
	input[9:0] muxSeletor;
	input [15:0] DIN, R0, R1, R2, R3, R4, R5, R6, R7, G;
	input Gout, DINout;
	input [7:0] Rout;
	output reg [15:0] bus;
	
	always @(*)
   begin // inicio
		
		case (muxSeletor)
			10'b0000000001: bus = DIN;
			10'b0000000010: bus = G;
			10'b0000000100: bus = R0;
			10'b0000001000: bus = R1;
			10'b0000010000: bus = R2;
			10'b0000100000: bus = R3;
			10'b0001000000: bus = R4;
			10'b0010000000: bus = R5;
			10'b0100000000: bus = R6;
			10'b1000000000: bus = R7;
		 endcase
	end //fim
	
endmodule
