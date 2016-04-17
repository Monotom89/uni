program MatrixSummen (input, output);
{ ueberprueft bei einer Matrix von integer-Zahlen, ob
  jede Spaltensumme groesser ist als die Zeilensumme einer
  angegebenen Zeile }

  const
  ZEILENMAX = 3;
  SPALTENMAX = 4;

  type
  tMatrix = array [1..ZEILENMAX, 1..SPALTENMAX] of integer;

  var
  Matrix : tMatrix;
  ZeilenNr,
  SpaltenNr,
  Eingabe : integer;

  function ZeilenSummeKleiner (var inMatrix : tMatrix;
                                   inZeilenNr : integer) : boolean;
  { ergibt true, falls die Summe aller Elemente mit dem
    uebergebenen Zeilenindex nicht groesser ist als jede
    Spaltensumme }
    {Hilfsvariablen}
    var
    i,
    j,
    k,
    ZeilenSumme,
    SpaltenSumme : integer;
    SpaltenSummeGroesser : boolean;
 
  begin    
  
    {init}
    ZeilenSumme := 0;
    SpaltenSumme := 9;
    i := 1;
    j := 1;
    k := 1;
    SpaltenSummeGroesser := true;

    { Berechnen der Summe aller Elemente der übergebenen Zeile }
    For i := 1 to SPALTENMAX do
      begin
        ZeilenSumme := ZeilenSumme + Matrix[inZeilenNr, i];
      end;
      
    writeln;  
    writeln ('ZeilenSumme der Zeile ', inZeilenNr, ': ', ZeilenSumme);
    writeln;  
  
      
    { Berechnen der Spaltensummen und gleichzeitig festlegen
    * der Funktionsausgabe }
    for j := 1 to SPALTENMAX do 
    begin 
      if SpaltenSummeGroesser then      
      begin
        Spaltensumme := 0; { Bei jedem durchlauf zurücksetzen}
        for k := 1 to ZEILENMAX do
          SpaltenSumme := Spaltensumme + inMatrix[k, j];
          
        if SpaltenSumme < ZeilenSumme then
          SpaltenSummeGroesser := false;  

        Writeln ('Summe der ', j, '-ten Spalte: ', Spaltensumme);
      end;   
    end; 
    
    if SpaltenSummeGroesser then
      ZeilenSummeKleiner := true
    else
      ZeilenSummeKleiner := false;
     end; { ZeilenSummeKleiner }
  
begin
  { Matrixelemente einlesen }
  for ZeilenNr := 1 to ZEILENMAX do
    for SpaltenNr := 1 to SPALTENMAX do
      read (Matrix[ZeilenNr, SpaltenNr]);

  repeat
    write ('Welche Zeile soll ueberprueft werden ? (1..',
            ZEILENMAX:1, ') (anderes = Ende) ');
    readln (Eingabe);

    if (Eingabe > 0) and (Eingabe <= ZEILENMAX) then
    begin
      ZeilenNr := Eingabe;
      { hier wird die Funktion ZeilenSummeKleiner aufgerufen }
      if ZeilenSummeKleiner (Matrix,ZeilenNr) then
        writeln ('Jede Spaltensumme ist groesser als die ',
                  'Zeilensumme der ', ZeilenNr:1, '. Zeile.')
      else
        writeln ('Es sind nicht alle Spaltensummen groesser als die ',
                'Zeilensumme der ', ZeilenNr:1, '. Zeile.')
    end;
  until (Eingabe <= 0) or (Eingabe > ZEILENMAX)
end. { MatrixSummen }
