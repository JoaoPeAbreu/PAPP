Program T02JoaoAbreu_Lyandra;
//Jo�o Pedro Abreu e Lyandra C.S. Lisboa do Amaral.

VAR num, cont, divis: INTEGER; 
		par:BOOLEAN;
BEGIN

par:=TRUE;


WHILE(par=TRUE)DO
BEGIN
	WRITE('Digite um n�mero terminado em zero que n�o seja apenas 0 -> '); 
	READLN(num);


		IF (num MOD 10<>0) OR (num=0)THEN	        									//condi��es para erro;
		BEGIN
		WRITELN ('ERRO - N�mero n�o terminado em zero ou zero');
		par:=FALSE;		                                              //encerra o while caso a condi��o par n�o seja verdadeira
		END			
		
	   	ELSE
	   	BEGIN
	  		WRITELN('N�mero lido = ',num);                          // mostra o n�mero lido
	   		WRITELN ('Divisores');                                  //mostra seus divisores
	   	
		    FOR cont:=1 TO num DO                                   //contador 
				BEGIN
				divis:= num MOD cont;                                   //caso o resto da divis�o pelo contador seja 0, ent�o o contador atual � um divisor
				IF divis=0 THEN
				WRITELN(cont );                                         //imprime o contador/ divisor
				END;
					WRITELN('Para sair digite 0 ');
			END;
		
END;
		
WRITELN ('Aperte ENTER para encerrar');
READLN ();

End.
