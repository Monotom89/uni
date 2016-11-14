import java.util.*;

public class BinaryPrinterInt
{
	public static void main(String[] args)
	{
	//Nimmt vom nutzer Eine Integerzahl und eine Basis entgegen und gibt die B-adischer Darstellung der Integerzahl aus
		Scanner leser = new Scanner(System.in);
		
		System.out.printf("Bitte geben sie die Dezimalzahl ein, die umgewandelt werden soll: ");
		int x = leser.nextInt();
		System.out.printf("Bitte geben sie die Basis ein (2 für Binär, 8 für Oktär, 10 für Dezimal etc): ");
		int B = leser.nextInt();
		Umwandler(x, B);
		
		leser.close();
		
	}
	
	private static int[] Umwandler(int x, int B)
	{
		//Nimmt eine integerzahl x und eine Basis B entgegen und entwickelt die Darstellung der Zahl in B-adischer Darstellung
		
		int potenz = 0;
		int rest;
		boolean kleiner = true;

		 //höchste Potenz n finden
		do
		{
			if(Math.pow(B, potenz) < x)
			{	
				System.out.printf("%d hoch %d = %.2f %n",  B, potenz, Math.pow(B, potenz));
				potenz++;
			}
			else
				kleiner = false;
		}
		while(kleiner);
		System.out.printf("%d hoch %d = %.2f %n",  2, potenz, Math.pow(B, potenz));
		System.out.printf("%n%n----------------------%n%n");
		int n = potenz;
		
		
		//entwickeln
		rest = x;
		int[] bin = new int[potenz];
		for(int i=0; i<n; i++)
		{
			bin[i] = (int) (rest / Math.pow(B, potenz-1));
			System.out.printf("%d / %.0f = %d Rest", rest, Math.pow(B, potenz-1), bin[i]);
			rest = x % (int) Math.pow(B, potenz-1);
			System.out.printf(" %d%n", rest);
			potenz--;			
		}
		System.out.printf("%n%n----------------------%n%n");
		
		//Ergebnis ausgeben
		System.out.printf("Die Zahl %d in %d-adischer Darstellung:%n", x, B);
		for(int i=0; i<n; i++)
		{
			System.out.printf("%d ",  bin[i]);
		}
		
		return bin;
		
	}
}
