Program T01JOAOABREU_LYANDRA ;
//Jo�o Pedro Abreu
//Lyandra Christina Shayene Lisboa do Amaral

Var N1,N2,RESUL,SAI:REAL;
	  OP:STRING;
	  PAR : BOOLEAN;
Begin{1}
	WRITELN('Calculadora');
	PAR := TRUE;
	WHILE (par = TRUE) DO
	  BEGIN{2}
		WRITELN('                   ');
		WRITE('Digite o primeiro n�mero: ');  //Pega o primeiro n�mero
		READLN(N1);   
		WRITE('Digite o segundo n�mero: ');  //Pega o segundo n�mero  
		READLN(N2);
		WRITELN('Digite "+" para fazer uma soma, "-" para uma subtra��o, "*" para uma multiplica��o ou "/" para uma divis�o');  //Escolhe a opera��o
		READLN(OP);
		WRITELN('                      ');  //Pula uma linha
	
		IF (OP='+') THEN  //Se o simbolo for + ser� direcionado para a soma
			BEGIN{3}       
				RESUL:=N1+N2;  //Pega os dois n�meros e os soma
				WRITELN('O resultado da soma �= ', N1, ' + ', N2, ' = ',RESUL :2)  //D� a equa��o e o resultado da equa��o
			END{3}
		ELSE
			IF (OP='-') THEN  //Se o simbolo for - ser� direcionado para a subtra��o
				BEGIN{4}
					RESUL:=N1-N2;  //Pega os dois n�meros e os subtrai
					WRITELN('O resultado da subtra��o �= ', N1, ' - ', N2, ' = ',RESUL :2)  //D� a equa��o e o resultado da equa��o
				END{4}
			ELSE
				IF (OP='*') THEN  //Se o simbolo for * ser� direcionado para a multiplica��o
					BEGIN{5}
						RESUL:=N1*N2;  //Pega os dois n�meros e os multiplica��o
						WRITELN('O resultado da multiplica��o �= ', N1, ' * ', N2, ' = ',RESUL :2)  //D� a equa��o e o resultado da equa��o
					END{5}
				ELSE
					IF (OP='/') AND (N2<>0) THEN  //Se o simbolo for / ser� direcionado para a divis�o
						BEGIN{6} 
							RESUL:=N1/N2;  //Pega os dois n�meros e os divide
							WRITELN('O resultado da divis�o �= ', N1, ' / ', N2, ' = ',RESUL :2)  //D� a equa��o e o resultado da equa��o
						END{6}
					ELSE 
						WRITELN ('ERRO');  //Caso o n�mero dado n�o for valido ou seja uma divis�o por 0 ele ser� direcionado para c�
		WRITELN('                        ');  //Pula uma linha
		WRITELN('PARA CONTINUAR CALCULADO APERTE 1');
		WRITELN('PARA PARAR DE CALCULAR APERTE 2');    //Menu para escolher se sai ou se continua
		READLN(SAI);  //Escolhe se quer continuar ou parar
		IF SAI = 1 THEN  //Caso escolha a op��o 1 ele ir� continuar
			PAR := TRUE
		ELSE
			IF SAI = 2 THEN  //Caso escolha a op��o 2 ele ir� parar de rodar
				PAR := FALSE
			ELSE
				WRITELN('OPERA��O INVALIDA');  //Caso o n�mero dado n�o for valido ele ser� direcionado para c�
	  END;{2}
	WRITE('Aperte enter.');
	READLN();
END.{1}