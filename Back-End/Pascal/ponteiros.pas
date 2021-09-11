program arranja;

type
 vetor = array[1..100] of integer;
 ponteiro = ^integer;

var
 inicio,fim,ultimo,aux1,xi : integer;
 v : vetor;
 pti,ptf : ponteiro;
 mudou : char;

procedure inicializa_vetor( a : vetor );
 var
  inteiro : integer;
  i : byte;
 begin
  for i := 1 to 100 do
   a[i] := 0;
 end;


procedure questao3;
 begin
  repeat
   mudou := 'n';
   for xi := inicio to (fim - 1) do
    begin
     if (v[xi] > v[xi+1]) then
      begin
       aux1:= v[xi];
       v[xi]:= v[xi+1];
       v[xi+1]:= aux1;
       mudou := 's';
      end;
    end;
  until (mudou = 'n');
 end;

procedure le_vetor(var  a : vetor );
 var
  msg : string;
  inteiro : integer;
 begin
  ultimo := 0;
  msg := 's';
  while msg = 's' do
   begin
    ultimo := ultimo + 1;
    msg := 'n';
    readln(inteiro);
    a[ultimo] := inteiro;
    writeln(' Outro?');
    readln(msg);
    writeln(' Qual?');
   end;
 end;

procedure exibe_vetor_todo(a : vetor);
 var
  i : integer;
 begin
  if ultimo <> 1 then
   begin
    for i := 1 to ultimo do
     write(a[i],', ');
   end
  else
   writeln(a[1]);
 end;

procedure exibe_vetor_parte(a : vetor);
 var
  i : integer;
 begin
  if inicio <> fim then
   begin
    for i := inicio to fim do
     write(a[i],', ');
   end
  else
   writeln(a[inicio]); (*ou fim*)
 end;

begin
 inicializa_vetor(v);
 le_vetor(v);
 exibe_vetor_todo(v);
 writeln;
 writeln(' De :');
 readln(inicio);
 writeln(' Ate :');
 readln(fim);
 if inicio <> fim then
  begin
   pti := @v[inicio];
   ptf := @v[fim];
   questao3;
   exibe_vetor_parte(v);
  end
 else
  writeln(' Ja ordenado');
 writeln;
 exibe_vetor_todo(v);
 readln;
end.



