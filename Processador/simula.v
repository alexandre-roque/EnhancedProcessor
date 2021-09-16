/*
Prática II - Modulo da simulação
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module simula;
	
	reg Resetn, Clock, Run;
	wire [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
	wire [2:0] Tstep_Q;
	
	localparam period = 200;	
	
	//module toplevel(DIN, DataIN, Resetn, Clock, Run);
	toplevel topLevel (Resetn, Clock, Run, R0,R1,R2,R3,R4,R5,R6,R7,Tstep_Q);
	
	
	initial
		begin
			
			Clock = 0;
			
		end
		
		initial
			begin
				forever
					begin       
				#20;	
				Clock = ~Clock;
			end //begin
		end //initial
		
		
		initial //YYYXXXIIII
			begin
				#1;
				Resetn = 1;
				Run = 1;
				#1;
				Resetn = 0;
				
				#6100;
				
				$finish;
		end
		
		
		

		  always@(R7) begin


			$display("");
			$display("+++++++++++++++++++++++++++++++++++++++++++++++++");
			$display("    enderecoVirtual = %d", topLevel.tlb.enderecoVirtual);
			$display("    DIN = %b, DataIN = %d", topLevel.proc.DIN, topLevel.proc.DataIN);
			$display("    R0    R1    R2    R3    R4    R5    R6    R7");
			$display("%d %d %d %d %d %d %d %d", topLevel.proc.R0, topLevel.proc.R1, topLevel.proc.R2, topLevel.proc.R3, topLevel.proc.R4, topLevel.proc.R5, topLevel.proc.R6, topLevel.proc.R7);
			$display("    STATEMENT 1 :: time is %0t",$time); 
			$display("");
			$display("+++++++++++++++++++++++++++++++++++++++++++++++++");
			

		  end
		


endmodule
