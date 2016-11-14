program SeminarVerwaltung (input, output);
{Aufgabe 4.3.3 (S.101) - Überprüft, ob eine eingegebene Zahl eine Primzahl ist}
  
    type
    tNatZahlPlus = 1..maxint;
    
    var
    Eingabe : tNatZahlPlus;
    
    function istPrimzahl (p : tNatZahlPlus) : boolean;
    {true, falls p Primzahl ist}
	
		var
		q : tNatZahlPlus;
		
	begin
	  if p < 2 then
	  istPrimzahl := false
	  else
	  begin
	  q := 2;
	  istPrimzahl := true;
	  while istPrimzahl = true and (q <= p - 1) do
	  begin
	    if p mod q = 0 then
	     istPrimzahl := false
	    else
	    q := q + 1;
	  end;
	      
	  end;
	end;

begin
{Zahl einlesen}
  writeln ('Geben sie eine natürliche Zahl > 0 ein: ');
  readln (Eingabe);
  
  if istPrimzahl (Eingabe) then
    writeln (Eingabe, ' ist eine Primzahl')
  else
    writeln (Eingabe, ' ist keine Primzahl');
   
  writeln ('Taste drücken zum Beenden.');
  readln;

end.

