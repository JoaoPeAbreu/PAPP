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
  for i := 1 to 12 do
  begin
    read(arqvagas,cargo);
    cargos[i]:=copy(cargo,1,2)+' '+copy(cargo,3,29);
  end;
  //===============ordenação do vetor 
  write('Escolha uma das opções:');
	writeln('Apenas os candidatos classificados: 1');
  writeln('Classificação por cargo: 2');
  writeln('Classificação geral: 3');
  writeln('Para sair: 0');
  repeat
    readln(opc);
    if (opc='1') or (opc = '0') then
    begin
      alfa:= 'Opção 1 - Apenas classificados';
      tela:='  ORD  NUM NOME                                NASCIMENTO CAR';
    end
    else if (opc ='2') then
    begin
      alfa:= 'Opção 2 - Classifição por cargo ';
      tela:='  ORD  NUM NOME                                SOM   N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVAÇÃO';
    end
    else if (opc= '3') then
    begin
      alfa:= 'Opção 3 - Classificação geral     ';
      tela:='  ORD  NUM NOME                                SOM  N4  N5  N3  N2  N6  N1 NASCIMENTO CAR OBSERVAÇÃO';
    end
    else
    writeln('Opção inválida');
  until(opc >= '0') and (opc < '4');
 
  if (opc<> '0' ) then
  begin
    assign(arq,'cand.ind');
    reset(arq);
    repeat
      read(arq,reg);
      if (opc = '1') and (reg.ccl > 0) then 
      begin
        j:=j+1;
        str(reg.ccl:2,ccl);
        grava:= ccl+ reg.nome;
        vet[j].cc:=grava;
        vet[j].pf:=e;
      end
      else if ((opc ='2') and (reg.clc > 0)) then 
      begin
        j:=j+1;
        str(reg.car:2,car);
        str(reg.clc:3,clcar);
        grava:=car+clcar;
        vet[j].cc:=grava;
        vet[j].pf:=e;
      end
      else if ((opc='3') and (reg.clg > 0 )) then
      begin
        j:=j+1;
        str(reg.clg:4,grava);
        vet[j].cc:=grava;
        vet[j].pf:=e;
      end;
      e:=e +1 ;
    until eof (arq);
    max:=j;

    //Ordenação do vetor
    writeln('Aguarde ...');
    ordem(vet,j);
   
    for j:= 1 to max do
    begin
      seek(arq,vet[j].pf);
      read(arq,reg);
      if((cont mod 25 = 0) or ((carant <> (reg.car)) and (opc <'3'))) then
      
			begin
        WRITE('ENTER PARA CONTINUAR');
        READLN;
        
        CLRSCR ;
  
        writeln('                         RELATORIO GERAL - ORDEM DE:',alfa:20);
        writeln;
        if(opc < '3') then
        writeln('Cargo :',cargos[reg.car]);
        writeln;
        writeln(tela);
        cont:= 0;
      end;

      if(opc = '1') then
      begin
        writeln(j:5,reg.num:5,' ',reg.NOME,' ',reg.DATA.DIA,'/',reg.DATA.MES,'/',reg.DATA.ANO,reg.ccl:3);
      end
      else
      begin
        write(j:6,REG.NUM:5,' ',REG.NOME,REG.SOM:3,REG.NOTAS[4]:4,REG.NOTAS[5]:4,
        REG.NOTAS[3]:4,REG.NOTAS[2]:4,REG.NOTAS[6]:4,REG.NOTAS[1]:4,' ',
        REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3,' ');
        if(reg.ccl > 0) and (opc > '1')then
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
  close(arqvagas);
  close(arq);
  writeln;
  fim;
  
End.