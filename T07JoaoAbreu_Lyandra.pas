Program T07JoaoAbreu_Lyandra ;
{Feito por João Pedro Abreu e Lyandra C.S.Lisboa do Amaral
OBS: o algoritmo foi baseado nos algoritmos do prof Luiz Antonio, os quais foram mostrados e desenvolvidos em aula, 
portanto, algumas partes foram copiadas
}

uses BIBLIONT;

const CARGOS:array [1..12] of string [22]=
('ENGANADOR DE CHEFE    ','ENROLADOR DE TRABALHO ','PENSADOR              ','ANALISTA DE SISTEMAS  ',
 'DEGUSTADOR DE CERVEJA ','TECNICO EM REDES      ','CONTADOR DE ESTORIAS  ','SAI DA AULA ANTES     ',
 'ACOUGUEIRO LIMPINHO   ','SEGURANCA DE BANHEIRO ','GESTOR DE BORBOLETAS  ','AGENTE LEVA E TRAZ    ' );

var ARQ : file of REGIS;
    REG:REGIS;
    A,B,E,IND,CONTLIN,ANTERIOR,posi,x,TOT:INTEGER;
    TOTCAR:ARRAY[1..12] OF INTEGER;
		car:string[2];
		escl: string[20];
		num:string[35];
		op:char;
		chave: boolean;
		vet:vetor; 

Begin
									 
		writeln('As opções de ordenação são:');
		writeln('Digite 1 para ordenar por número de inscrição');
		writeln('Digite 2 para ordenar por ordem alfabética');
		writeln('Digite 3 para ordenar por CPF');
		writeln('Digite 4 para ordenar por cargo e ordem alfabética');
		writeln;  																											//para pular uma linha
		write('Escolha a opção:');
		
		//validação de escolha  
		
		repeat
			readln(op);  
			case (op )of  //case (op) of substitui o if else                
				'1':begin
					chave:=true;        
				end;                                    
			 
				'2':begin
					chave:=true;	
				end;
							
				'3':begin
					chave:=true;	
				end;
			 
				'4':begin
					chave:=true;        
				end
				
			else
				begin
					writeln('Opção escolhida inválida!!');
					writeln; //espaço
					write('Escolha uma opção válida');
					chave:=false;
				end;
			end;
			until (chave);

//Abre o arquivo e faz a leitura das informações de GERIND.PAS			                       
		assign(ARQ,'CAND.IND');               
    reset(ARQ);
    repeat 
    	A:=A+1;
    	vet[A].pf:=posi;
    	read(ARQ,REG);          
  
	//Opçs pra fazer a ordenação pelo if/else  	
    	if (op='1') then
    		begin
    		str(reg.num:4,num);               // str converte numero para string e auxilia na ordenação de acordo com o numero de strings da inscrição
    			vet[A].cc:=num;
    		end
    	else
    	if (op='2')then 
        begin                            
    			vet[A].cc:=reg.nome;
    		end
    	else
			if (op='3')then 
        begin                                     
    			vet[A].cc:=reg.cpf;         
    		end
		  else 
		  if (op='4') then 
        begin                                
        	str(reg.car:2,car);             // str converte numero para string de acordo e auxilia na ordenção de acordo com o numero de strings do cargo
    			vet[A].cc:=car+reg.nome;   
    		end;
    	posi:=posi+1;              
    until eof(ARQ);         //Usada para verificar se o final de um arquivo foi alcançado durante uma leitura de valores       
    TOT:=A;
//
			
//ORDENAÇÃO usando a procedure
	writeln('Aguarde...');
ordem(vet,TOT);   
//fim

//Vetor

for x:=1 to TOT do
begin
	seek(ARQ,vet[x].pf);
	read(ARQ,REG);
	E:=E+1;
		  if(REG.car>0)then
		   TOTCAR[REG.car]:=TOTCAR[REG.car]+1;//CONTA NUMERO DE INSCRITOS POR CARGO
			   
	//ANTES DE MOSTRAR A LINHA COM AS INFORMAÇOES DO REGISTRO VERIFICA AS CONDICOES PARA IMPRESSAO DO CABECALHO
		  if(CONTLIN MOD 9999=0) then 
	     begin
	     	clrscr;
	     	writeln;
	      write('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
	      writeln('  N2  N3  N4  N5  N6   SO   CG  CC CV FA');
	      CONTLIN:=0;
		   end;
//FIM DA IMPRESSAO DO CABECALHO          
//LINHA DETALHE
		write(E:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
		for A:=1 to 6 do
		 write(REG.NOTAS[A]:4);
		writeln(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3);
//FIM DA LINHA DETALHE
		CONTLIN:=CONTLIN+1;
	 end;
	close(ARQ); //fecha o arq
	writeln;
	writeln;
	writeln('TOTAL DE INSCRITOS POR CARGO');
	for A:=1 to 12 do
	 writeln(A:3,' -- ',CARGOS[A],' -->',TOTCAR[A]:4);
	 writeln('TOTAL DE REGISTROS LIDOS',E:5);
	fim;	 

End.