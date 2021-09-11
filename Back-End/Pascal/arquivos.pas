program arquivos;

type
 arquivo = record
            nome : string;
            autor : string;
            ultima_alteracao : string;
            conteudo : text;
           end;
 arquivo_aux = array[1..100] of arquivo;

var
 a : text;
 i,j,total,indice : byte;
 aux : arquivo_aux;
 linha,resposta : string;

procedure le_lista;
 begin
  assign (a,'\pas\lista.txt');
  reset (a);
  total := 0;
  while not eof(a) do
   begin
    total := total + 1;
    readln (a,linha);
    aux[total].nome := copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].autor := Copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
    aux[total].ultima_alteracao := copy (linha,1,pos(chr(9),linha)-1);
    delete (linha,1,pos(chr(9),linha));
   end;
  close(a);
 end;

function indice_nome(s : string; b : arquivo_aux) : byte;
 var
  n,temp : integer;
 begin
  temp := 0;
  for n := 1 to total do
   begin
    if s = b[n].nome then
     temp := n;
   end;
  indice_nome := temp;
 end;

function indice_autor(s : string; b : arquivo_aux) : byte;
 var
  n,temp : integer;
 begin
  temp := 0;
  for n := 1 to total do
   begin
    if s = b[n].autor then
     temp := n;
   end;
  indice_autor := temp;
 end;

function indice_ultima_alteracao(s : string; b : arquivo_aux) : byte;
 var
  n,temp : integer;
 begin
  temp := 0;
  for n := 1 to total do
   begin
    if s = b[n].ultima_alteracao then
     temp := n;
   end;
  indice_ultima_alteracao := temp;
 end;

procedure ordena_arquivos;
 var
  temp : arquivo;
  mudou : boolean;
 begin
  repeat
   mudou := false;
   for i := 1 to total-1 do
    begin
     if aux[i].nome > aux[i+1].nome then
      begin
       temp.nome := aux[i].nome;
       temp.autor := aux[i].autor;
       temp.ultima_alteracao := aux[i].ultima_alteracao;
       temp.conteudo := aux[i].conteudo;
       aux[i].nome := aux[i+1].nome;
       aux[i].autor := aux[i+1].autor;
       aux[i].ultima_alteracao := aux[i+1].ultima_alteracao;
       aux[i].conteudo := aux[i+1].conteudo;
       aux[i+1].nome := temp.nome;
       aux[i+1].autor := temp.autor;
       aux[i+1].ultima_alteracao := temp.ultima_alteracao;
       aux[i+1].conteudo := temp.conteudo;
       mudou := true;
      end;
    end;
  until not mudou;
 end;

procedure salva_lista;
 var
  n : byte;
 begin
  assign(a,'\pas\lista.txt');
  rewrite(a);
  for n := 1 to total do
   begin
    writeln(a,aux[n].nome,chr(9),aux[n].autor,chr(9),aux[n].ultima_alteracao,chr(9));
   end;
  close(a);
 end;

procedure cria_arquivo;
 var
  linha_temp,nome_temp : string;
  total_aux : byte;
 begin
  if total < 100  then
   begin
    resposta := 's';
    total_aux := total;
    total := total + 1;
    writeln(' Insira o nome');
    readln(nome_temp);
    if ( indice_nome(nome_temp,aux) <> 0 )then
     begin
      writeln(' Esse nome j  foi registrado, quer rescrever o arquivo?');
      readln(resposta);
      if (resposta = 's') or (resposta = 'S') then
       total := indice_nome(nome_temp,aux);
     end;
    aux[total].nome := nome_temp;
    if (resposta = 's') or (resposta = 'S') then
     begin
      writeln(' Insira o autor');
      readln(aux[total].autor);
      writeln(' Insira a data da ultima alteracao ');
      readln(aux[total].ultima_alteracao);
      writeln(' Insira o conteudo encerrando-o por "ENTER" seguido de "FIM"');
      assign(aux[total].conteudo,'\pas\' + aux[total].nome + '.txt');
      rewrite(aux[total].conteudo);
      repeat
       readln(linha_temp);
       writeln(aux[total].conteudo,linha_temp);
      until linha_temp = 'FIM';
      close(aux[total].conteudo);
      ordena_arquivos;
     end
    else
     writeln( ' Operacao cancelada!');
   end
  else
   writeln(' Capacidade ultrapassada!');
  if linha_temp = 'FIM' then
   total := total_aux + 1;
 end;

procedure busca_indice_arquivo;
 var
  nom,aut,ult_alt : string;
  temp : byte;
 begin
  writeln(' Escolha o parametro de busca : "nome","autor" ou "ultima alteracao"');
  readln(resposta);
  case resposta of
  'nome' :
   begin
    writeln(' Escreva o nome do arquivo');
    readln(nom);
    temp := indice_nome(nom,aux);
    if temp <> 0 then
     indice := temp
    else
     writeln(' Arquivo nao encontrdo!');
   end;
  'autor' :
   begin
    writeln(' Escreva o nome do autor');
    readln(aut);
    temp := indice_autor(aut,aux);
    if temp <> 0 then
     indice := temp
    else
     writeln(' Arquivo nao encontrdo!');
   end;
  'ultima alteracao' :
   begin
    writeln(' Escreva a data da ultima alteracao');
    readln(ult_alt);
    temp := indice_ultima_alteracao(ult_alt,aux);
    if temp <> 0 then
     indice := temp
    else
     writeln(' Arquivo nao encontrdo!');
   end;
  else
   writeln(' Operacao nao executavel!');
  end;
 end;

procedure edita_arquivo;
 var
  linha_temp : string;
 begin
  busca_indice_arquivo;
  assign(aux[indice].conteudo,'\pas\' + aux[indice].nome + '.txt');
  writeln(' Deseja "acrescentar" dados ou "reescrever" o arquivo?');
  repeat
   readln(resposta);
   if resposta = 'acrescentar' then
    append(aux[indice].conteudo)
   else if resposta = 'reescrever' then
    rewrite(aux[indice].conteudo)
   else
    writeln(' Operacao nao executavel');
  until (resposta = 'acrescentar') or (resposta = 'reescrever');
  writeln(' Insira o conteudo encerrando-o por "ENTER" seguido de "FIM"');
  repeat
   readln(linha_temp);
   writeln(aux[indice].conteudo,linha_temp);
  until linha_temp = 'FIM';
  close(aux[indice].conteudo);
 end;

procedure exibe_arquivo;
 var
  linha_temp : string;
 begin
  busca_indice_arquivo;
  assign(aux[indice].conteudo,'\pas\' + aux[indice].nome + '.txt');
  reset(aux[indice].conteudo);
  while not (eof(aux[indice].conteudo)) do
   begin
    readln(aux[indice].conteudo,linha_temp);
    writeln(linha_temp);
   end;
  close(aux[indice].conteudo);
 end;

procedure exibe_lista;
 begin
  for i := 1 to total do
   writeln(aux[i].nome,chr(9),aux[i].autor,chr(9),aux[i].ultima_alteracao,chr(9));
 end;

procedure exclui_arquivo;
 var
  temp : arquivo_aux;
  nome_aux : string;
  conteudo_aux : text;
 begin
  busca_indice_arquivo;
  nome_aux := aux[indice].nome;
  conteudo_aux := aux[indice].conteudo;
  for i := 1 to total do
   begin
    if i < indice then
     begin
      temp[i].nome := aux[i].nome;
      temp[i].autor := aux[i].autor;
      temp[i].ultima_alteracao := aux[i].ultima_alteracao;
      temp[i].conteudo := aux[i].conteudo;
     end
    else if i <> indice then
     begin
      temp[i-1].nome := aux[i].nome;
      temp[i-1].autor := aux[i].autor;
      temp[i-1].ultima_alteracao := aux[i].ultima_alteracao;
      temp[i-1].conteudo := aux[i].conteudo;
     end
    else
     temp[i].nome := '';
   end;
  total := total - 1;
  for i := 1 to total do
   begin
    aux[i].nome := temp[i].nome;
    aux[i].autor := temp[i].autor;
    aux[i].ultima_alteracao := temp[i].ultima_alteracao;
    aux[i].conteudo := temp[i].conteudo;
   end;
  assign(conteudo_aux,'\pas\' + nome_aux + '.txt');
  erase(conteudo_aux);
  writeln(' O arquivo ',nome_aux,' foi apagado com sucesso!');
  salva_lista;
  le_lista;
  ordena_arquivos;
 end;

procedure busca_de_termos;
 var
  linha_temp,termo : string;
  linha,quantidade,temp: integer;
  fim : boolean;
 begin
  writeln(' Digite um termo a ser buscado');
  readln(termo);
  writeln(' Buscar em apenas "um" arquivo ou em "todos"?');
  readln(resposta);
  if resposta = 'um' then
   begin
    busca_indice_arquivo;
    assign(aux[indice].conteudo,'\pas\' + aux[indice].nome + '.txt');
    reset(aux[indice].conteudo);
    linha := 0;
    quantidade := 0;
    while not (eof(aux[indice].conteudo)) do
     begin
      readln(aux[indice].conteudo,linha_temp);
      linha := linha + 1;
      if pos(termo,linha_temp) <> 0 then
       begin
         writeln(' O termo "',termo,'" foi encontrado na linha ',linha,' do arquivo ',aux[indice].nome);
         quantidade := 1;
       end
     end;
     if quantidade = 0 then
        writeln(' O termo "',termo,'" nao foi encontrado no arquivo ',aux[indice].nome);
    close(aux[indice].conteudo);
   end
  else if resposta = 'todos' then
   begin
    for i := 1 to total do
     begin
      assign(aux[i].conteudo,'\pas\' + aux[i].nome + '.txt');
      reset(aux[i].conteudo);
      linha := 0;
      quantidade := 0;
      while not (eof(aux[i].conteudo)) do
       begin
        readln(aux[i].conteudo,linha_temp);
        linha := linha + 1;
        if pos(termo,linha_temp) <> 0 then
           begin
             writeln(' O termo "',termo,'" foi encontrado na linha ',linha,' do arquivo ',aux[i].nome);
             quantidade := 1;
           end
       end;
       if quantidade = 0 then
          writeln(' O termo "',termo,'" nao foi encontrado no arquivo ',aux[i].nome);
      close(aux[i].conteudo);
     end;
   end;
 end;

begin
 le_lista;
 ordena_arquivos;
 repeat
  writeln;
  writeln(' Digite a palavra entre aspas para iniciar o procedimento:');
  writeln(' "criar" um novo arquivo');
  writeln(' "editar" um arquivo');
  writeln(' "excluir" um arquivo');
  writeln(' "exibir" o conteudo de um arquivo');
  writeln(' "busca" seletiva de termos');
  writeln(' "lista" de arquivos ordenada a criterio do usuario');
  writeln(' "sair"');
  writeln;
  readln(resposta);
  case resposta of
  'criar' :
   cria_arquivo;
  'editar' :
   edita_arquivo;
  'excluir' :
   exclui_arquivo;
  'exibir' :
   exibe_arquivo;
  'busca' :
   busca_de_termos;
  'lista' :
   exibe_lista;
  else
   begin
    if resposta <> 'sair' then
     writeln(' Opcao nao executavel!');
   end;
  end;
 until resposta = 'sair';
 writeln(' Salvar lista?');
 readln(resposta);
 if (resposta = 's') or (resposta = 'S') then
  salva_lista
 else
  writeln(' Nao houve quaisquer alteracoes ao arquivo gravado !');
 writeln('FIM');
 readln
end.
