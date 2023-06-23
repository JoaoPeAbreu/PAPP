Program T10JoaoAbreu_Lyandra ;

uses BIBLIONT;

var  arq:file of regis;
arqvagas:text;
reg:regis;
vet:vetor;
alfa,grava,cargo:tipo;    //cargo=casord
cargos:array [1..12] of string[24];
tela:string;    //cabe
opc:char;
clcar:string[3];
car,ccl:string[2];
cont,e,i,j,carant,max:integer;

Begin

  assign(arqvagas,'vagas.txt');
  reset(arqvagas);
  
  //
  for i := 1 to 12 do
  begin
    read(arqvagas,cargo);   //faz a leitura do arquivo e guarda no registro
    cargos[i]:=copy(cargo,1,2)+' '+copy(cargo,3,29);
  end;
  //===============ordena��o do vetor 
  write('Escolha uma das op��es:');
	writeln('Apenas os candidatos classificados: 1');
  writeln('Classifica��o por cargo: 2');
  writeln('Classifica��o geral: 3');
  writeln('Para sair: 0');
  
  repeat //valida as op��es e faz o menu
    readln(opc);
    if (opc='1') or (opc = '0') then
    begin
      alfa:= 'Op��o 1 - Apenas classificados';
      tela:='  ORD  NUM NOME                                NASCIMENTO CAR';
    end
    else if (opc ='2') then
    begin
      alfa:= 'Op��o 2 - Classifi��o por cargo ';
      tela:='  ORD  NUM NOME                                SOM   N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVA��O';
    end
    else if (opc= '3') then
    begin
      alfa:= 'Op��o 3 - Classifica��o geral     ';
      tela:='  ORD  NUM NOME                                SOM  N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVA��O';
    end
    else
    writeln('Op��o inv�lida');
  until(opc >= '0') and (opc < '4');
 
  if (opc<> '0' ) then
  begin
    assign(arq,'cand.ind');         //abre e faz a leitura do cand.txt
    reset(arq);
    repeat
      read(arq,reg);
      if (opc = '1') and (reg.ccl > 0) then 
      begin
        j:=j+1;                        //contador da posi��o do vetor
        str(reg.ccl:2,ccl);            //converte pra string
        grava:= ccl+ reg.nome;         //uma nova variavel de armazenamento vai "segurar" essa resposta
        vet[j].cc:=grava;              // aonde organiza por cargo e nome 
        vet[j].pf:=e;                   //contador
      end
      else if ((opc ='2') and (reg.clc > 0)) then 
      begin
        j:=j+1;                                //parecido com o primeiro if
        str(reg.car:2,car);                    //converte cargo pra string
        str(reg.clc:3,clcar);                  //converte classificados por cargo em string
        grava:=car+clcar;                      //grava nessa ordem.
        vet[j].cc:=grava;                      //o vetor vai receber o que estava no grava, ou seja, a ordem de info
        vet[j].pf:=e;                          //contador
      end
      else if ((opc='3') and (reg.clg > 0 )) then
      begin
        j:=j+1;                       //mesma coisa das anteriores
        str(reg.clg:4,grava);
        vet[j].cc:=grava;             //como a classifica��o geral aparece todos os nomes
        vet[j].pf:=e;                 //vai ser convertido e armazenado diretamente no vetor
      end;
      e:=e +1 ;
    until eof (arq);
    max:=j;                           

    //Ordena��o do vetor
    writeln('Aguarde ...');
    ordem(vet,j);
   
    for j:= 1 to max do
    begin
      seek(arq,vet[j].pf);            //faz a leitura e grava os dados de arq
      read(arq,reg);                  //
      if((cont mod 25 = 0) or ((carant <> (reg.car)) and (opc <'3'))) then
      //estetico, aparece 25 nomes por pagina compilada 
      //se o cargo anterior for diferente do registro por cargo e a op� for a 3, entao vai rodar o que ta dentro do begin
			begin
        WRITE('ENTER PARA CONTINUAR');
        READLN;
        
        
        
        CLRSCR ;
  
        writeln('                         RELATORIO GERAL - ORDEM DE:',alfa:20);
        writeln;
        if(opc < '3') then                          //aparece o cargo da determinada lista
        writeln('Cargo :',cargos[reg.car]);
        writeln;
        writeln(tela);
        cont:= 0;
      end;

      if(opc = '1') then          //vai mostrar as informa��es na ordem de: posi��o, inscri��p, nome
      begin                       //data de nasc, cargo de classifica��o
        writeln(j:5,reg.num:5,' ',reg.NOME,' ',reg.DATA.DIA,'/',reg.DATA.MES,'/',reg.DATA.ANO,reg.ccl:3);
      end
      else     //se for a op� 2
      begin    //mostra posi��o, inscri��o, nome, soma das notas, n4,n5,n3,n2,n6,n1, nascimento,cargo
        write(j:6,REG.NUM:5,' ',REG.NOME,REG.SOM:3,REG.NOTAS[4]:4,REG.NOTAS[5]:4,
        REG.NOTAS[3]:4,REG.NOTAS[2]:4,REG.NOTAS[6]:4,REG.NOTAS[1]:4,' ',
        REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3,' ');
        if(reg.ccl > 0) and (opc > '1')then
        //se o registro por cargo classificado e a op� for 1
        //adiciona essa nova coluna de class car
        begin
          
          writeln('  CLASS CAR = ',reg.ccl);
        end
        else
        writeln;
        
      end;
      
      carant:=reg.car;
      cont:= cont + 1;
  
  end;
  end;
  close(arqvagas);        //fecha os arquivos
  close(arq);
  writeln;
  fim;
  
End.