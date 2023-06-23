Program T09JoãoAbreu_Lyandra;

uses 	bibliont;

const dtref:integer = 20230616;                   //data de referencia 

var		arqcand:file of regis;
vagas:text;
reg:regis;
i,j,e,erro,max,cont,dtclas,vgcar:integer;      // indices,classif. por data, vaga por cargo
vet:vetor;
cargo:tipo;                                    //cargo em string
datas:string[8];                               //data em string
idacad:string[6];                              //idade por cargo
qtcar,soma:string[3];                         //quant. de cargos
nota:array [1..6] of string[3];
cargos:array [1..12] of string[22];             //vetor 
contcar,vagacargo:array [1..12] of integer;       //contador d cargo e vaga por cargo

Begin

//Abre os arquivos CAND.TXT e VAGAS.TXT e faz as respectivas leituras
  assign(arqcand,'cand.ind');
  assign(vagas,'vagas.txt');
  reset(vagas);
  reset(arqcand);
  
  //FOR QUE ARMAZENA OS CARGOS E SUAS RESPECTIVAS VAGAS
  for i := 1 to 12 do          //12 cargos
  begin
    read(vagas,cargo);                  //lê a quant. vagas por cargo
    cargos[i]:=copy(cargo,3,29);        //pega comente os dois primeiros numeros, que é o cargo
    qtcar:=copy(cargo,30,31);           //pega a quantidade de vaga por cargo
    val(qtcar,vgcar,erro);               //converte a string para inteiro
    vagacargo[i]:=vgcar;                 //vetor de vagas por cargo
  end;
  
  //repeat que altera a classificação   
  repeat
    read(arqcand,reg);                //faz a leitura
    j:=j+1;                           //contador
    vet[j].pf:=e;
    str(reg.som:3,soma);              //procedure de conversão de inteiro para string
    for i := 1 to 6  do                //for das 6 notas 
    str(reg.notas[i]:3,nota[i]);       //conversão de inteiro para string
    datas:=reg.data.ano + reg.data.mes + reg.data.dia;   //ordena as datas de nascimente de trás para a frente
    val(datas,dtclas,erro);             //converte string em inteiro
    dtclas:= dtref - dtclas;
    str(dtclas:6,idacad);               //conversão de inteiro para string
    vet[j].cc:=soma+nota[4]+nota[5]+nota[3]+nota[2]+nota[6]+nota[1]+idacad;    //ordena por notas e pela idade
    e:=e+1;
  until eof (arqcand);
  max:=e;
  
  //Ordenar o vetor
  writeln('Aguarde...');
  ordem(vet,e);
  
  //
  for j := max downto 1 do
  begin
    seek(arqcand,vet[J].pf);            //posiciona no arquivo cand 
    read(arqcand,reg);                  //faz a leitura e guarda no registro
    if (reg.falta = 0 ) then
    
	    begin//alteração de dados
	      cont:= cont + 1;
	      reg.clg:= cont;                  //clas.geral recebe cont
	      contcar[reg.car]:= contcar[reg.car] + 1;           //cont de cargo recebe +1
	      reg.clc:=contcar[reg.car];                         //clas. cargo recebe cont de cargo
	      
	      if(vagacargo[reg.car] >= contcar[reg.car]) then      //vaga por cargo maior ou igual ao contador 
		      begin
		        reg.ccl:=reg.car;                                 //cargo de clas. recebe a que esta no registro
		      end
	    end//alteração
	    
	    else                  //se não tudo recebe 0
		    begin
		      reg.clg:=0;
		      reg.clc:=0;
		      reg.ccl:=0;
		    end;
	    seek(arqcand,vet[J].pf);                //posiciona no cand
	    write(arqcand,reg);                     //lê e grava no arquivo
 end;           
  //=======
  close(vagas);                         //fecha os arquivos vagas e cand
  close(arqcand);
  
  //CABEÇALHO
  writeln('Foram classificados ',cont,' candidatos');
  writeln('Candidatos classificados por cargo');
  writeln('Candidatos :              Cargo :');
  
  for i := 1 to 12 do               //for que vai mostrar a quantidade de classificados em cada cargo no cabeçalho   	
  writeln(contcar[i],'                       ',cargos[i]);
  writeln;
  fim;
End.