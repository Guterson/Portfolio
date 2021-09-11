program jogo_velha; // Tic-tac-toe
 var
  aux3,aux2,aux : string;
  i : integer;
  p : array [1..9] of integer;

  begin
   	writeln(p[1],'|',p[2],'|',p[3]);
        writeln('-|-|-');
	writeln(p[4],'|',p[5],'|',p[6]);
	writeln('-|-|-');
	writeln(p[7],'|',p[8],'|',p[9]);

   aux2 :='1';
   aux  :='6';
   p[1] :=9;
   p[2] :=9;
   p[3] :=9;
   p[4] :=9;
   p[5] :=9;
   p[6] :=9;
   p[7] :=9;
   p[8] :=9;
   p[9] :=9;

 repeat
      if aux='6' then // No winning combination yet
      repeat;
	     begin
            writeln(' Jogador X digite a posicao de 1 a 9 '); // Choose a position
            readln(i);
            if p[i]=9 then
              begin
                p[i] := 1;
		aux2 := '0';
                writeln(p[1],'|',p[2],'|',p[3]);
	        writeln('-|-|-');
                writeln(p[4],'|',p[5],'|',p[6]);
	        writeln('-|-|-');
	        writeln(p[7],'|',p[8],'|',p[9]);
	        if p[1]+p[2]+p[3] = 3 then aux :='1'; // Player 1 winning combination
	        if p[1]+p[5]+p[9] = 3 then aux :='1';
	        if p[1]+p[4]+p[7] = 3 then aux :='1';
	        if p[2]+p[5]+p[8] = 3 then aux :='1';
	        if p[3]+p[5]+p[7] = 3 then aux :='1';
	     	if p[3]+p[6]+p[9] = 3 then aux :='1';
	     	if p[4]+p[5]+p[6] = 3 then aux :='1';
	     	if p[7]+p[8]+p[9] = 3 then aux :='1';
	     	if p[1]+p[2]+p[3] = 0 then aux :='0'; // Player 2 winning combination 
	     	if p[1]+p[5]+p[9] = 0 then aux :='0';
	     	if p[1]+p[4]+p[7] = 0 then aux :='0';
	     	if p[2]+p[5]+p[8] = 0 then aux :='0';
	     	if p[3]+p[5]+p[7] = 0 then aux :='0';
	     	if p[3]+p[6]+p[9] = 0 then aux :='0';
	     	if p[4]+p[5]+p[6] = 0 then aux :='0';
	     	if p[7]+p[8]+p[9] = 0 then aux :='0';
              end
            else
               writeln(' Posicao ja ocupada, escolha outra'); // Position already taken
	      end;
	  until aux2='0'; // Turn passing
      if aux='6' then
      repeat
	     begin
            writeln(' Jogador O digite a posicao de 1 a 9 ');
            readln(i);
            if p[i]=9 then
              begin
                p[i] := 0;
		aux2 := '1';
		writeln(p[1],'|',p[2],'|',p[3]);
		writeln('-|-|-');
		writeln(p[4],'|',p[5],'|',p[6]);
		writeln('-|-|-');
		writeln(p[7],'|',p[8],'|',p[9]);
	        if p[1]+p[2]+p[3] = 3 then aux :='1';
	        if p[1]+p[5]+p[9] = 3 then aux :='1';
	        if p[1]+p[4]+p[7] = 3 then aux :='1';
	        if p[2]+p[5]+p[8] = 3 then aux :='1';
	        if p[3]+p[5]+p[7] = 3 then aux :='1';
	     	if p[3]+p[6]+p[9] = 3 then aux :='1';
	     	if p[4]+p[5]+p[6] = 3 then aux :='1';
	     	if p[7]+p[8]+p[9] = 3 then aux :='1';
	     	if p[1]+p[2]+p[3] = 0 then aux :='0';
	     	if p[1]+p[5]+p[9] = 0 then aux :='0';
	     	if p[1]+p[4]+p[7] = 0 then aux :='0';
	     	if p[2]+p[5]+p[8] = 0 then aux :='0';
	     	if p[3]+p[5]+p[7] = 0 then aux :='0';
	     	if p[3]+p[6]+p[9] = 0 then aux :='0';
	     	if p[4]+p[5]+p[6] = 0 then aux :='0';
	     	if p[7]+p[8]+p[9] = 0 then aux :='0';
             end
	 else
               writeln(' Posicao ja ocupada, escolha outra');
		  end;
        until aux2='1';


until aux<>'6';

      begin
       if aux = '1' then
          writeln(' Jogador X vecendor') // Player 1 wins
       else
         if aux = '0'  then
          writeln( ' Jogador O vecendor') //  Player 2 wins
        else
     	    writeln( ' Deu Velha') // It's a draw
	 end;
         readln
end.

