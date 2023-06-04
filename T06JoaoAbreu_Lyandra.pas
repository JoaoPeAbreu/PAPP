Program T06JOAOABREU_LYANDRA ;

//Feito por João Pedro Abreu e Lyandra C.S. Lisboa do Amaral
//Adaptação e resolução do algoritmo gercandtxtv1 disponibilizado pelo Professor Luiz Antonio

uses bibliont;

var
 arq:text;      //NOME LÓGICO DO ARQUIVO (SERÁ TIPO TEXTO - ACESSO SEQUENCIAL)
 reg:string[60];  //REGISTRO SERÁ DE 60 CARACTERES
 num,car,dd,mm,aa,a,b,c,tam:integer;
 nome:string[35];
 cpf:string[11];
 numa,anoa:string[4];
 dda,mma,caa:string[2];
 cargo:boolean;
 
Begin
 assign(arq,'sai1.txt');    //LIGA NOME LÓGICO AO FÍSICO
 append(arq);               //ABRE PARA ACRESCENTAR REGISTROS (SÓ TIPO TEXTO ACESSO/ORGANIZAÇÃO SEQUENCIAL)    
 
 leitura('Numero',num);
 while (num > 0) and (num<9999)do            //pega numeros maiores que 0 e menores que 10000
  begin
   str(num,numa);        //TRANSFORMA NUM INTEGER EM STRING[4]
   tam:=length(numa);
   for a:=1 to 4-tam do
    insert('0',numa,1);
   write('Nome=>');
   readln(nome);
   nome:=upcase(nome);
	 tam:=length(nome);
	 for a:=tam+1 to 35 do
	  insert(' ',nome,a);   
	  
   write('CPF=>');
   readln(cpf);
   while ( not validacpf (cpf)) do              //FUNÇÃO VALIDACPF
   	begin 
   		writeln ('CPF inválido, por favor digitar o correto');
   		writeln ('CPF=>');
   		readln(cpf);
 		end;

   leitura('Dia',dd);
   leitura('Mes',mm);
   leitura('Ano',aa);
   while ( not VALIDATA (dd,mm,aa)) do        //FUNÇÃO VALIDATA
   begin
      writeln ('Data inválida, por favor digitar corretamente');
   		leitura('Dia',dd);
      leitura('Mes',mm);
      leitura('Ano',aa);
 		end;
	 
		repeat
		 leitura('Cargo',car); 
			if(car>0) and (car < 13) then 
			  cargo :=true
			else
				begin
				  writeln ('Cargo inválido, por favor digitar corretamente');
					cargo:= false;
				end;
		until cargo;

                    
   str(dd,dda);       //TRANSFORMA DIA EM STRING[2]
   if(dd<10)then
    insert('0',dda,1);
   str(mm,mma);       //TRANSFORMA MES EM STRING[2]
   if(mm<10)then
    insert('0',mma,1);
   str(aa,anoa);      //TRANSFORMA ANO EM STRING[4]
   str(car,caa);      //TRANSFORMA CARGO EM STRING[2]
   if(car<10)then
    insert('0',caa,1);

    
//insiro os campos strings no registro de traz para frente inserindo sempre na pos 1
{   insert(caa,reg,1);   //12
   insert(anoa,reg,1);  //199912
   insert(mma,reg,1);   //10199912
   insert(dda,reg,1);   //0510199912
   insert(cpf,reg,1);   //123456789540510199912
   insert(nome,reg,1);  //MARIA DO ROSARIO BATISTA           123456789540510199912
   insert(numa,reg,1);  //0033MARIA DO ROSARIO BATISTA           123456789540510199912  }
   //ou
   reg:=numa+nome+cpf+dda+mma+anoa+caa;
//DEVERIA FICAR COMO ACIMA, ABRA O ARQUIVO SAI1.TXT, DEPOIS DE ENCERRAR, E CONFIRA
   writeln(arq,reg);    //GRAVA O REGISTRO
   leitura('numero',num);
  end;
  close(arq);
  fim;

  
End.