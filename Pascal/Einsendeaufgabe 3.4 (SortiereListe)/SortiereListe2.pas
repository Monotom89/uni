program TesteSortiereListe(input, output);

  type
  tNatZahl = 0..maxint;
  tRefListe = ^tListe;
  tListe = record
             info : tNatZahl;
             next : tRefListe;
           end;

  var
  RefListe : tRefListe;
  
procedure SortiereListe (var ioRefListe : tRefListe);
{ sortiert eine lineare Liste aufsteigend }

	var
	RefSortEnde,
	Umhaengehilfe,
	Sortierhilfe : tRefListe;
	
	begin 
	{terminiert sofort, falls die Liste leer ist}
		if ioRefListe <> nil then
		begin
			{ init }
			RefSortEnde := ioRefListe;
			{Terminiert sofort, wenn die Liste nur aus einem Element besteht,
			* andernfalls wird ein zweites Element einsortiert}
			if ioRefListe^.next <> nil then
			begin 
				UmhaengeHilfe := ioRefListe^.next;
				if UmhaengeHilfe^.info >= ioRefListe^.info then
				RefSortEnde := UmhaengeHilfe
				else {UmhaengeHilfe^.info < ioRefListe^.info}
				begin
					ioRefListe^.next := UmhaengeHilfe^.next;
					UmhaengeHilfe^.next := ioRefListe;
					ioRefListe := UmhaengeHilfe;
					RefSortEnde := ioRefListe^.next;
				end;      
			end; {if ioRefListe^.next <> nil}
		
			{Weitere Elemente einsortieren bis der next-Verweis des letzten 
			Elements der sortierten Liste leer ist}
			while RefSortEnde^.next <> nil do
			begin
				UmhaengeHilfe := RefSortEnde^.next;
				if UmhaengeHilfe^.info >= RefSortEnde^.info then
				{in diesem Fall ist die Sortierung korrekt und der Zeiger, 
				der das Ende der sortierten Liste markiert wird nur um ein 
				Element verschoben}
					RefSortEnde := UmhaengeHilfe
				
				else {Umhaengehilfe^.info < RefSortEnde^.info}
				begin
					if UmhaengeHilfe^.info <= ioRefListe^.info then
					begin
						RefSortEnde^.next := UmhaengeHilfe^.next;
						UmhaengeHilfe^.next := ioRefListe;
						ioRefListe := UmhaengeHilfe;
					end
					else {UmhaengeHilfe^.info > ioRefListe^.info}
					begin
						{Setze Hilfs-Zeiger SortierHilfe auf das Element, 
						hinter dem das neue Element einsortiert werden soll}	
						SortierHilfe := ioRefListe;            
						while SortierHilfe^.next^.info <= Umhaengehilfe^.info do
							SortierHilfe := SortierHilfe^.next;
		
						{einsortieren nach SortierHilfe-Zeiger}
						RefSortEnde^.next := UmhaengeHilfe^.next;
						UmhaengeHilfe^.next := SortierHilfe^.next;
						SortierHilfe^.next := UmhaengeHilfe;
					
					end; {else UmhaengeHilfe^.info > ioRefListe^.info}
				end; {Umhaengehilfe^.info < RefSortEnde^.info}				
			end; {while RefSortEnde^.next <> nil}			 			
		end; {ioRefListe <> nil}  
	end; {SortiereListe}
	
	
procedure Anhaengen (var ioListe : tRefListe;
                        inZahl : tNatZahl);
{ Haengt inZahl an ioListe an }
  var Zeiger : tRefListe;
  

  
begin
  Zeiger := ioListe;
  if Zeiger = nil then
  begin
    new(ioListe);
    ioListe^.info := inZahl;
    ioListe^.next := nil;
  end
  else
  begin
    while Zeiger^.next <> nil do
      Zeiger := Zeiger^.next;
    { Jetzt zeigt Zeiger auf das letzte Element }
    new(Zeiger^.next);
    Zeiger := Zeiger^.next;
    Zeiger^.info := inZahl;
    Zeiger^.next := nil;
  end;
end;

procedure ListeEinlesen(var outListe:tRefListe);
{ liest eine durch Leerzeile abgeschlossene Folge von Integer-
  Zahlen ein und speichert diese in der linearen Liste RefListe. }
  var
  Liste : tRefListe;
  Zeile : string;
  Zahl, Code : integer;
begin
  writeln('Bitte geben Sie die zu sortierenden Zahlen ein.');
  writeln('Beenden Sie Ihre Eingabe mit einer Leerzeile.');
  Liste := nil;
  readln(Zeile);
  val(Zeile, Zahl, Code); { val konvertiert String nach Integer }
  while Code=0 do
  begin
    Anhaengen(Liste, Zahl);
    readln(Zeile);
    val(Zeile, Zahl, Code);
  end; { while }
  outListe := Liste;
end; { ListeEinlesen }

procedure GibListeAus(inListe : tRefListe);
{ Gibt die Elemente von inListe aus }
  var Zeiger : tRefListe;
begin
  Zeiger := inListe;
  while Zeiger <> nil do
  begin
    writeln(Zeiger^.info);
    Zeiger := Zeiger^.next;
  end; { while }
end; { GibListeAus }

begin
  ListeEinlesen(RefListe);
  SortiereListe(RefListe);
  GibListeAus(RefListe);
  readln;
  
end.
