program MaximumArray (input, output);
{Einsendeaufgabe 2.1 - Bestimmt das Maximum in einem Feld von integer-Zahlen. Diese Lösung wird im virtuellen Studienplatz nicht akzeptiert!}
    
    type
    tIndex = 1..maxint;
    tZahlenFeld = array [tIndex] of integer;
    
    var
    i : tIndex;
    Feld : tZahlenFeld;
    Feldgroesse: integer;
    Maximum : integer;

begin
{Einlesen des Feldes}

  i := 1;
  Feldgroesse := 0;
  
  repeat 
	readln (Feld[i]);
    i := i + 1;
    Feldgroesse := Feldgroesse + 1;
  until Feld[i-1] = 0;
  
  if Feldgroesse < 2 then
    writeln('Leere Eingabefolge!')
  else
  begin
    {Maximum bestimmen}
    Maximum := Feld[1];
    for i := 2 to Feldgroesse do
	  if Feld[i] > Maximum then
		Maximum := Feld[i];
	writeln (Maximum);
  end;
{Minimum und Position ausgeben}
readln;

end.

