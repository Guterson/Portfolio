program carros;

type
 carro = record
          fabricante : string;
          modelo : string;
          ano_de_fabricacao : string;
          placa : string;
          preco : string;
         end;
 catalogo_aux = array[1..101] of carro;

var
 c : carro;
 catalogo : text;
 i,j,total : byte;
 resposta : char;
 aux : catalogo_aux;
 linha,opcao,model : string;

procedure le_catalogo;
 begin
  assign (catalogo,'\pas\carros.txt');
  reset (catalogo);
  total := 0;
  while not(Eof(catalogo)) do
   begin
    total := total + 1;
    readLn (catalogo,linha);
    aux[total].fabricante := copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].modelo := Copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].ano_de_fabricacao := copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].placa := copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].preco := linha;
   end;
  close(catalogo);
 end;

function pertence(a : string; c : catalogo_aux) : boolean;
 var
  n,temp : integer;
 begin
  temp := 0;
  for n := 1 to total do
   begin
    if a = c[n].modelo then
     temp := temp + 1;
   end;
  if temp = 0 then
   pertence := false
  else
   pertence := true;
 end;

procedure exibe_por_modelo;
 var
  j : byte;
  continuar : string;
 begin
  writeln(' Digite um modelo');
  readln(model);
  if pertence(model,aux) then
   begin
    continuar := 's';
    writeln('Fabricante',chr(9),'Modelo',chr(9),'Ano_de_fabricacao',chr(9),'Placa',chr(9),'Preco');
    for j := 1 to total do
     begin
      if (aux[j].modelo = model) and ( not(continuar = 'n') ) then
       begin
        write(aux[j].fabricante,chr(9));
        write(aux[j].modelo,chr(9));
        write(aux[j].ano_de_fabricacao,chr(9));
        write(aux[j].placa,chr(9));
        write(aux[j].preco,chr(9));
        writeln;
        writeln(' Deseja ver mais um ? ');
        readln(continuar);
       end;
     end;
   end;
 end;

procedure listagem_total;
 begin
  writeln('Fabricante',chr(9),'Modelo',chr(9),'Ano_de_fabricacao',chr(9),'Placa',chr(9),'Preco');
  for j := 1 to total do
   begin
    write(aux[j].fabricante,chr(9));
    write(aux[j].modelo,chr(9));
    write(aux[j].ano_de_fabricacao,chr(9));
    write(aux[j].placa,chr(9));
    write(aux[j].preco,chr(9));
    writeln;
   end;
 end;

procedure listagem_por_ano;
 var
  ano : string;
  ano_aux : integer;
  erro : byte;
 begin
  readln(ano);
  if length(ano) = 4 then
   val(ano,ano_aux,erro)
  else
   ano_aux := 0;
  if ( (ano_aux > 1879) or (ano_aux < 2013) ) and ( erro = 0 ) then
   begin
    writeln('Fabricante',chr(9),'Modelo',chr(9),'Ano_de_fabricacao',chr(9),'Placa',chr(9),'Preco');
    for j := 1 to total-1 do
     begin
      if aux[j].ano_de_fabricacao = ano then
       begin
        write(aux[j].fabricante,chr(9));
        write(aux[j].modelo,chr(9));
        write(aux[j].ano_de_fabricacao,chr(9));
        write(aux[j].placa,chr(9));
        write(aux[j].preco,chr(9));
        writeln;
       end;
     end;
   end;
 end;

procedure ordena_catalogo;
 var
  temp : carro;
  mudou : boolean;
  temp2,temp3 : string;
 begin
  repeat
   mudou := false;
   for i := 1 to total-1 do
    begin
     temp2 := copy(aux[i].placa,1,3);
     temp3 := copy(aux[i+1].placa,1,3);
     if aux[i].modelo > aux[i+1].modelo then
      begin
       temp.fabricante := aux[i].fabricante;
       temp.modelo := aux[i].modelo;
       temp.ano_de_fabricacao := aux[i].ano_de_fabricacao;
       temp.placa := aux[i].placa;
       temp.preco := aux[i].preco;
       aux[i].fabricante := aux[i+1].fabricante;
       aux[i].modelo := aux[i+1].modelo;
       aux[i].ano_de_fabricacao := aux[i+1].ano_de_fabricacao;
       aux[i].placa := aux[i+1].placa;
       aux[i].preco := aux[i+1].preco;
       aux[i+1].fabricante := temp.fabricante;
       aux[i+1].modelo := temp.modelo;
       aux[i+1].ano_de_fabricacao := temp.ano_de_fabricacao;
       aux[i+1].placa := temp.placa;
       aux[i+1].preco := temp.preco;
       mudou := true;
      end
     else if (temp2 > temp3) and (aux[i].modelo = aux[i+1].modelo) then
      begin
       temp.fabricante := aux[i].fabricante;
       temp.modelo := aux[i].modelo;
       temp.ano_de_fabricacao := aux[i].ano_de_fabricacao;
       temp.placa := aux[i].placa;
       temp.preco := aux[i].preco;
       aux[i].fabricante := aux[i+1].fabricante;
       aux[i].modelo := aux[i+1].modelo;
       aux[i].ano_de_fabricacao := aux[i+1].ano_de_fabricacao;
       aux[i].placa := aux[i+1].placa;
       aux[i].preco := aux[i+1].preco;
       aux[i+1].fabricante := temp.fabricante;
       aux[i+1].modelo := temp.modelo;
       aux[i+1].ano_de_fabricacao := temp.ano_de_fabricacao;
       aux[i+1].placa := temp.placa;
       aux[i+1].preco := temp.preco;
       mudou := true;
      end;
    end;
  until not mudou;
 end;

procedure inclui_carro;
 begin
  if total < 100  then
   begin
    total := total + 1;
    writeln(' Insira o fabricante');
    readln(aux[total].fabricante);
    writeln(' Insira o modelo');
    readln(aux[total].modelo);
    writeln(' Insira o ano de fabricacao');
    readln(aux[total].ano_de_fabricacao);
    writeln(' Insira a placa');
    readln(aux[total].placa);
    writeln(' Insira o preco');
    readln(aux[total].preco);
    ordena_catalogo;
   end;
 end;

procedure corrigir_preco;
 var
  carros,m,n : byte;
  tipo,valor,identificacao : string;
  achou : boolean;

 begin
  carros := 0;
  writeln(' Insira o modelo');
  readln(tipo);
  for n := 1 to total do
   begin
    if (tipo = aux[n].modelo) then
     begin
      carros := carros + 1;
      m := n;
     end;
   end;
  if carros = 1 then
   begin
    writeln(' Insira o novo preco');
    readln(valor);
    aux[m].preco := valor;
   end;
  if carros > 1 then
   begin
    writeln(' Insira a placa');
    readln(identificacao);
    repeat
     if identificacao = aux[n].placa then
      begin
       writeln(' Insira o novo pre‡o');
       readln(valor);
       aux[n].preco := valor;
       achou := true;
      end;
    until achou = true;
   end;
 end;

procedure salva_catalogo;
 var
  n : byte;
 begin
  assign(catalogo,'\pas\carros.txt');
  rewrite(catalogo);
  for n := 1 to total do
   begin
    writeln(catalogo,aux[n].fabricante,chr(9),aux[n].modelo,chr(9),aux[n].ano_de_fabricacao,chr(9),aux[n].placa,chr(9),aux[n].preco,chr(9));
   end;
  close(catalogo);
 end;

begin
 le_catalogo;
 ordena_catalogo;
 repeat
  writeln(' Digite a palavra entre aspas para iniciar o procedimento:');
  writeln(' "incluir" um novo carro ao cadastro');
  writeln(' "editar" preco de um carro');
  writeln(' "consultar" dados de um carro');
  writeln(' exibir uma lista de carros de um respectivo "ano"');
  readln(opcao);
  case opcao of
  'incluir' :
   inclui_carro;
  'editar' :
   corrigir_preco;
  'consultar' :
   exibe_por_modelo;
  'ano' :
   listagem_por_ano;
  'todos' :
   listagem_total;
  end;
 until opcao = 'sair';
 salva_catalogo;

end.


