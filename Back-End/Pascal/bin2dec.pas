program base2;

var
ve,vaux,ms :  string;
valid,vc,vc1,i,vaux1,vtot,vtab,erro : INTEGER;

begin
  writeln(' ');
  writeln(' digite o n£mero em base 2 : '); // Input a base2 number
  writeln(' ');
  readln (ve);
  vc:= length(ve);
  vc1:=vc; // Save string size
  vtab:=1;
  vtot:=0;
  i:=1;
  while i<=vc do
   begin
     vaux:= copy(ve, vc1, 1); // Get a bit per loop, from the least significant to the most significant
     val(vaux, vaux1, erro); // Convert char to bit
     if erro<>0 then
       begin
         ms:='numero invalido'; // Invalid string
         break;
       end;
     valid:=0;
      if vaux1=1 then // Compute a '1' bit
         begin
           vtot:=vtot+vtab;
           vc1:=vc1-1;
           vtab:=vtab*2;
           i:=i+1;
           valid:=1;
         end;
      if vaux1=0 then // "Compute" a '0' bit
         begin
           vc1:=vc1-1;
           vtab:=vtab*2;
           i:=i+1;
           valid:=1;
         end;
       if valid=0 then
         begin
          ms:='numero invalido'; // Invalid number
          break;
         end;
   end;
   if ms='numero invalido' then
      begin
        writeln(' ');
        writeln(' n£mero inv lido '); // Invalid input interface
        readln
      end
   else
      begin
        writeln(' ');
        writeln(' o numero ‚ -->  ', vtot); // Valid conversion interface
        readln
      end;
end.


