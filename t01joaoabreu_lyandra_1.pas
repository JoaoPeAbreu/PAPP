Program T01JOAOABREU_LYANDRA ;
//João Pedro Abreu
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
		WRITE('Digite o primeiro número: ');  //Pega o primeiro número
		READLN(N1);   
		WRITE('Digite o segundo número: ');  //Pega o segundo número  
		READLN(N2);
		WRITELN('Digite "+" para fazer uma soma, "-" para uma subtração, "*" para uma multiplicação ou "/" para uma divisão');  //Escolhe a operação
		READLN(OP);
		WRITELN('                      ');  //Pula uma linha
	
		IF (OP='+') THEN  //Se o simbolo for + será direcionado para a soma
			BEGIN{3}       
				RESUL:=N1+N2;  //Pega os dois números e os soma
				WRITELN('O resultado da soma é= ', N1, ' + ', N2, ' = ',RESUL :2)  //Dá a equação e o resultado da equação
			END{3}
		ELSE
			IF (OP='-') THEN  //Se o simbolo for - será direcionado para a subtração
				BEGIN{4}
					RESUL:=N1-N2;  //Pega os dois números e os subtrai
					WRITELN('O resultado da subtração é= ', N1, ' - ', N2, ' = ',RESUL :2)  //Dá a equação e o resultado da equação
				END{4}
			ELSE
				IF (OP='*') THEN  //Se o simbolo for * será direcionado para a multiplicação
					BEGIN{5}
						RESUL:=N1*N2;  //Pega os dois números e os multiplicação
						WRITELN('O resultado da multiplicação é= ', N1, ' * ', N2, ' = ',RESUL :2)  //Dá a equação e o resultado da equação
					END{5}
				ELSE
					IF (OP='/') AND (N2<>0) THEN  //Se o simbolo for / será direcionado para a divisão
						BEGIN{6} 
							RESUL:=N1/N2;  //Pega os dois números e os divide
							WRITELN('O resultado da divisão é= ', N1, ' / ', N2, ' = ',RESUL :2)  //Dá a equação e o resultado da equação
						END{6}
					ELSE 
						WRITELN ('ERRO');  //Caso o número dado não for valido ou seja uma divisão por 0 ele será direcionado para cá
		WRITELN('                        ');  //Pula uma linha
		WRITELN('PARA CONTINUAR CALCULADO APERTE 1');
		WRITELN('PARA PARAR DE CALCULAR APERTE 2');    //Menu para escolher se sai ou se continua
		READLN(SAI);  //Escolhe se quer continuar ou parar
		IF SAI = 1 THEN  //Caso escolha a opção 1 ele irá continuar
			PAR := TRUE
		ELSE
			IF SAI = 2 THEN  //Caso escolha a opção 2 ele irá parar de rodar
				PAR := FALSE
			ELSE
				WRITELN('OPERAÇÃO INVALIDA');  //Caso o número dado não for valido ele será direcionado para cá
	  END;{2}
	WRITE('Aperte enter.');
	READLN();
END.{1}