program MaximumKommentiert (input, output);
{Einsendeaufgabe 2.1 - Bestimmt das Minimum in einem Feld von 20 integer-Zahlen}
    
    type
    tIndex = 1..maxint;
    tZahlenFeld = array [tIndex] of integer;
    
    var
    i : tIndex;
    Feld : tZahlenFeld;
    Feldgroesse: integer;
    Maximum : integer;

begin
{ Einlesen des Feldes}

  writeln ('Geben Sie eine Folge von Zahlen ein, von denen das Maximum bestimmt werden soll. 0 beendet die Folge.');
  i := 1;
  Feldgroesse := 0;
  
  repeat 
	readln (Feld[i]);
    i := i + 1;
    Feldgroesse := Feldgroesse + 1;
  until Feld[i-1] = 0;
  
  if Feldgroesse < 1 then
    writeln('Leere Eingabefolge!');
  
    {Maximum bestimmen}
  Maximum := Feld[1];
  for i := 2 to Feldgroesse do
	if Feld[i] > Maximum then
		Maximum := Feld[i];
  
{Minimum und Position ausgeben}
writeln ('Das Maximum ist ', Maximum);
  
  writeln ('Taste drücken zum Beenden.');
  readln;

end.

