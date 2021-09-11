program funcao_potencia;

 var
  x : real;
  y : integer;
  a : extended;
  e,d : byte;

 function potencia( x : real; y : integer) : extended; // Exponentiation
  var
   i : integer;
  begin
   if y >= 0 then
    begin
     if  not( ( x=0 )  and ( y=0 ) ) then // Positive exponent
      begin
       potencia := x;
       x := 1;
       for i:= 1 to y do
       x := x * potencia;
       potencia := x;
      end
     else
      potencia := -1;
    end
   else // Negative exponent
    begin
     y := abs(y);
     potencia := 1 / (potencia(x,y)); 
    end;
  end;
 begin
  readln(e); // Input field width
  readln(d); // Input decimal field width
  readln(x); // Input the base
  readln(y); // Input the exponent
  a := potencia(x,y);
  writeln(a :e :d);
  readln
 end.
