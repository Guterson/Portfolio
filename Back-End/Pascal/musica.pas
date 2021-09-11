program musica; // Music

var
 F,G: text;
 linha,antes,depois : string[100];
 nlinhas,loca : integer;


begin
  nlinhas := 1;
  assign(F,'musica.txt');
  reset(F);
  assign(G,'revisada.txt');
  rewrite(G);


  while (not EOF(F)) do
   begin
    readln(F,linha);
     repeat
	    loca := pos ('1',linha);
		if loca<>0 then
		   begin
		     delete (linha,loca,1);
             insert ('a',linha,loca); // Trade each "1" for a "a" until eof
		   end;
      until loca=0;

	  repeat
	    loca := pos ('2',linha);
		if loca<>0 then
		   begin
		     delete (linha,loca,1);
             insert ('e',linha,loca); // Trade each "2" for a "e" until eof
		   end;
      until loca=0;

	  repeat
	    loca := pos ('3',linha);
		if loca<>0 then
		   begin
		     delete (linha,loca,1);
             insert ('i',linha,loca); // Trade each "3" for a "i" until eof
		   end;
      until loca=0;

	  repeat
	    loca := pos ('4',linha);
		if loca<>0 then
		   begin
		     delete (linha,loca,1);
             insert ('o',linha,loca); // Trade each "4" for a "o" until eof
		   end;
      until loca=0;

	  	  repeat
	    loca := pos ('5',linha);
		if loca<>0 then
		   begin
		     delete (linha,loca,1);
             insert ('u',linha,loca); // Trade each "5" for a "u" until eof
		   end;
      until loca=0;


      writeln(nlinhas,' ',linha);
      writeln(G,nlinhas,' ',linha);
      nlinhas := nlinhas + 1;
    end;
  close(F);
  close(G);
  readln;

end.


