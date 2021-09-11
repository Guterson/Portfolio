program calculadora;

 var
  resultado,x,y,aux : real;
  msg,comando,opcao : string;
  n : byte;

 procedure _;
  begin
   writeln;
  end;

 procedure wl( n : string );
  begin
   writeln(n);
  end;

 procedure wn( n : real );
  begin
   writeln(n);
  end;

 procedure rl(var n : string );
  begin
  _;write(' ');
  readln(n);
  end;

 procedure rn(var n : real );
  begin
  _;write(' ');
  readln(n);
  end;

 procedure rb(var n : byte );
  begin
  _;write(' ');
  readln(n);
  end;

 procedure clear;
  begin
   resultado := 0;
  end;

 function adicao( x,y : real ) : real;
  begin
   adicao := x + y;
  end;

 function subtracao( x,y : real ) : real;
  begin
   subtracao := x - y;
  end;

 function multiplicacao( x,y : real ) : real;
  begin
   multiplicacao := x * y;
  end;

 function divisao( x,y : real ) : real;
  begin
   if y <> 0 then
    begin
     divisao := x / y;
     msg := 'ok';
    end
   else
    msg := 'erro';
  end;

 function inversao( x : real ) : real;
  begin
   if x <> 0 then
    inversao := 1 / x
   else
    msg := 'erro';
  end;

 function raiz_quadrada( x : real ) : real;
  begin
   if x >= 0 then
    raiz_quadrada := sqrt( x )
   else
    msg := 'erro';
  end;

 function potencia( x : real; y : byte) : extended;
  var
   i : integer;
  begin
   if  not( ( x=0 )  and ( y=0 ) ) then
    begin
     potencia := x;
     x := 1;
     for i:= 1 to y do
      x := x * potencia;
     potencia := x;
    end
   else
    begin
     (* Valor arbitrario fora do conjunto imagem da fun‡Æo *)
     msg := 'erro';
    end;
  end;
 begin
  _;wl('--------MENU--------');
  _;wl(' 0 - INSTRUCOES ... ');
  _;wl(' 1 - adciao ');
  _;wl(' 2 - subtracao ');
  _;wl(' 3 - multiplicacao ');
  _;wl(' 4 - divisao ');
  _;wl(' 5 - inversao ');
  _;wl(' 6 - potenciacao ');
  _;wl(' 7 - raiz quadrada ');
  _;wl(' 8 - CLEAR ');
  _;wl(' 9 - EXIT ');
  repeat
   rl(opcao);
   case opcao of
   '+':
    begin
     rn(x);
     rn(y);
     _;write(' ');writeln( adicao(x,y):1 :0 );
    end;
   '-':
    begin
     rn(x);
     rn(y);
     _;write(' ');writeln( subtracao(x,y):1 :0 );
    end;
   '*':
    begin
     rn(x);
     rn(y);
     _;write(' ');writeln( multiplicacao(x,y):1 :0 );
    end;
   '/':
    begin
     rn(x);
     rn(y);
     aux := divisao(x,y);
     if msg = 'erro' then
      begin
       _;write(' ');writeln('erro');
      end
     else
      begin
       _;write(' ');writeln( aux:1 :0 );
      end;
    end;
   'i':
    begin
     rn(x);
     _;write(' ');writeln( inversao(x):1 :0 );
    end;
    'r':
    begin
     rn(x);
     _;write(' ');writeln( raiz_quadrada(x):1 :0 );
    end;
    'p':
    begin
     rn(x);
     rb(n);
     _;write(' ');writeln( potencia(x,n):1 :0 );
    end;
   else
    begin
     _;wl(' ERRO ');
    end;
   end;
  until comando = 'sair';
  readln;
 end.
