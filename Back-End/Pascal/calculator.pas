program calculadora;

 var
  resultado,x,y,aux : real;
  msg,opcao,ordem : string;
  n,e,d : byte;

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

 procedure menu( e,d : byte);
  begin
   if opcao <> 'E' then
    begin
     if msg <> 'erro' then
      begin
       _;wl(' ajuda, sair, on, ce, =, +,  -,  *,  /, i, r, p ');
       _;writeln(' resultado : ',resultado :e :d); // Last answer 
       _;writeln(' Digite uma operacao : '); // Input a operation
       rl(opcao);
      end
     else
       msg := 'ok';
    end
   else
    begin
     _;wl(' Operacao Invalida ! ');_; // Invalid operation
     write(' ');
     rl(opcao);
    end;
  end;

 procedure inicializar; // Booting 
  begin
   _;wl(' Intervalo de variacao real : ');_; // Choose input and decimal input width
   write(' ');
   readln(e,d);
   _;writeln(' Valor inicial : ');_; // Choose initial value.
   rn(x);
   resultado := 0 + x;
   y := x;
   msg := 'ok';
   ordem := 'on';
  end;

 procedure clear;
  begin
   resultado := 0;
   opcao := ' ';
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
    begin
     inversao := 1 / x;
     msg := 'ok';
    end
   else
    msg := 'erro';
  end;

 function raiz_quadrada( x : real ) : real;
  begin
   if x >= 0 then
    begin
     raiz_quadrada := sqrt( x );
     msg := 'ok';
    end
   else
    msg := 'erro';
  end;

 function potencia( x : real; y : byte) : extended;
  var
   i : integer;
  begin
   if y >= 0 then
    begin
     if  not( ( x=0 )  and ( y=0 ) ) then
      begin
       potencia := x;
       x := 1;
       for i:= 1 to y do
       x := x * potencia;
       potencia := x;
       msg := 'ok';
      end
     else
      begin
       (* Valor arbitrario fora do conjunto imagem da fun‡Æo *)
       msg := 'erro';
      end;
    end
   else
    msg := 'ok';
  end;
 begin
  inicializar;
  repeat

   menu(e,d);
   x := resultado;
   case opcao of
   '+':
    begin
     rn(y);
     resultado := adicao(x,y);
    end;
   '-':
    begin
     rn(y);
     resultado := subtracao(x,y);
    end;
   '*':
    begin
     rn(y);
     resultado := multiplicacao(x,y);
    end;
   '/':
    begin
     rn(y);
     aux := divisao(x,y);
     if msg = 'erro' then
      ordem := 'off'
     else
      begin
       resultado := aux;
      end;
    end;
   'i':
    begin
     aux := inversao(x);
     if msg = 'erro' then
      ordem := 'off'
     else
      begin
       resultado := aux;
      end;
    end;
    'r':
    begin
     aux := raiz_quadrada(x);
     if msg = 'erro' then
       ordem := 'off'
     else
      if msg <> 'erro' then
       begin
        resultado := aux;
       end;
    end;
    'p':
    begin
     rb(n);
     aux := potencia(x,n);
     if msg = 'erro' then
      ordem := 'off'
     else
      begin
       resultado := aux;
      end;
     end;
    '=':
     begin
      rn(y);
      resultado := y;
     end;
    'ce':
     clear; // Clear number
    'sair':
     opcao := 'sair'; // Quit
    'ajuda':
     begin
      wl(' + : soma 2 numeros ');
      wl(' - : subtrai o 2nd numero do 1st ');
      wl(' * : multiplica 2 numeros ');
      wl(' / : divide o 1st numero pelo 2nd ');
      wl(' i : retorna o inverso de 1 numero ');
      wl(' r : retorna a raiz quadrada de um numero ');
      wl(' p : retorna o 1st numero elevado ao 2nd ');
      wl(' = : iguala o RESULTADO a 1 numero qualquer ');
      wl(' ce : iguala o RESULATADO e ultima OPCAO a "zero" ');
      wl(' sair : fecha o programa ');
      wl(' on : reinicializa o calculo  ');
      wl(' ajuda : exibe estas instrucoes ');
      opcao := ' ';
     end;
    else
     opcao := 'E'; // Invalid option
   end;
    if msg = 'erro' then
     begin
      repeat
       if ordem = 'on' then
        inicializar
       else
        begin
         wl(' erro ');
         _;wl(' Digite "on" para reinicializar ');
         rl(ordem);
         msg := 'erro';
         menu(e,d);
         msg := 'erro';
        end;
      until msg = 'ok';
     end
  until opcao = 'sair';
 end.
