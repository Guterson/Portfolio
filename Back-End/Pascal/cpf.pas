program _CPF_;
var
  CPF,CPF1,CPF2,CPF3,CPF4,CPF5,CPF6,CPF7,CPF8,CPF9,CPF10,CPF11 : string;
  tam,aux_1,aux_2,erro,dv1,dv2,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11 : integer;
begin
  writeln(' ');
  writeln(' Digite seu CPF  '); // Input a CPF: Physical Person Registration
  writeln(' ');
  read(CPF);
  tam:=length(CPF);
if tam=11 then // Test string size
  begin

  CPF1:=copy (CPF ,1 ,1);
  val(CPF1, d1 , erro);
  CPF2:=copy (CPF ,2 ,1);
  val(CPF2, d2 , erro);
  CPF3:=copy (CPF ,3 ,1);
  val(CPF3, d3 , erro);
  CPF4:=copy (CPF ,4 ,1);
  val(CPF4, d4 , erro);
  CPF5:=copy (CPF ,5 ,1);
  val(CPF5, d5 , erro);
  CPF6:=copy (CPF ,6 ,1);
  val(CPF6, d6 , erro);
  CPF7:=copy (CPF ,7 ,1);
  val(CPF7, d7 , erro);
  CPF8:=copy (CPF ,8, 1);
  val(CPF8, d8 , erro);
  CPF9:=copy (CPF ,9 ,1);
  val(CPF9, d9 , erro);
  CPF10:=copy (CPF ,10 ,1);
  val(CPF10, d10 , erro);
  CPF11:=copy (CPF ,11 ,1);
  val(CPF11, d11 , erro);
  aux_1:=( (10*d1) + (9*d2) + (8*d3) + (7*d4) + (6*d5) + (5*d6) + (4*d7) + (3*d8) + (2*d9) );
    if
      (aux_1 mod 11)<2 // First validation number logic
    then
      begin
        dv1:= 0
      end
    else
      begin
        dv1:= 11-(aux_1 mod 11);
      end;
    aux_2:=( (11*d1) + (10*d2) + (9*d3) + (8*d4) + (7*d5) + (6*d6) + (5*d7) + (4*d8) + (3*d9) + (2*d10) );
   if
      (aux_2 mod 11)<2 // Second validation number logic
    then
      begin
        dv2:= 0
      end
    else
      begin
        dv2:= 11-(aux_2 mod 11);
      end;
   if
      (dv1=d10)and(dv2=d11) // Validation numbers verification
   then
      begin
        writeln(' ');
        writeln(' CPF valido '); // Valid CPF
      end
   else
      begin
        writeln(' ');
        writeln(' CPF invalido '); // Invalid CPF
      end;
  end
else
  begin
    writeln(' ');
    writeln(' N£mero de digitos incorreto ! '); // Invalid input 
  end;
  readln;
  readln;
end.

