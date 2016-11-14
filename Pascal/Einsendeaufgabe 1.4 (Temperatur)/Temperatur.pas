program Temperatur (input, output);
    {Aufgabe 4 - Nimmt eine Temperatureingabe in Fahrenheit und wandelt sie in Celsius um}

        var
        TemperaturFahrenheit,
        TemperaturCelsius : real;

    begin
      {Lese die Temperatur in Fahrenheit ein}
      readln (TemperaturFahrenheit);

      {Wandle die Eingabe in Celsius um}
      TemperaturCelsius := (5*(TemperaturFahrenheit-32))/9;

      {Gebe die Temperatur in Celsius aus}
      writeln (TemperaturCelsius);

    end.


