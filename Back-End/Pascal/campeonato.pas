program campeonato; //Championship
 var
  v1,e1,d1,v2,e2,d2,p1,p2 : integer;
  t1,t2 : string;

  begin
     writeln(' ');
     writeln(' Digite o nome do primeiro time '); // Input a soccer team name
     writeln(' ');
     readln(t1);
     writeln(' ');
     writeln(' Digite o numero de vitorias do ', t1 , ' '); // Input soccer team' victory count
     writeln(' ');
     read(v1);
     writeln(' ');
     writeln(' Digite o numero de empates do ', t1 , ' '); // Input soccer team' draw count
     writeln(' ');
     read(e1);
     writeln(' ');
     writeln(' Digite o numero de derrotas do ', t1 , ' '); // Input soccer team' defeat count
     writeln(' ');
     read(d1);
     p1:= (3*v1) + (e1) + (0*d1); // Compute team's championship punctuation 
     writeln(' ');
     writeln(' ');
     writeln(' Digite o nome do segundo time '); // Input a second soccer team name
     writeln(' ');
     readln;
     readln(t2);
     writeln(' ');
     writeln(' Digite o numero de vitorias do ', t2 , ' '); // Input second soccer team' victory count
     writeln(' ');
     read(v2);
     writeln(' ');
     writeln(' Digite o numero de empates do ', t2 , ' '); // Input second soccer team' draw count
     writeln(' ');
     read(e2);
     writeln(' ');
     writeln(' Digite o numero de derrotas do ', t2 , ' '); // Input soccer team' defeat count
     writeln(' ');
     read(d2);
     p2:= (3*v2) + (e2) + (0*d2); // Compute second team's championship punctuation 
     writeln(' ');
     if p1>p2 then
       writeln(' O ',t1,' ‚ campeao ! ') // First team is the champion!
     else
         if p1<p2 then
           writeln(' O ',t2,' ‚ campeao ! ') // Second team is the champion!

         else
           writeln(' Deu empate ! '); // It's a draw!
     readln;
     readln;
  end.






