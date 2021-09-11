program procedimento_inversao; // Vector inversion
 var
  i,n : byte;
  v : array [1..10] of integer;
  aux : integer;

 procedure inverte_vetor(var  v : array of integer; n : byte );
  var
   i,c : byte;
   a,b : integer;
   d : real;
  begin
    i := 1;
    c := n; // Vector's last element index
    d := n/2; // Number of pairs of elements to be exchanged
    while i<=d do
    begin
     a := v[i]; // Save values
     b := v[c]; 
     v[i] := b; // Exchange values
     v[c] := a;
     c := c - 1;
	 i := i +1;
    end;
  end;

 begin
  (* readln(n); *)
  n := 4; // Vector size
  i := 1;
  while i<=n do
   begin
    writeln(' Digite a posicao ',i,' do vetor v'); // Input a entry for the vector per loop
    readln( aux );
    v[i] := aux;
    i := i + 1;
   end;
  inverte_vetor( v,n ); // Vector inversion
  for i := 1 to n do
   begin
    write( v[i],',' ); // Show inverted vector 
   end;
  readln
 end.

