/*
Prática II - Modulo da TLB
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module TLB(enderecoVirtual, Clock, DIN, Data);
	input [15:0] enderecoVirtual;
	input Clock;
	output reg [15:0] DIN;
	output reg [15:0] Data;
	
	reg dirty [50:0];
	reg valido [50:0];
	
	reg [31:0] PaginaVirtual [50:0];
	
	reg [15:0] Dados         [50:0];
	
	integer Indice, Hit;
	integer i = 0;
	initial begin
	
			for(i = 0; i < 50; i=i+1) begin
				valido[i] = 1;
				dirty[i] = 0;			
			end
			//Codigo teste
			
			//Comente em baixo
			
			PaginaVirtual[1]  = 32'b00000000000000000000000000000100; // MVI R0, #2
			Dados[1] = 16'b0000000000000010;				// #2
			
			PaginaVirtual[2]  = 32'b00000000000000000000000000010100; // MVI R1, #3 
			Dados[2] = 16'b0000000000000011;				// #3
	
			PaginaVirtual[3]  = 32'b00000000000000000000000000010101;	// ADD R1, R0
			
			PaginaVirtual[4]  = 32'b00000000000000000000000000100100;	// MVI R2, #6
			Dados[4] = 16'b0000000000000110;				// #6 	
			
			PaginaVirtual[5]  = 32'b00000000000000000000000010100110;	// SUB R2, R1
			
			PaginaVirtual[6]  = 32'b00000000000000000000000100110011;	// MV R3, R2 
		
			PaginaVirtual[7]  = 32'b00000000000000000000000110000101;	// ADD R0,R3 
			
			PaginaVirtual[8]  = 32'b00000000000000000000000000010111;	// OR R1,R0
			
			PaginaVirtual[9]  = 32'b00000000000000000000000000010110;	// SUB R1,R0 
			
			PaginaVirtual[10] = 32'b00000000000000000000000110010101;	// ADD R1, R3 
			
			PaginaVirtual[11] = 32'b00000000000000000000000110011001;	// SLL R1, R3 
			
			PaginaVirtual[12] = 32'b00000000000000000000000110011010;	// SRL R1, R3 
		
			PaginaVirtual[13] = 32'b00000000000000000000000000000100;	// MVI R0, #0
			Dados[13] = 		  16'b0000000000000000;	// #0 		
			
			PaginaVirtual[14] = 32'b00000000000000000000000010001000;	// SLT R0, R1
			
			PaginaVirtual[15] = 32'b00000000000000000000000010011000;	// SLT R1, R1 
			
			PaginaVirtual[16] = 32'b00000000000000000000000000110100;	// MVI R3, #3
			Dados[16] = 		  16'b0000000000000011;	// #3 		
			
			PaginaVirtual[17] = 32'b00000000000000000000000000010100;	// MVI R1, #5
			Dados[17] = 		  16'b0000000000000101;	// #5 
			
			PaginaVirtual[18] = 32'b00000000000000000000000110000101;	// ADD R0, R3
			
			PaginaVirtual[19] = 32'b00000000000000000000000000000100;	// MVI R0, #0
			Dados[19] = 		  16'b0000000000000000;	// #0 
			
			PaginaVirtual[20] = 32'b00000000000000000000000110100000;	// LD R2, R3
			
			PaginaVirtual[21] = 32'b00000000000000000000000110100101;	// ADD R2, R3
			
			PaginaVirtual[22] = 32'b00000000000000000000000000100001;	// SD R2, R0
			
			PaginaVirtual[23] = 32'b00000000000000000000000000000000;	// LD R0, R0 
			
			PaginaVirtual[24] = 32'b00000000000000000000000110000110;	// SUB R0, R3
			
			PaginaVirtual[25] = 32'b00000000000000000000000000000100;	// MVI R0, #0
			Dados[25] = 		  16'b0000000000000000;	// #0 	
		
			PaginaVirtual[26] = 32'b00000000000000000000000000000101;	// ADD R0, R0
			
			PaginaVirtual[27] = 32'b00000000000000000000000100000010;	// MVNZ R0, R2
			
			PaginaVirtual[28] = 32'b00000000000000000000000110010110;	// SUB R1,R3 
			
			PaginaVirtual[29] = 32'b00000000000000000000000100000010;	// MVNZ R0, R2
			
			PaginaVirtual[30] = 32'b00000000000000000000000010000101;	// ADD R0, R1
			
			//Comente acima
			
			//Loop
			/*
			PaginaVirtual[1] = 32'b00000000000000000000000000100100;	// MVI R2, #1
			Dados[1] = 		 16'b0000000000000001;	// #1 		
			
			PaginaVirtual[2] = 32'b00000000000000000000000001000100;	// MVI R4, #10
			Dados[2] = 		 16'b0000000000001010;	// #10
			
			PaginaVirtual[3] = 32'b00000000000000000000001111010011;	// MV R5,R7
			
			PaginaVirtual[4] = 32'b00000000000000000000000101000110;	// SUB R4, R2
			
			PaginaVirtual[5] = 32'b00000000000000000000001011110010;	// MVNZ R7,R5
			*/
	end
	
	always @(*) begin
		//module TLB(enderecoVirtual, Clock, DIN, Data);
		
		DIN = 0;
      Indice = enderecoVirtual;
      Hit = 0;
		
		for(i = 0; i < 50; i = i + 1)begin
			if(i == Indice)begin
				if(valido[Indice] == 1)begin
					Hit = 1;
					DIN = PaginaVirtual[Indice][15:0];
					Data= Dados[Indice];
				end
			end		
		end
		
	end // always
	
endmodule
