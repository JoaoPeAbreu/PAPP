Program T08JoaoAbreu_Lyandra ;

{Feito por João Pedro Abreu e Lyandra C.S.Lisboa do Amaral 
obs: o algoritmo foi adaptado de acordo com o material disponibilizado pelo professor Luiz Antonio
}

uses  BIBLIONT;
const disciplinas:array [1..6] of tipo = ('L.E.M                  ','Matemática             ','Lógica                 ',
'Conhecimento Específico','Informática            ','Atualidades            ');

var	arqcan:file of regis;
arqnot:text;
reg:regis;
i,ii,e,erro,num,soma,tot,cont,ind:integer;         //i e j são contadores ou indices do vetor
vet:vetor;
nu:string[28];
notas,insc:string[4];
med:array[1..6] of integer;

Begin

//Abre os arquivos CAND.TXT e NOTAS.TXT e faz as respectivas leituras
  assign(arqcan,'cand.ind');  
  assign(arqnot,'notas.txt');    
  reset(arqcan);
  reset(arqnot);
  
//repetição que pega as informações do arquivo cand.txt e coloca na memória  
  repeat 
    read(arqcan,reg);  
    ii:=ii+1;                			 // posição física do registro no arquivo cand.txt 
    vet[ii].pf:=e;
    str(reg.num,insc);           // str converte o número para string, reg.num é um inteiro e insc é string[4]
    while (length(insc) < 4) do     //while que verifica a necessidade e adiciona os zeros a esquerda
    	insert('0',insc,1);                
    	vet[ii].cc:=insc;
    	e:=e+1;
  until eof (arqcan);

  tot:=e;
  
  writeln('Aguarde...');
  ordem(vet,e);                       //procedure que ordena o vetor
 
//repetição de  atualização no arquivo cand.txt
   repeat
    soma:=0;
    readln(arqnot,nu);
    insc:=copy(nu,1,4);
    pebin1(vet,insc,tot,ii);
    seek(arqcan,vet[ii].pf);      //posiciona o cursor no arquivo CAND               
    read(arqcan,reg);           // faz a leitura e guarda no registro
  
    if(reg.falta = 0 ) then
 
 	//Alteração e adição das notas
		begin
      cont:=cont+1;
      
      //for de adição das notas no campo de notas
      for i:= 1 to 6 do               //6 disciplinas 
	      begin
	        ind:=i*4;                     //1*4=4 que indica a posição de numero do candidato mas não é mostrada no algoritmo
	        notas:=copy(nu,ind+1,ind+4); //ind+1 indica aonde inicia e ind+4 aonde acaba as questões de cada disciplina  ex: ind=1*4=4 => ind+1=4+1=5(inicio das questões de L.E.M) =>ind+4=4+4=8 (fim das questões de L.E.M)
	        val(notas,num,erro);          // procedure val converte uma cadeia de char para inteiro ou real
	        reg.notas[i]:= num;           //armazena as notas em reg.notas
	        med[i]:= med[i] + num;        //faz a soma de todas as notas para ser calculada média na linha 86             
	      end;
      										
    end;
    
    
    seek(arqcan,vet[ii].pf);                //altera e grava novamente
    write(arqcan,reg);
  until eof (arqnot);
  
  close(arqnot);                   // Fechar os arquivos cand.txt e notas.txt
  close(arqcan);
  
  
	//Writeln que mostra as médias das disciplinas
	clrscr;
  writeln('DISCIPLINA :               MÉDIA:');
  for i := 1 to 6 do
  	writeln(disciplinas[i],(med[i]/cont):10:2);       //aqui ocorre o calculo das médias onde a soma das médias feita no for é dividida pela quntidade de notas lidas
  	writeln('CANDIDATOS PRESENTES:',cont:5);
   fim;
  
End.
  
  
  
