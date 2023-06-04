Program T04JoaoAbreu_Lyandra ;
{
João Pedro Abreu
Lyandra C.S. Lisboa do Amaral
OBS: O TRABLHO FOI FEITO UTILIZANDO COMO BASE O CÓDIGO DISPONIBILIZADO PELO PROF: LUIS ANTONIO DO EXERCICIO 10 DA LISTA 2
}

VAR NUM:STRING[11];
    MULT,CONT,C,TAM,ESP,SOM,RES,DVCJ,DVCK,DVLJ,DVLK:INTEGER;                                               
    CPF:BOOLEAN;
    
BEGIN
 REPEAT                                                                                                         
  CPF:=TRUE;
  WRITE('Digite o CPF => ');
  READLN(NUM);
  TAM:=LENGTH(NUM);
  IF(TAM<11)THEN
   CPF:=FALSE;
  VAL(NUM,CONT,ESP);
  IF(ESP>0)THEN
   CPF:=FALSE;
  IF NOT CPF THEN
   WRITELN('ERRO!');
 UNTIL CPF;




WHILE (NUM<>'00000000000') DO      //   TABELA DO A AO I
BEGIN                              //
 MULT:=11;										     //
 SOM:=0;                           //
 FOR CONT:=1 TO 9 DO               //           OK
  BEGIN                            //
   VAL(NUM[CONT],C,ESP);           //
   MULT:=MULT-1;                   //
   SOM:=SOM+C*MULT;                //
  END;
  
  RES:=SOM MOD 11;              		//   Calculo do resto
  IF  (RES=0) OR (RES=1) THEN  		  //   Condições do resto iguais a 0 e 1
		DVCJ :=0                   		  
	ELSE                        	 	  
	 	DVCJ:=11-RES;               		//   Condição para calcular o digito J 
  
  
  IF(DVCJ<>DVLJ)THEN                               //Condição de invalido se o 10 digito verificador for invalido
   WRITELN(NUM,' CPF INVÁLIDO  DVC10 = ',DVCJ:2)  
  ELSE
                                   //	  Calcula o 11 digito
 	 MULT:=12;										   // 
 	 SOM:=0;                         //   TABELA DO A AO J
 	FOR CONT:=1 TO 10 DO             //     
  	BEGIN                          //
  	 VAL(NUM[CONT],C,ESP);         //         OK
 	  MULT:=MULT-1;                  //
  	 SOM:=SOM+C*MULT;              //
 		END;
  
	  RES:=SOM MOD 11;              //      Calculo do resto
	  IF  (RES=0) OR (RES=1) THEN   //      Condições do resto iguais a 0 e 1
			DVCK :=0                    //
		ELSE                          //
		 	DVCK:=11-RES; 
 
  	VAL(NUM[11],DVLK,ESP);                //
	  IF(DVCK<>DVLK)THEN                    // Se o digito calculado for diferente do digito lido: é invalido
	   WRITELN(NUM,' CPF INVÁLIDO  DVC11 = ',DVCK:2)
	  ELSE
	   WRITELN('CPF lido Válido');
	   
 REPEAT
  CPF:=TRUE;
  WRITE('Digite o CPF => ');
  READLN(NUM);
  TAM:=LENGTH(NUM);
  IF(TAM<11)THEN
   CPF:=FALSE;
  VAL(NUM,CONT,ESP);
  IF(ESP>0)THEN
   CPF:=FALSE;
  IF NOT CPF THEN
   WRITELN('ERRO!');
 UNTIL CPF;
END;  
  WRITE('ENTER PARA ENCERRAR');
	READLN; 
END.