/*
Prática II - Modulo do TopLevel
Alunos: Alexandre Roque e Vitor Santana.
Disciplina: Arquitetura e Organização de Computadores II.
Professora: Daniela Cristina Cascini Kupsch.
*/
//module toplevel(DIN, DataIN, Resetn, Clock, Run);
module toplevel(Resetn, Clock, Run, R0,R1,R2,R3,R4,R5,R6,R7, Tstep_Q);
	//reg wren;
	//input [15:0] DIN;
	//input [15:0] DataIN;
	input Resetn, Clock, Run;
	output [15:0] R0,R1,R2,R3,R4,R5,R6,R7;
	output [2:0] Tstep_Q;
	
	wire [15:0] enderecoVirtual;
	wire [15:0] DIN;
	wire [15:0] DataIN;
	wire [15:0] DataFromMemory;
	wire Done;
	wire [15:0] BusWires;
	wire W;
	wire [15:0] ADDR, DOUT;
	wire [2:0] Tstep_Q;
	
	//module TLB(enderecoVirtual, Clock, DIN, Data);
	TLB tlb (enderecoVirtual, Clock, DIN, DataIN);
	//module processador (DIN, Resetn, Clock, Run, Done, BusWires, DataIN, W, ADDR, DOUT, R7);
	processador proc (DIN,Resetn, Clock, Run, Done, BusWires, DataIN, W, ADDR, DOUT, enderecoVirtual, Tstep_Q, DataFromMemory,R0,R1,R2,R3,R4,R5,R6,R7);
	//module MemRam (address,clock,data,wren,q);
	MemRam memRam (ADDR, Clock, DOUT, W,DataFromMemory);
	




endmodule
