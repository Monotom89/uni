program FeldSort4 (input, output);
{Sortiert ein einzulesendes Feld bis zur Größe von 100 Werten} 

	const
	MAXFELDGROESSE = 100;
	
	type
	tIndex = 1..MAXFELDGROESSE;
	tFeld = array [tIndex] of integer;
	
	var
	EingabeFeld : tFeld;
	Feldgroesse : integer;
	idx : tIndex;
	
	procedure FeldSortieren (inFeldgroesse : tIndex;
						 var ioSortFeld : tFeld);
						 
			var
			MinPos,
			i : tIndex;
			
			function FeldMinimumPos (inFeld : tFeld; 
									 inVon,
									 inBis : tIndex) : tIndex;
			{bestimmt die Position des Minimums im 
			* Feld zwischen inVon und inBis}
			
			var
			MinimumPos,
			j : tindex;
				
			begin
			MinimumPos := inVon;
				for j := inVon + 1 to inBis do
					if inFeld[j] < inFeld[MinimumPos] then
						MinimumPos := j;
						
			FeldMinimumPos := MinimumPos;	
			
			end; {FeldMinimumPos}
			
			procedure vertauschen (var ioHin, ioHer : integer);
			{vertauscht die beiden Parameter}
			
			var
			Tausch : integer;
				
			begin
				Tausch := ioHin;
				ioHin := ioHer;
				ioHer := Tausch;
			end; {vertauschen}
			
			begin {FeldSortieren}
			
				for i := 1 to inFeldgroesse - 1 do
				begin
					MinPos := FeldMinimumPos (ioSortFeld, i, inFeldgroesse);
					{Minimum gefunden. Jetzt die Position mit der Position i vertauschen}
					
					vertauschen (ioSortfeld[MinPos], ioSortfeld[i]);	
				
				end {for}
				
			end; {FeldSortieren}
			
	begin {FeldSort4}
		{Einlesen der Feldgroesse}
		repeat
		writeln('Geben Sie eine Feldgröße zwischen 1 und ', MAXFELDGROESSE, ' ein');
		readln(Feldgroesse)
		until (1 <= Feldgroesse) and (Feldgroesse <= MAXFELDGROESSE);
		
		{Einlesen des Feldes}
		for idx := 1 to  Feldgroesse do
			readln(EingabeFeld[idx]);
			
		{Feld sortieren}
		FeldSortieren(Feldgroesse, EingabeFeld);
		
		{Sortiertes Feld ausgeben}
		for idx := 1 to Feldgroesse do
			writeln (EingabeFeld[idx]);
			
		readln();
			
	end. {FeldSort3}
				
				
			
