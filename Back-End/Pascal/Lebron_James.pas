program Lebron_james;

 type
  jogos = record
           p : shortint;
           n : byte;
          end;
  mes = array[1 .. 12] of jogos;

 var
  a : mes; // Month
  b : jogos; // Games
  c,j,i,dia,pontuacao,max : integer;

 procedure preenche_variaveis( a : mes; c : integer );
  var x : integer;
  begin
   if ( dia >= 1 ) and ( dia <= max ) then // Global variable "max"
    begin
     a[c].p := a[c].p + pontuacao; // Accumulated score
     a[c].n := a[c].n + 1; // Accumulated number of games
    end
   else
    begin
     writeln(' Dia invalido !'); // Invalid day number!
     {d := d + 0;}
     readln;
    end;
  end;

 begin
  (*inicia_variaveis(a);*)
  j := 1;
  repeat
   readln(pontuacao); // Input score
   readln(dia); // Input day
   readln(c); // Input month  
   case c of
    1,3,5,7,8,10,12 :
     begin
      max := 31;
      preenche_variaveis(a,c); // Global variable "a"
      j := j + 1;
     end;

    4,6,9,11 :
     begin
      max := 30;
      preenche_variaveis(a,c);
      j := j + 1;
     end;

    2 : // February
     begin
      max := 28;
      preenche_variaveis(a,c);
      j := j + 1;
     end;

    else
     begin
      writeln(' Mes invalido '); // Invalid month 
      readln;
     end;
    end;
  until j > 20; // Imposed limit
  j := 0;
  repeat
   writeln(a[j].p); // Accumulated score per month per loop
   writeln(a[j].n); // Accumulated number of games per month per loop
   j := j + 1;
  until j > 12;
  readln
 end.





