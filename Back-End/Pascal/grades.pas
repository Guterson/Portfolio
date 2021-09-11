program notas; //Numeric Grades

var

nota,med,qnota,mnota,tnota : real;
i: INTEGER;

begin

  i:=1;
  mnota:=0;
  while i<=1000 do
   begin
     writeln(' ');
     writeln('digite a nota :'); // Request a grade
     writeln(' ');
     readln (nota);
     if nota>=0 then
        begin
          tnota:=tnota+nota; // Grades summation
          qnota:=qnota+1;
          if mnota<nota then
             begin
               mnota:=nota;
             end;
        end;
     if nota<0 then
        begin
          i:=1000;
          break;
        end;
   end;
  med:=tnota/qnota;
  writeln(' ');
  writeln('Numero de notas :', qnota: 2 : 0); // Number of grades
  writeln(' ');
  writeln('Media de notas  :', med : 2 : 2); // Grades average
  writeln(' ');
  writeln('Maior nota      :', mnota : 2 : 2); // Biggest grade
  readln
end.


