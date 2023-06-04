Program t01_joaoabreu_lyandra;
//João Pedro Abreu
//Lyandra Christina Shayene Lisboa do Amaral
VAR n1, n2, op, resul, sai: REAL;
	  par: BOOLEAN;
BEGIN {1}
WRITELN('Calculadora');
par := TRUE;
WHILE (par = TRUE) DO 
	BEGIN {2}
		WRITELN('|-----------------------------|');
		WRITELN('|        1 - Adição           |');
		WRITELN('|        2 - Subtração        |'); //Menu para escolher a operação
		WRITELN('|        3 - Multipicação     |');
		WRITELN('|        4 - Divisão          |');
		WRITELN('|-----------------------------|');
		WRITE('Qual a operação da conta? ');  //Escolhe a operação
		READLN(op);
		WRITELN('                        ');  //Pula uma linha
		WRITE('Digite o primeiro número:');  //Pega o primeiro número
		READLN(n1);
		WRITELN('                       ');  //Pula uma linha
		WRITE('Digite o segundo número:');  //Pega o segundo número
		READLN(n2);
		WRITELN('                      ');  //Pula uma linha
		IF op = 1 THEN  //Se o número for 1 será direcionado para a soma
			BEGIN {3}
				resul := n1 + n2;  //Pega os dois números e os soma
				WRITELN('O resultado é ',n1, ' + ', n2, ' = ', resul); //Dá a equação e o resultado da equação
			END{3}  
		ELSE
			IF op = 2 THEN  //Se o número for 2 será direcionado para a subtração
				BEGIN {4}
					resul := n1 - n2;  //Pega os dois números e os subtrai
					WRITELN('O resultado é ', n1, ' - ', n2, ' = ', resul);  //Dá a equação e o resultado da equação
				END{4} 
			ELSE
				IF op = 3 THEN  //Se o número for 3 será direcionado para a multiplicação
					BEGIN{5}
						resul := n1 * n2;  //Pega os dois números e os multiplica
						WRITELN('O resultado é ', n1, ' * ', n2, ' = ', resul); //Dá a equação e o resultado da equação
					END{5} 
				ELSE
					IF (op = 4) AND (n2<>0) THEN  //Se o número for 4 será direcionado para a divisão
						BEGIN{6} 
							resul := n1 / n2;  //Pega os dois números e os divide
							WRITELN('O resultado é ', n1, ' / ', n2, ' = ', resul); //Dá a equação e o resultado da equação
						END{6}
					ELSE
						WRITELN('Erro');  //Caso o número dado não for valido ou seja uma divisão por 0 ele será direcionado para cá
		WRITELN('|.........................|');
		WRITELN('|  1 - Calcular de novo   |');
		WRITELN('|  2 - Parar de calcular  |');  //Menu para escolher se sai ou se continua
		WRITELN('|.........................|');
		WRITELN('                           ');  //Pula uma linha
		WRITE('Você quer continuar calculando?');  //Escolhe se quer continuar ou parar
		READLN(sai);
		IF sai = 1 THEN //Caso escolha a opção 1 ele irá continuar
			par := TRUE
		ELSE
			IF sai = 2 THEN  //Caso escolha a opção 2 ele irá parar de rodar
			 par := FALSE
			ELSE
				WRITELN('Resultado invalido')  //Caso o número dado não for valido ele será direcionado para cá
	END{2};
WRITE('Aperte enter.'); 
READLN;
END.{1}                                          