program Minimum (input, output);
{Aufgabe 4.2.1.3 (S.99) - Bestimmt das Minimum in einem Feld von 20 integer-Zahlen}

    const
    FELDGROESSE = 20;
    
    type
    tIndex =  1..FELDGROESSE;
    tZahlenFeld = array [tIndex] of integer;
    
    var
    Feld : tZahlenFeld;
    Min : integer;
    Position : tIndex;
    i : tIndex;

begin
{ Einlesen des Feldes}

  writeln ('Geben Sie ', FELDGROESSE:2, ' Werte ein');
  for i := 1 to  FELDGROESSE do
    readln (Feld[i]); 
    
    {Minimum bestimmen}
  Min := Feld[1];
  Position := 1;
  for i := 2 to FELDGROESSE do
	if Feld[i] < Min then
		begin
		Min := Feld[i];
		Position := i;
		end; 
  
{Minimum und Position ausgeben}
writeln ('Das Minimum ist ', Min);
writeln ('Die Position des Minimums im Feld ist ', Position);
  
  writeln ('Taste drücken zum Beenden.');
  readln;

end.

