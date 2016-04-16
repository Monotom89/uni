program MaximumArray (input, output);
{Einsendeaufgabe 2.1 - Bestimmt das Maximum in einem Feld von integer-Zahlen. 
* Die Eingabe wird mit 0 terminiert. Die 0 selbst wird nicht als Teil der Folge erkanntkzeptiert}
    
    type
    tIndex = 1..maxint;
    
    var
    Eingabe,
    Maximum: integer;

begin

{Einlesen der ersten Zahl}
  readln (Eingabe);
  Maximum := Eingabe;
  
  if Eingabe = 0 then
    writeln('Leere Eingabefolge!')
    
  else
  begin
  {Einlesen weiterer Zahlen}
    while Eingabe <> 0 do
	  begin
	  if Eingabe > Maximum then
	  Maximum := Eingabe;
	  
	  readln (Eingabe);
	  {Maximum bestimmen}
	  
	  end;
  writeln (Maximum);  
  end;
	  
readln;

end.

