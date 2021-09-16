/*
Prática II - Modulo do ULA
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module ULA(Dado1,Dado2,ULAOp,Result);
	
	input [15:0] Dado1,Dado2;
	input [3:0] ULAOp;
	
	output reg [15:0] Result;
	 
   always @(*)
   begin // inicio
       case (ULAOp)
			4'b0000: //LD
				begin
					//...
				end
			4'b0001: //ST
				begin
					//...
				end
			4'b0010: //MVNZ
				begin
					//...
				end
			4'b0011: //MV
				begin
					//...
				end
			4'b0100: //MVI
				begin
					//...
				end
			4'b0101: //ADD
				begin
					Result = Dado1 + Dado2;
				end
			4'b0110: //SUB
				begin
					Result = Dado1 - Dado2;
				end
			4'b0111: //OR
				begin
					Result = Dado1 | Dado2;
				end
			4'b1000: //SLT
				begin
					if(Dado1 < Dado2)begin
						Result = 1;
					end
					else
					if(Dado1 >= Dado2)begin
						Result = 0;
					end
				end
			4'b1001: //SLL
				begin
					Result = Dado1 << Dado2;
				end
			4'b1010: //SRL
				begin
					Result = Dado1 >> Dado2;
				end
		endcase
    end //fim
endmodule
