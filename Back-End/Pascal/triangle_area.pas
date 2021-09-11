program area_triangulo; // Triangle area
 type
  ponto = record   (* a) *) // Cartesian point
           x : real;
           y : real;
          end;
  triangulo = record
               p1 : ponto;
               p2 : ponto;
               p3 : ponto;
              end;

 var
  T : triangulo;
  m,n : byte;

 function distancia( p1,p2 : ponto ) : real;

  var
   a,b,c,d : real;

  begin
   a := p1.x;
   b := p1.y;
   c := p2.x;
   d := p2.y;
   distancia := sqrt( sqr( c - a) + sqr( d - b) ); // Euclidian distance
  end;

 function area_triangulo( var T: triangulo ) : real;

  var
   a,b,c,d,e,f : real;

  begin
   a := T.p1.x;
   b := T.p1.y;
   c := T.p2.x;
   d := T.p2.y;
   e := T.p3.x;
   f := T.p3.y;
   area_triangulo := 0.5 * abs( ( a*d + b*e + c*f ) - ( e*d + c*b + b*a ) ); // Euclidian area
  end;

  begin
   readln(m); // Input field width
   readln(n); // Input decimal field width
   readln(T.p1.x); // Input points coordinates 
   readln(T.p1.y);
   readln(T.p2.x);
   readln(T.p2.y);
   readln(T.p3.x);
   readln(T.p3.y);
   writeln( distancia( T.p1,T.p2 ):m :n ); // Show points euclidian distances
   writeln( distancia( T.p2,T.p3 ):m :n );
   writeln( distancia( T.p3,T.p1 ):m :n);
   writeln( area_triangulo(T):m :n ); // Show triangle's euclidian area
   readln;
  end.
