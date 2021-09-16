/*
Prática II - Modulo do processador
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
module processador (DIN, Resetn, Clock, Run, Done, BusWires, DataIN, W, ADDR, DOUT, R7, Tstep_Q, DataFromMemory, R0,R1,R2,R3,R4,R5,R6,R7);
	parameter n = 16;
	// Declaração das entradas e saídas
	
	input [15:0] DIN;
	input [15:0] DataIN;
	input [15:0] DataFromMemory;
	input Resetn, Clock, Run;
	output reg Done;
	output reg [15:0] BusWires;
	output W;
	output [15:0] ADDR, DOUT;
	output [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
	output [2:0] Tstep_Q;
	
	//Declaração das variaveis
	reg [9:0]muxSeletor;
	
	reg [7:0]Rin;
	reg [7:0]Rout;
	
	reg Ain, DINout, IRin, Gin, Gout, DOUTin, ADDRin, incr_pc, W_D;
	
	wire [9:0] IR;
	wire [3:0] I;
	reg Imm;
	reg LD;
		
	reg [3:0]ULAOp;
	
	wire [15:0] A, G;
	wire [7:0] Xreg;
	wire [7:0] Yreg;
	wire [2:0] Tstep_Q;
	
	wire Clear = Done | Resetn;
	
	wire[n-1:0] resultadoULA, R0, R1, R2, R3, R4, R5, R6, R7;

	upcount Tstep (Clear, Clock, Tstep_Q);
	assign I = IR[3:0];
	dec3to8 decX (IR[6:4], 1'b1, Xreg);
	dec3to8 decY (IR[9:7], 1'b1, Yreg);
	
	always @(Tstep_Q or I or Xreg or Yreg or G) //YYYXXXIIII
			begin	

			//Especificações dos valores iniciais
			W_D = 1'b0;
			incr_pc = 1'b0;
			Imm = 1'b0;
			LD = 1'b0;
			
			Done = 1'b0;
			Ain = 1'b0; 
			DINout = 1'b0; 

			Gin = 1'b0; 
			Gout = 1'b0; 
			IRin = 1'b0; 
			
			Rin = 8'b0; 
			Rout = 8'b0;
			
			DOUTin = 1'b0;
			ADDRin = 1'b0;
			

			case (Tstep_Q)
				3'b000: // Passo 0
					begin
						incr_pc = 1'b1;
						Rout = 8'b1;
						ADDRin = 1'b1;	
					end
				3'b001: // Passo 1
					begin
						ADDRin = 1'b1;
						IRin = 1'b1;
					end
				3'b010: // Passo 2
					begin
						case (I)
							4'b0000: //LD
								begin
									ADDRin = 1;
									Rout = Yreg;
								end
							4'b0001: //ST
								begin
									DOUTin = 1;
									Rout = Xreg;
								end
							4'b0010: //MVNZ
								begin
									if (G != 0) begin
										Rin = Xreg;
										Rout = Yreg;
									end
									Done = 1'b1;
								end
							4'b0011: //MV
								begin
									Rin = Xreg;
									Rout = Yreg;
									Done = 1'b1;
								end
							4'b0100: //MVI
								begin
									Imm = 1'b1;
									DINout = 1'b1;
									Rin = Xreg;
									Done = 1'b1;
								end
							4'b0101: //ADD
								begin
									Ain = 1'b1;
									Rout = Xreg;		
								end
							4'b0110: //SUB
								begin
									Ain = 1'b1;
									Rout = Xreg;
								end
							4'b0111: //OR
								begin
									Ain = 1'b1;
									Rout = Xreg;
								end
							4'b1000: //SLT
								begin
									Ain = 1'b1;
									Rout = Xreg;
								end
							4'b1001: //SLL
								begin
									Ain = 1'b1;
									Rout = Xreg;
								end
							4'b1010: //SRL
								begin
									Ain = 1'b1;
									Rout = Xreg;
								end
							default:
							begin
							
							end
						endcase
					end
					
					
				3'b011: //define signals in time step 3
					begin
						case (I)
							4'b0001: //ST
								begin
									Rout = Yreg;
									W_D = 1'b1;
									ADDRin = 1'b1;
								end
							4'b0101: //ADD
								begin
									ULAOp = 4'b0101;
									Rout = Yreg;
									Gin = 1'b1;
								end
							4'b0110: //SUB
								begin
									ULAOp = 4'b0110;
									Rout = Yreg;
									Gin = 1'b1;
								end
							4'b0111: //OR
								begin
									ULAOp = 4'b0111;
									Rout = Yreg;
									Gin = 1'b1;
								end
							4'b1000: //SLT
								begin
									ULAOp = 4'b1000;
									Rout = Yreg;
									Gin = 1'b1;
								end
							4'b1001: //SLL
								begin
									ULAOp = 4'b1001;
									Rout = Yreg;
									Gin = 1'b1;
								end
							4'b1010: //SRL
								begin
									ULAOp = 4'b1010;
									Rout = Yreg;
									Gin = 1'b1;
								end
							default:
							begin
							
							end
						endcase
					end
					
					3'b100: //define signals in time step 3
					begin
						case (I)
							4'b0101: //ADD
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							4'b0110: //SUB
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							4'b0111: //OR
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							4'b1000: //SLT
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							4'b1001: //SLL
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							4'b1010: //SRL
								begin
									Rin = Xreg;
									Gout = 1'b1;
									Done = 1'b1;
								end
							default:
							begin
							
							end
						endcase
					end
					
					3'b101: //define signals in time step 3
					begin
						case (I)
							4'b0000: //LD
								begin
									LD = 1'b1;
									Rin = Xreg;
									DINout = 1'b1;
									Done = 1'b1;
								end						
						default:
						begin
							
						end
						
						endcase
					end
					
					default:
						begin
							
						end
				endcase
		end
		//regn reg_0 (BusWires, Rin[0], Clock, R0);
		//... instantiate other registers and the ula unit
			
		regn modReg0 (BusWires, Rin[0], Clock, R0); 
		regn modReg1 (BusWires, Rin[1], Clock, R1);
		regn modReg2 (BusWires, Rin[2], Clock, R2); 
		regn modReg3 (BusWires, Rin[3], Clock, R3);
		regn modReg4 (BusWires, Rin[4], Clock, R4); 
		regn modReg5 (BusWires, Rin[5], Clock, R5);
		regn modReg6 (BusWires, Rin[6], Clock, R6);
		//module counterR7 (clock,cnt_en,data,sclr,sload,q);
		counterR7 modReg7 (Clock, incr_pc, BusWires, Resetn, Rin[7], R7);
		
		regnIR modRegIR (DIN[9:0], IRin, Clock, IR);
		regn modRegA  (BusWires, Ain, Clock, A); 
		regn modRegG(resultadoULA, Gin, Clock, G);
		
		regn modRegADDR (BusWires, ADDRin, Clock, ADDR);
		regn modRegDOUT (BusWires, DOUTin, Clock, DOUT);
		regnW modRegW   (W_D, Clock, W);
	
		//ULA unit
		//module ULA(Dado1,Dado2,ULAOp,Result);
		ULA ula(A,BusWires,ULAOp,resultadoULA);
		
		  
		//... define the bus
		always @ (muxSeletor or Rout or Gout or DINout)
		  begin
			 muxSeletor[0] = DINout;
			 muxSeletor[1] = Gout;
			 muxSeletor[9:2] = Rout;	 
			 case (muxSeletor)
				10'b0000000100:
								begin
									BusWires = R0;
								end 
				10'b0000001000: 
								begin
									BusWires = R1;
								end 
				10'b0000010000: 
								begin
									BusWires = R2;
								end 
				10'b0000100000: 
								begin
									BusWires = R3;
								end 
				10'b0001000000: 
								begin
									BusWires = R4;
								end 
				10'b0010000000: 
								begin
									BusWires = R5;
								end 
				10'b0100000000: 
								begin
									BusWires = R6;
								end 
				10'b1000000000: 
								begin
									BusWires = R7;
								end 
				10'b0000000001: 
								begin
									if(LD) 
										BusWires = DataFromMemory;
									else if(Imm)
										BusWires = DataIN;
									else
										BusWires = DIN;
								end 
				10'b0000000010: 
								begin
									BusWires = G;
								end 
			 endcase
		  end

endmodule
