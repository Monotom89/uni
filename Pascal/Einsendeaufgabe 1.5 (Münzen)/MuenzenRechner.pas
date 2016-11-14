program MuenzenRechner (input, output);
{Aufgabe 5 - Nimmt einen Eurocent-Betrag von 1 bis 99 Cent an und stellt den Betrag in möglichst wenigen Münzen dar.}

        var
        Geldbetrag, {Cent}
        Fuenfziger,
        Zwanziger,
        Zehner,
        Fuenfer,
        Zweier,
        Einser: integer;

    begin
      {lese den Geldbetrag ein}
      readln (Geldbetrag);

      {Definiere die Anzahl der Münzen}
      if (Geldbetrag > 0) and (Geldbetrag < 100) then
         begin
         Fuenfziger := Geldbetrag div 50;
         Geldbetrag := Geldbetrag mod 50;
         Zwanziger := Geldbetrag div 20;
         Geldbetrag := Geldbetrag mod 20;
         Zehner := Geldbetrag div 10;
         Geldbetrag := Geldbetrag mod 10;
         Fuenfer := Geldbetrag div 5;
         Geldbetrag := Geldbetrag mod 5;
         Zweier := Geldbetrag div 2;
         Geldbetrag := Geldbetrag mod 2;
         Einser := Geldbetrag div 1;

         {Gebe die Münzenanzahl aus}
         writeln (Fuenfziger,' ',Zwanziger,' ',Zehner,' ',Fuenfer,' ',Zweier,' ',Einser);
         end;

    end.


