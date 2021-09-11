program Rock_in_Rio;
 var
  na : real;
  begin
    writeln(' ');
    writeln(' Digite o n£mero de pessoas que estÆo acessando o site '); // Input number of simultaneous site hits
    writeln(' ');
    read(na);
    if na>0 then
      begin
      writeln(' ');
      if na<105000 then
        writeln(' O site ira responder em 10 segundos '); // Set script response time to 10s
      if (na>=105000) and (na<180000) then
        writeln(' O site ira responder em 30 segundos '); // Set  script response time to 30s
      if (na>=180000) and (na<270000) then
        writeln(' O site ira responder em 2 minutos '); // Set script response time to 2m
      if (na>=270000) and (na<300000) then
        writeln(' O site ira responder em 10 minutos '); // Set script response time to 10m
      if na>=300000 then
        writeln(' O site nao ira responder '); // Reject hits requests
      end
    else
      begin
        writeln(' ');
        writeln(' Numero nao representavel '); // Invalid input (nonpositive)
      end;
    readln;
    readln;
 end.


