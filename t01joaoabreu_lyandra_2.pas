Program t01_joaoabreu_lyandra;
//Jo�o Pedro Abreu
//Lyandra Christina Shayene Lisboa do Amaral
VAR n1, n2, op, resul, sai: REAL;
	  par: BOOLEAN;
BEGIN {1}
WRITELN('Calculadora');
par := TRUE;
WHILE (par = TRUE) DO 
	BEGIN {2}
		WRITELN('|-----------------------------|');
		WRITELN('|        1 - Adi��o           |');
		WRITELN('|        2 - Subtra��o        |'); //Menu para escolher a opera��o
		WRITELN('|        3 - Multipica��o     |');
		WRITELN('|        4 - Divis�o          |');
		WRITELN('|-----------------------------|');
		WRITE('Qual a opera��o da conta? ');  //Escolhe a opera��o
		READLN(op);
		WRITELN('                        ');  //Pula uma linha
		WRITE('Digite o primeiro n�mero:');  //Pega o primeiro n�mero
		READLN(n1);
		WRITELN('                       ');  //Pula uma linha
		WRITE('Digite o segundo n�mero:');  //Pega o segundo n�mero
		READLN(n2);
		WRITELN('                      ');  //Pula uma linha
		IF op = 1 THEN  //Se o n�mero for 1 ser� direcionado para a soma
			BEGIN {3}
				resul := n1 + n2;  //Pega os dois n�meros e os soma
				WRITELN('O resultado � ',n1, ' + ', n2, ' = ', resul); //D� a equa��o e o resultado da equa��o
			END{3}  
		ELSE
			IF op = 2 THEN  //Se o n�mero for 2 ser� direcionado para a subtra��o
				BEGIN {4}
					resul := n1 - n2;  //Pega os dois n�meros e os subtrai
					WRITELN('O resultado � ', n1, ' - ', n2, ' = ', resul);  //D� a equa��o e o resultado da equa��o
				END{4} 
			ELSE
				IF op = 3 THEN  //Se o n�mero for 3 ser� direcionado para a multiplica��o
					BEGIN{5}
						resul := n1 * n2;  //Pega os dois n�meros e os multiplica
						WRITELN('O resultado � ', n1, ' * ', n2, ' = ', resul); //D� a equa��o e o resultado da equa��o
					END{5} 
				ELSE
					IF (op = 4) AND (n2<>0) THEN  //Se o n�mero for 4 ser� direcionado para a divis�o
						BEGIN{6} 
							resul := n1 / n2;  //Pega os dois n�meros e os divide
							WRITELN('O resultado � ', n1, ' / ', n2, ' = ', resul); //D� a equa��o e o resultado da equa��o
						END{6}
					ELSE
						WRITELN('Erro');  //Caso o n�mero dado n�o for valido ou seja uma divis�o por 0 ele ser� direcionado para c�
		WRITELN('|.........................|');
		WRITELN('|  1 - Calcular de novo   |');
		WRITELN('|  2 - Parar de calcular  |');  //Menu para escolher se sai ou se continua
		WRITELN('|.........................|');
		WRITELN('                           ');  //Pula uma linha
		WRITE('Voc� quer continuar calculando?');  //Escolhe se quer continuar ou parar
		READLN(sai);
		IF sai = 1 THEN //Caso escolha a op��o 1 ele ir� continuar
			par := TRUE
		ELSE
			IF sai = 2 THEN  //Caso escolha a op��o 2 ele ir� parar de rodar
			 par := FALSE
			ELSE
				WRITELN('Resultado invalido')  //Caso o n�mero dado n�o for valido ele ser� direcionado para c�
	END{2};
WRITE('Aperte enter.'); 
READLN;
END.{1}                                          