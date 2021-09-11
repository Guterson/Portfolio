program grafo_entradas; // Graphs

type
 matriz = array[1..10 , 1..10] of longint;
 vertices = array[1..10] of string;
 arestas = array[1..45] of integer; // Edge

var
 i,j,k,aux,o : integer;
 x,y,comando,op : string;
 a,v : vertices;
 g : matriz;

procedure _;
 begin
  writeln;
 end;

procedure w;
 begin
  write(' ');
 end;

procedure inicializa_vetor(var z : vertices);
 var
  n : integer;
 begin
  for n := 1 to 10 do
   z[n] := '';
 end;

function vazio(z : vertices) : boolean; // Turns true if the are no vertices
 var
  n,aux : integer;
 begin
  aux := 0;
  for n := 1 to 10 do
   begin
    if z[n] <> '' then
     aux := aux + 1;
   end;
  if aux = 0 then
   vazio := true
  else
   vazio := false;
 end;

function indice(a : string; z : vertices; o : integer) : integer; // Returns the index of a element within the vertices
 var
  n,aux : integer;
 begin
  aux := 0;
  for n := 1 to o do
   begin
    if (a = z[n]) then
     aux := n;
   end;
  indice := aux;
 end;

procedure inicializa_arestas(var z : arestas);
 var
  n : integer;
 begin
  for n := 1 to 45 do
   z[n] := 0;
 end;

procedure inicializa_matriz(var w : matriz);
 var
  m,n : integer;
 begin
  for m := 1 to 10 do
   begin
    for n := 1 to 10 do
     w[m,n] := 0;
   end;
 end;

procedure exibe_matriz(var w : matriz; p : integer); // Show matrix
 var
  m,n : integer;
 begin
  for m := 1 to p do
   begin
    for n := 1 to p do
     write(' ',w[m,n]);
    _;
   end;
 end;

function pertence(a : string; v : vertices) : boolean;
 var
  n,aux : integer;
 begin
  aux := 0;
  for n := 1 to i do
   begin
    if a = v[n] then
     aux := aux + 1;
   end;
  if aux = 0 then
   pertence := false
  else
   pertence := true;
 end;

function valido(var a : string) : boolean;
 var
  aux : char;
  aux2,erro,max,n : integer;
 begin
  aux := a[1];
  val(aux,aux2,erro);
  max := length(a);
  for n := 1 to max do
   begin
    if a[n] = ' ' then
     a[n] := '_';
   end;
  if (erro = 0) then
   valido := false
  else
   valido := true;
 end;

procedure minusculo(var a : string);
 begin
  a := lowercase(a);
 end;

function produto_matriz(a,b : matriz; n : integer) : matriz;
 var
  i,j,k,soma : integer;
  h : matriz;
 begin
  for i := 1 to n do
   begin
    for j := 1 to n do
     begin
      soma := 0;
      for k := 1 to n do
       soma := soma + a[i,k] * b[k,j];
      h[i,j] := soma;
     end;
   end;
  produto_matriz := h;
 end;

function distancia(x,y : string; v : vertices) : integer;
 var
  a,b,c,n : integer;
  f : matriz;
 begin
  a := indice(x,v,o);
  b := indice(y,v,o);
  n := 1;
  f := g;
  c := g[b,a];
  readln;
  repeat
   if c = 0 then
    begin
     g := produto_matriz(g,f,o);
     exibe_matriz(g,o);
     readln;
     n := n + 1;
    end;
   c := g[a,b];
  until c <> 0;
  distancia := n;
  g := f;
 end;

function diametro(var g : matriz; n : integer) : integer;
 var
  h,f : matriz;
  i,j,aux,d : integer;
 begin
  d := 1;
  h := g;
  repeat
   aux := 0;
   for i := 1 to n do
    begin
     for j := 1 to n do
      begin
       if ( i<>j ) and ( g[i,j] = 0 ) then
        aux := aux + 1;
      end;
    end;
   writeln(aux);
   readln;
   if aux <> 0 then
    begin
     g := produto_matriz(g,h,n);
     d := d + 1;
     exibe_matriz(h,o);
     _;exibe_matriz(g,o);
    end;
  until aux = 0;
  diametro := d;
  g := h;
 end;

begin
 inicializa_matriz(g);
 repeat
  _;writeln(' O que deseja fazer ? ');_;
  w;readln(comando);_;
  minusculo(comando);
  case comando of
  'criar':
   begin
    inicializa_matriz(g);
    inicializa_vetor(v);
    writeln(' Objetos em vertice ate "ultimo" :');
    i := 1;
    _;writeln(' Cadastro ',i,' :');_;
    w;readln(x);_;
    minusculo(x);
    if x <> 'exit' then
     begin
      v[i] := x;
      i := i + 1;
      op := '';
     end;
    while (i <= 10) and (x <> 'ultimo') and (x <> 'exit') do
     begin
      _;writeln(' Cadastro ',i,' :');_;
      w;readln(x);_;
      minusculo(x);
      if x = 'exit' then
       begin
        _;writeln(' Sair (s\n)? ');
        _;w;readln(op);
        if op = 's' then
         begin
          i := 10;
          j := i;
         end;
       end
      else
     if not (pertence(x,v)) and (x <> 'ultimo') then
       begin
        v[i] := x;
        i := i + 1;
       end
      else
       begin
        _;writeln('Ja cadastrado');_;
       end;
      if (i = 1) and (x = 'ultimo') then
       begin
        _;writeln(' No minimo devem existir dois cadastros !');
        x := '';
       end;
     end;
     o := i-1;
    if x <> 'exit' then
     begin
      _;writeln(i);
      for aux := 1 to o do
       begin
        writeln(' ',aux,' _ ',v[aux]);
       end;
      _;writeln(' Relacoes em arestas :');_;
      j := 0;
     op := '';
     for aux := 1 to o do
      begin
       for j := 1 to o do
        begin
         if aux <> j then
          begin
           if (g[aux,j] <> 1 ) and (g[j,aux] <> 1) then
            begin
             _;writeln('O vertice "',v[aux],'" tem relacao com "',v[j],'" ?');
             repeat
              _;w;readln(op);
              minusculo(op);
              if op = 's' then
               begin
                g[aux,j] := 1;
                g[j,aux] := 1;
                op := 'n';
               end
              else if op <> 'n' then
               begin
                _;writeln(' ?');
               end;
             until op = 'n';
            end;
          end;
        end;
      end;
     end;
   end;
  'exibir':
   exibe_matriz(g,o);
  'distancia':
   begin
    _;writeln(' Digite os vertices relacionados :');
    _;w;readln(x);
    _;w;readln(y);
    aux := distancia(x,y,v);
    _;w;writeln(' Distancia : ',aux);
   end;
  'diametro':
   begin
    aux := diametro(g,o);
    _;w;writeln(' Diametro : ',aux);
   end;
  'sair':
    writeln(' FIM !');
  else
   writeln(' ?');
  end;
 until comando = 'sair';
 readln;
end.
