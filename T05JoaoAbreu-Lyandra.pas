Program T05JoaoAbreu_Lyandra;
{feito por Jo�o Pedro Abreu e Lyandra Christina Shayene Lisboa do Amaral}

Uses bibliont;

Var numeros:array[1..100] of integer;
		troca:boolean;
		jaord,i,num,aux1,total,tot:integer;    //i � um indice, pensar nos indices matriciais ij		
		lido:string[30];                       //
		
Begin
writeln('Digite um n�mero positivo');
i:=1;  
leitura(lido,numeros[i]);                                      
                     				 		   
 while (numeros[i]>0)and (i<100) do 		//numeros precisam ser positivos ou zero e o vetor contar no max 100 numeros
 begin      											   
	     writeln('D�gite um n�mero positivo'); 			
			 i:=i+1;                           //aumenta o indice do vetor 
			 leitura(lido,numeros[i]);
                   				 		  
end;
		  
	  
 	total:=i;
	tot:=total;
	jaord:=1;                               //variavel que garante a passagem e verifica��o de que todo o vetor foi ordenado 
repeat
 troca:=true;
 tot:=tot-jaord;
 for i:=1 to tot do
  if(numeros[i]>numeros[i+1])then
	 begin
	  aux1:=numeros[i];
		numeros[i]:=numeros[i+1];
		numeros[i+1]:=aux1;
		troca:=false;
		jaord:=1;               
	 end
	else
	 jaord:=jaord+1;
until troca;

	 writeln; 
	 writeln('S�o pares: ');
   for i:=1 to total do                       
   	if(numeros[i] mod 2 = 0 ) and (numeros[i]>=0) then
   		writeln(numeros[i]); 
		writeln('S�o impares: ');	                     
    for i := total downto 1 do            
    	if(numeros[i] mod 2 = 1 )then
	 			writeln(numeros[i]);			
    
   fim;
	  
End.