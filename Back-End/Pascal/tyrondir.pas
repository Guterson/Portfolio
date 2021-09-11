program tyrondir;
 var
  feitico: char; // Spell 
  nome,MAXnome,MINnome : string;
  nm,nf,MAXp,MINp,MAXnm,MINnm,pt,tt,opcao : integer;
   begin
     nm:=1;
     nf:=1;
     pt:= 0;
     tt:= 0;
     MAXp:= 11;
     MINp:= 50;
     repeat
       writeln(' ');
       writeln(' Digite o nome do mago numero ',nm,' :  '); // Input a mage's name per loop
       readln(nome);
       writeln(' ');
       while nf<11 do
        begin
         writeln(' ');
         writeln(' Escreva o feitico de numero ',nf,' : '); // Input a spell's "name" per loop
         readln(feitico);
         writeln(' ');
          case feitico of
           'a':
            begin
             pt:= pt + 1; // Spell score summation
             tt:= tt + 5; // Spell learning time summation
             nf:= nf + 1;
            end;
           'v':
            begin
             pt:= pt + 3;
             tt:= tt + 7;
             nf:= nf + 1;
            end;
           'd':
            begin
             pt:= pt + 5;
             tt:= tt + 10;
             nf:= nf + 1;
            end;
          else
           begin
            nf:=nf + 0;
            writeln(' ');
            writeln(' Feiti‡o desconhecido ! '); // Unknow spell!
            writeln(' ');
           end;
          end;
        end;
         if pt>=MAXp then // Get max score mage
          begin
            MAXp:= pt;
            MAXnm:= nm;
            MAXnome:= nome;
          end;
         if pt<=MINp then // Get min score mage
          begin
            MINp:= pt;
            MINnm:= nm;
            MINnome:= nome;
          end;

       writeln(' A pontuacao do mago de nome ', nome ,' e numero ', nm , ' e : ', pt , '; '); // Outputs: mage name, mage number, total score
       writeln(' ');
       writeln(' O mago ', nome , ' gastou ', tt ,' horas para aprender todos os feiti‡os. '); // Outputs: mage name, total spell learning time
       nm:= nm +1;
       writeln(' ');
       writeln(' Para registrar outro mago escreva "0" , caso esse seja o ultimo escreva "1". '); // If input=1, break loop (last mage) 
       readln(opcao);
       nf:=1;
       pt:=0;
       tt:=0;
     until opcao=1;
     writeln(' ');
     writeln(' A maior pontuacao foi : ',MAXp,' ; '); // Show biggest total score
     writeln(' ');
     writeln(' O mago ',MAXnome,' de numero ', MAXnm, ' ficou em primeiro lugar no rank ! '); // Show biggest total score mage
     writeln(' ');
     writeln(' A menor pontua‡ao foi : ',MINp,' '); // Show least total score
     writeln(' ');
     writeln(' O mago ',MINnome,' de numero ', MINnm, ' ficou em ultimo lugar no rank ! '); // Show least total score mage
     readln
   end.













