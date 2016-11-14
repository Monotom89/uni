program SeminarVerwaltung (input, output);
{Aufgabe 4.2.1.5 (S.101) - Ließt 12 Studenten und ihren Teilnahme-Status ein und gibt die aktiven Studenten sowie eine liste aller Teilnehmer aus.}

    const
    MAXTEILNEHMER = 12;
    
    type
    tIndex =  1..MAXTEILNEHMER;
    tStudentenFeld = array [tIndex] of integer;
    tStatusFeld = array [tIndex] of char;
    
    var
    Matrikelnummer : tStudentenFeld;
    Status : tStatusFeld;
    i : tIndex;

begin
{ Einlesen d Studenten}

  writeln ('Geben Sie eine maximale Anzahl von ', MAXTEILNEHMER, ' Studenten ein');
  for i := 1 to  MAXTEILNEHMER do
	begin
	writeln ('Geben Sie die Matrikelnummer des ', i, '. Studenten ein');
    readln (Matrikelnummer[i]);
    writeln ('Geben Sie den Status des ', i, '. Studenten ein. "a" für aktiv und "p" für passiv'); 
    readln (Status[i]);
    end;
    
{Aktive Studenten ausgeben}
  writeln;
  writeln ('-----------------');
  writeln ('Liste der aktiven Studenten');
  for i := 1 to MAXTEILNEHMER do
	if Status[i] = 'a' then
		begin
		writeln (Matrikelnummer[i]);
		end;
  writeln ('-----------------');

		
{Liste aller Studenten ausgeben}
  writeln;
  writeln ('-----------------');
  writeln ('Liste aller Studenten: ');
  for i := 1 to MAXTEILNEHMER do
	begin
	writeln (Matrikelnummer[i]);
	end;
  writeln ('-----------------');
  
  
  writeln ('Taste drücken zum Beenden.');
  readln;

end.

