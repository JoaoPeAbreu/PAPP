Program T02JoaoAbreu_Lyandra;
//João Pedro Abreu e Lyandra C.S. Lisboa do Amaral.

VAR num, cont, divis: INTEGER; 
		par:BOOLEAN;
BEGIN

par:=TRUE;


WHILE(par=TRUE)DO
BEGIN
	WRITE('Digite um número terminado em zero que não seja apenas 0 -> '); 
	READLN(num);


		IF (num MOD 10<>0) OR (num=0)THEN	        									//condições para erro;
		BEGIN
		WRITELN ('ERRO - Número não terminado em zero ou zero');
		par:=FALSE;		                                              //encerra o while caso a condição par não seja verdadeira
		END			
		
	   	ELSE
	   	BEGIN
	  		WRITELN('Número lido = ',num);                          // mostra o número lido
	   		WRITELN ('Divisores');                                  //mostra seus divisores
	   	
		    FOR cont:=1 TO num DO                                   //contador 
				BEGIN
				divis:= num MOD cont;                                   //caso o resto da divisão pelo contador seja 0, então o contador atual é um divisor
				IF divis=0 THEN
				WRITELN(cont );                                         //imprime o contador/ divisor
				END;
					WRITELN('Para sair digite 0 ');
			END;
		
END;
		
WRITELN ('Aperte ENTER para encerrar');
READLN ();

End.
