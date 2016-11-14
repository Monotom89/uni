program TesteBlattMax (input, output);

type
  tNatZahl = 1..maxint;
  tRefBinBaum = ^tBinBaum;
  tBinBaum = record
               Wert:tNatZahl;
               links:tRefBinBaum;
               rechts:tRefBinBaum
             end;
           
var
  Wurzel : tRefBinBaum;
  blaetterSindMax : Boolean;
  
function BlattMax ( inRefWurzel : tRefBinBaum; pfadMax : tNatZahl) : Boolean;
  { prüft ob alle Blätter des Baumes die Maxima der Pfade zu ihnen sind }
  {pfadMax muss beim ersten Aufrufen mit dem Wert des ersten Knotens im 
  Binärbaum an die Funktion übergeben werden.} 

var
  HilfsBoolean : Boolean;
  HilfsZeiger : tRefBinBaum;
  
  begin
  
    {init}
    HilfsBoolean := true;
    HilfsZeiger := inRefWurzel;
    
    {Prüfe ob der Wert des HilfsZeigers größer ist als PfadMax}
    {Wenn ja, Setze PfadMax auf den Wert des hilfsZeigers}
    if HilfsZeiger^.Wert > pfadMax then
      pfadMax := HilfsZeiger^.Wert;
      
    {Untersuche den Linken Ast, wenn dort ein Element existiert}
    If HilfsZeiger^.links <> nil then
    begin
      {Prüfe, ob das linke Element ein Blatt ist}
      if (HilfsZeiger^.links^.links = nil) and (HilfsZeiger^.links^.rechts = nil) then
      begin
        if HilfsZeiger^.links^.Wert < PfadMax then
          HilfsBoolean := false;
          BlattMax := HilfsBoolean;
      end {Prüfe auf Blatt}
      else {HilfsZeiger^.links ist kein Blatt}
      begin
        HilfsBoolean := BlattMax(HilfsZeiger^.links, pfadmax);
        BlattMax := HilfsBoolean;
      end
    end; {HilfsZeiger^.links <> nil}
    
    If HilfsBoolean then
     {Abbruchbedingung, um die Rekursionstiefe zu begrenzen}
    begin
      if HilfsZeiger^.rechts <> nil then
      {Untersuche den rechten Ast, wenn dort ein Element existiert}
      begin
        {Prüfe auf Blatt}
        If (HilfsZeiger^.rechts^.links = nil) and (HilfsZeiger^.rechts^.rechts = nil) then
        begin
          if HilfsZeiger^.rechts^.Wert < pfadMax then
            BlattMax := false;
        end
        else {HilfsZeiger^.rechts ist kein Blatt}
        begin
          HilfsBoolean := BlattMax(HilfsZeiger^.rechts, pfadMax);
          BlattMax := HilfsBoolean;
        end
      end {HilfsZeiger^.rechts <> nil}
    end {HilfsBoolean = true} 
  end; {BlattMax}


procedure BaumAufbauen (var outWurzel : tRefBinBaum) ;
  var 
    index,
    Zahl : integer;
    elter, neuerKnoten : tRefBinBaum;    
     
  function KnotenVonIndex (baum : tRefBinBaum; index : integer) : tRefBinBaum;
    var
      elter : tRefBinBaum;
    begin
      if (index = 1) then
        KnotenVonIndex := baum
      else
      begin
        elter := KnotenVonIndex(baum, index div 2);
        if ( (index mod 2 ) = 0 ) then
          KnotenVonIndex := elter^.links
        else
          KnotenVonIndex := elter^.rechts
      end;
    end;

  begin
    read (index);

    new (outWurzel);
    read (Zahl);
    outWurzel^.Wert := Zahl;

    read (index);
    while (index <> 0) do
    begin            
      elter := KnotenVonIndex(outWurzel, index div 2);
       
      new (neuerKnoten);
      read (Zahl);    
      neuerKnoten^.Wert := Zahl;  

      if ( (index mod 2 ) = 0 ) then
        elter^.links := neuerKnoten
      else
        elter^.rechts := neuerKnoten;
           
      read (index);      
    end;    
  end; { BaumAufbauen }



begin
  writeln('Bitte Baum in level-order eingeben Eingabeformat: Immer erst der Index eines Knotens, dann dessen Wert:');
  BaumAufbauen (Wurzel);
  
  blaetterSindMax := BlattMax(Wurzel, 1);
  
  if blaetterSindMax then
    writeln ('Alle Blaetter sind groesser als alle Knoten auf den jeweiligen Pfaden zu ihnen.')
  else
    writeln ('Mind. ein Blatt ist nicht groesser als alle Knoten auf seinem Pfad.');

end. { TesteBBKnotenzahl }
