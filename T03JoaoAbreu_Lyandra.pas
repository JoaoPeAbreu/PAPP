Program T03JOAOABREU_LYANDRA ;
//Jo�o Pedro Abreu e Lyandra C.S. Lisboa do Amaral

FUNCTION INTEIRO(NUM:REAL):INTEGER;
VAR MULT,IINT:INTEGER;
    II,DIV1:REAL;
    
BEGIN
	DIV1:= NUM;
	MULT:= 1;
		IF(DIV1 < 0) THEN
			MULT:= -1;
			DIV1:= DIV1 * MULT;
			IINT:= 0;
			II:= 0;
		REPEAT
			IINT:= IINT+ 1;
			II:= II+ 1;
		UNTIL (II > DIV1);      
			//INTEIRO:= (	IINT � 1)* MULT;  
			INTEIRO:= (IINT-1)*MULT;   
END;

FUNCTION RESTO(A,B:INTEGER):INTEGER;
VAR IINT:INTEGER;
BEGIN
	IINT:= INTEIRO(A/B);           	//REVER NA HORA DO TESTE
	//RESTO:= A � IINT * B;
	RESTO:=A-IINT*B
END;

PROCEDURE SAI;
VAR N,P1,P2:INTEGER;        	//EM DUVIDA.
BEGIN
	WRITELN('MULTIPLOS DE ',N,' = ',P1);
	WRITELN ('N�O MULTIPLOS DE ' ,N, ' = ',P2);
END;

PROCEDURE TESTA(RES:INTEGER; VAR MULT, NMULT:INTEGER);
BEGIN
	IF(RES = 0) THEN
		MULT:= MULT + 1 
	ELSE
		NMULT:= NMULT + 1 ;
END;

//ALGORITIMO PRINCIPAL

VAR P1,P2,N,CONT,NUM,R:INTEGER;

BEGIN

P1:=0;
P2:=0;
N:=2;

	FOR CONT:=1 TO 10 DO
		BEGIN
			WRITE('Digite um n�mero (1)-> ');
			READLN(NUM);
			R:=RESTO(NUM,2);				
			TESTA(R,P1,P2);
		END;
	SAI;

P1:=0;
P2:=0;
N:=3;

	FOR CONT:=1 TO 10 DO
		BEGIN
			WRITE('Digite um n�mero (2)-> ');
			READLN(NUM);
			R:=RESTO(NUM,3);				
			TESTA(R,P1,P2);
		END;
	SAI;
	READLN();

END.




